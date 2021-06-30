package com.homegym.controller.homegym;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.homegym.biz.homegym.HomegymAttachVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	
	// 파일 업로드
	@PostMapping(value= "/uploadAjaxAction.do",  produces = MediaType
			.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<HomegymAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile){
		
		// 최종 결과를 담을 list
		List<HomegymAttachVO> list = new ArrayList<>();
		
		String uploadFolder = "/Users/soon/Desktop/upload";
		
		// getFolder 메서드는 년/월/일 형식의 폴더 구조를 만들어낸다. 
		String uploadFolderPath = getFolder();
		
		// uploadFolder의 폴더경로에 uploadFolerPath라는 파일에 대한 객체를 생성한다. 경로설정
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs(); // 해당경로에 폴더를 만든다
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			HomegymAttachVO attachVO = new HomegymAttachVO();
					
			log.info("----------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//익스플로어에서는 파일 이름 앞에 경로가 붙어있어서 제거해야함
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachVO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			// 업로드 파일 이름은 uuid_파일이름이 된다. 
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				// File saveFile = new File(uploadFolder, uploadFileName);
				// uploadPath(파일경로)에 uploadFileName(파일이름)의 파일 객체를 생성
				File saveFile = new File(uploadPath, uploadFileName);
				
				// **업로드한 파일을 특정 파일로 저장한다**
				multipartFile.transferTo(saveFile);
				
				// 데이터베이스에 uuid와 uploadPath(파일경로) 저장
				attachVO.setUuid(uuid.toString());
				attachVO.setUploadPath(uploadFolderPath);
				
				// 이미지 파일인지 확인
				if(checkImageType(saveFile)) {
					
					attachVO.setFileType(true);
					
					// 주어진 File 객체가 가르키는 파일을 쓰기위한 FileOutputStream 생성
					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, "s_" + uploadFileName));
					
					// 섬네일 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream()
							, thumbnail, 100, 100);
					
					// 닫아주어야한다. 
					thumbnail.close();
					
				}
				
				// list에 최종 결과를 담아준다.
				list.add(attachVO);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			} // try문 종료
		} // for문 종료
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 서버에서 섬네일 가져오기
	@GetMapping("/display.do")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		log.info("fileName: " + fileName);
		
		File file = new File(("/Users/soon/Desktop/upload/") + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 서버에서 첨부파일 삭제하기
	@PostMapping("/deleteFile.do")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			
			// 한글이름의 파일일 경우를 위해서 URLDecoder.decode 메서드 활용한다
			file = new File("/Users/soon/Desktop/upload/" + URLDecoder.decode(fileName, "UTF-8"));
			
			// 파일 삭제
			file.delete();
			
			// 이미지 파일일 경우 섬네일의 원본파일도 제거해주어야 한다.
			if(type.equals("image")) {
				
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				log.info("largeFileName: " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String> ("deleted", HttpStatus.OK);
	}
	
	// 저장될 파일 경로 만들기
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	// 이미지파일인지 체크 
	private boolean checkImageType(File file) {
		
		try {
			
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	@GetMapping("/uploadForm.do")
	public void uploadForm() {
		
		log.info("upload form");
	}
	
	@PostMapping("uploadFormAction.do")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "/Users/soon/Desktop/upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("==========================");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	@GetMapping("/uploadAjax.do")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
}
