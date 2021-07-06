package com.homegym.controller.trainerboard;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import java.util.List;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.homegym.biz.trainerboard.TrainerAttachVO;
import com.homegym.biz.trainerboard.TrainerBoardService;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.biz.trainerboard.TrainerCriteria;
import com.homegym.biz.trainerboard.TrainerPageDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/trainer/*")
public class TrainerBoardController {

	@Autowired
	private TrainerBoardService boardService;

	// 글 등록
	// http://localhost:8090/trainer/tbUpdate.do
	@GetMapping("/tbWrite")
	public String getTbWrite(HttpServletRequest request, HttpSession session, TrainerBoardVO vo) {

		System.out.println("게시판 작성하러하기");

		return "trainer/tbWrite";

	}

	@PostMapping("/tbWrite")
	@ResponseBody
	public String insertTbWrite(HttpServletRequest request, TrainerBoardVO vo) throws Exception {

		//System.out.println("게시글 작성");
		//System.out.println(vo);
		
		log.info("게시글 작성");
		log.info(vo);
		
		
		// 해시태그 저장
		String[] tagList = vo.getTagList();
		System.out.println(Arrays.toString(tagList));

		HttpSession session = request.getSession();

		String mainFileName = session.getAttribute("mainFileName").toString();
		List<String> fileNameList = (List<String>) session.getAttribute("fileNameList");

		System.out.println(mainFileName);
		for (int i = 0; i < fileNameList.size(); i++) {
			System.out.println(fileNameList.get(i));
		}

		vo.setTbImg(mainFileName);

		if (tagList.length == 1) {

			vo.setTbActivTag1(tagList[0]);

		} else if (tagList.length == 2) {

			vo.setTbActivTag1(tagList[0]);
			vo.setTbActivTag2(tagList[1]);

		} else if (tagList.length == 3) {
			vo.setTbActivTag1(tagList[0]);
			vo.setTbActivTag2(tagList[1]);
			vo.setTbActivTag3(tagList[2]);
		}
		// 해시태그 끝

		// 사진 업로드
		if (fileNameList.size() == 1) {
			vo.setTbPhoto1(fileNameList.get(0));
		} else if (fileNameList.size() == 2) {
			vo.setTbPhoto1(fileNameList.get(0));
			vo.setTbPhoto2(fileNameList.get(1));
		} else if (fileNameList.size() >= 3) {
			vo.setTbPhoto1(fileNameList.get(0));
			vo.setTbPhoto2(fileNameList.get(1));
			vo.setTbPhoto3(fileNameList.get(2));
		}

		boardService.getTbWrite(vo);

		System.out.println("게시판 작성완료");

		return "OK";

	}

	// 글 수정
	// http://localhost:8090/trainer/tbUpdate.do
	@GetMapping("/tbUpdate")
	public String getTbUpdate(@RequestParam("tno") int tno, HttpServletRequest request, HttpSession session, TrainerBoardVO vo, Model model) {
		
		System.out.println("게시판 수정하기");
		log.info("update vo : " + vo);
		//boardService.getTbUpdate(vo);
		
		TrainerBoardVO trainerBoardVO = boardService.getTbDetail(tno);
		model.addAttribute("trainerBoard", trainerBoardVO);
		
		return "trainer/tbUpdate";

	}

	@PostMapping("/tbUpdater")
	public String getTbUpdater(HttpServletRequest request, HttpSession session, TrainerBoardVO vo) {

		System.out.println("게시판 수정하기");
		boardService.getTbUpdate(vo);
		System.out.println("게시판 수정완료");
		return "redirect:/trainer/tbList.do";
	}

	// 글상세페이지
	// http://localhost:8090/trainer/tbDetail.do
	@GetMapping("/tbDetail")
	public String getTbDetail(HttpServletRequest request, HttpSession session, TrainerBoardVO vo, Model model) {

		System.out.println("상세 페이지 이동");

		TrainerBoardVO trainerBoardVO = boardService.getTbDetail(vo.getTno());
		model.addAttribute("trainerBoard", trainerBoardVO);

		return "trainer/tbDetail";

	}

	// 목록조회
	// http://localhost:8090/trainer/tbList.do
	/*
	 * @GetMapping("/tbList") public String getTbList(HttpServletRequest request,
	 * HttpSession session, TrainerBoardVO vo, Model model) {
	 * 
	 * System.out.println("목록조회"); List<TrainerBoardVO> trainerBoardVO =
	 * boardService.getTbList(vo); model.addAttribute("trainerBoardList",
	 * trainerBoardVO); return "trainer/tbList"; }
	 */

	// 페이징
	@GetMapping("/tbList")
	public String getTbLists(TrainerCriteria cri, Model model, TrainerBoardVO vo) {

		System.out.println("tbList : " + cri);

		// getTbListPaging은 resultType이 hashmap인 객체들을 담은 List
		System.out.println(vo.getTno());
		model.addAttribute("trainerBoardList", boardService.getTbListPaging(vo, cri));

		int total = boardService.getTotal(cri);
		model.addAttribute("pageMaker", new TrainerPageDTO(cri, total));

		return "/trainer/tbList";
	}

	// ajax 파일 업로드

	// 다중 파일 업로드 영역(자기소개 사진 업로드)
	@PostMapping(value = "/uploadAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<TrainerAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile, HttpServletRequest request, HttpSession session) {

		// 최종 결과를 담을 리스트
		List<TrainerAttachVO> list = new ArrayList<>();
		
		
		//getRealPath("/") : webapp 폴더까지
		String imgUploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "/resources/imgUpload/";
		String uploadFolder = imgUploadPath + attachPath;
		//String fileName = null;
		
		/*
		if (file != null) {
			// getOriginalFilename() : 파일이름을 String 값으로 반환
			File uploadFile = new File(imgUploadPath + attachPath + file.getOriginalFilename());
			// transfertTo : 파일 저장
			file.transferTo(uploadFile);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "basicImg.png";
		}
		
		// imagepath : /resources/imgUpload/파일명
		vo.setImagePath(attachPath + file.getOriginalFilename());

		paramMap.put("memberId", vo.getMemberId());
		paramMap.put("imagePath", vo.getImagePath());
		// paramMap.put("userThumbImg", vo.getUserThumbImg());

		memberService.userImgUpload(paramMap);

		// return "redirect:/user/mypage/profile_update.do";
		*/
		
		
		
		
		//String uploadFolder = session.getServletContext().getRealPath("/resources/assets/images/trainer/");
		//String uploadFolder = "D:/upload/";

		// 상세페이지에서 보여줄 서브 사진
		// getFolder 메서드는 년/월/일 형식의 폴더 구조를 생성해 줌
//		String uploadFolderPath = getFolderSub();

		// uploadFolder의 폴더 경로에 uploadFolderPath에 대한 객체 생성(경로 설정)
		File uploadPath = new File(uploadFolder);
//		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs(); // 해당 경로에 폴더 생성
		}

		List<String> fileNameList = new ArrayList<String>();

		for (MultipartFile multipartFile : uploadFile) {

			TrainerAttachVO attachVO = new TrainerAttachVO();

			log.info("----------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			// 익스플로러 파일 이름 앞의 경로를 제거
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachVO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			// 업로드 파일 이름을 uuid를 활용하여 파일명 변경
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			fileNameList.add(uploadFileName);
			//fileNameList.add(uploadFolder + uploadFileName);
//			fileNameList.add(uploadFolder + uploadFolderPath + uploadFileName);

			try {
				// 파일 객체 생성
				File saveFile = new File(uploadPath, uploadFileName);

				multipartFile.transferTo(saveFile); // 업로드한 파일을 특정 파일로 저장

				// 데이터베이스에 uuid와 uploadPath(파일경로) 저장
				attachVO.setUuid(uuid.toString());
				attachVO.setUploadPath(uploadFolder);
				//attachVO.setUploadPath("D:/upload/");
				
//				attachVO.setUploadPath(uploadFolderPath);

				// 이미지 파일인지 체크
				if (checkImageType(saveFile)) {

					attachVO.setFileType(true);

					// 주어진 File 객체가 가르키는 파일을 쓰기 위한 FileOutputStream 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					// 섬네일 이미지 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					// 생성 후 close() 실행
					thumbnail.close();

				}

				// 리스트에 결과를 담아준다.
				list.add(attachVO);

			} catch (Exception e) {
				log.error(e.getMessage());
			} // end try
		} // end for

		session.setAttribute("fileNameList", fileNameList);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 서버에서 자기소개 섬네일 가져오기
	@GetMapping("/display.do")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);
		System.out.println("여기지?");
		//File file = new File(("D:/upload/") + fileName);
		File file = new File(fileName);
		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 서버에서 첨부파일 삭제하기
	@PostMapping("/deleteFile.do")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type, HttpServletRequest request, HttpSession session) {

		log.info("deleteFile: " + fileName);

		File file;

		try {
			// 한글이름의 파일일 경우를 대비해서 URLDecoder.decode() 활용
			
			//getRealPath("/") : webapp 폴더까지
			String imgUploadPath = request.getSession().getServletContext().getRealPath("/");
			String attachPath = "/resources/imgUpload/";
			String uploadFolder = imgUploadPath + attachPath;
			
			//String uploadFolder = session.getServletContext().getRealPath("/resources/assets/images/trainer/");
			file = new File(uploadFolder + URLDecoder.decode(fileName, "UTF-8"));
			//file = new File("D:/upload/" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete(); // 파일 삭제

			// 이미지 파일일 경우, 섬네일의 원본파일도 제거 실행시켜주어야 함
			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	/*
	 * // 대표사진 저장될 파일 경로 생성하기 private String getFolderMain() {
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 * 
	 * Date date = new Date();
	 * 
	 * String str = sdf.format(date);
	 * 
	 * // 임시 test str = str + "-main";
	 * 
	 * return str.replace("-", File.separator); }
	 */

	/*
	 * // 자기소개 사진 저장될 파일 경로 생성하기 private String getFolderSub() {
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 * 
	 * Date date = new Date();
	 * 
	 * String str = sdf.format(date);
	 * 
	 * // 임시 test str = str + "-sub";
	 * 
	 * return str.replace("-", File.separator); }
	 */
	private boolean checkImageType(File file) {

		try {

			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	@GetMapping("/uploadForm.do")
	public void uploadForm() {

		log.info("upload form");
	}

	@PostMapping("uploadFormAction.do")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model, HttpServletRequest request, HttpSession session) {
		
		//getRealPath("/") : webapp 폴더까지
		String imgUploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "/resources/imgUpload/";
		String uploadFolder = imgUploadPath + attachPath;
		
		//String uploadFolder = session.getServletContext().getRealPath("/resources/assets/images/trainer/");
		//String uploadFolder = "D:/upload/";


		for (MultipartFile multipartFile : uploadFile) {

			log.info("==========================");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

	@GetMapping("/uploadAjax.do")
	public void uploadAjax() {

		log.info("upload ajax");
	}

	/* =================================================================== */
	// 단일 파일 (대표사진 등록)
	@PostMapping(value = "/uploadAjaxActionMain.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<TrainerAttachVO>> uploadAjaxPostMain(@RequestParam("tbImg") MultipartFile file,
			HttpServletRequest request, HttpSession session) throws Exception {
		// public ResponseEntity<List<TrainerAttachVO>>
		// uploadAjaxPostMain(MultipartFile[] uploadFile) {

		List<TrainerAttachVO> list = new ArrayList<>();
		
		// getRealPath("/") : webapp 폴더까지
		String imgUploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "/resources/imgUpload/";
		String uploadFolder = imgUploadPath + attachPath;

		//String uploadFolder = session.getServletContext().getRealPath("/resources/assets/images/trainer/");
		//String uploadFolder = "D:/upload/";
		// String uploadFolder = "/Users/soon/Desktop/upload";

		/* String uploadFolderPath = getFolderMain(); */
		// String uploadFolderPath = getFolder();

		// make folder ---------
		File uploadPath = new File(uploadFolder);
		/*
		 * File uploadPath = new File(uploadFolder, uploadFolderPath);
		 */ log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		TrainerAttachVO attachVO = new TrainerAttachVO();

		log.info("----------------------------");
		log.info("Upload File Name: " + file.getOriginalFilename());
		log.info("Upload File Size: " + file.getSize());

		String uploadFileName = file.getOriginalFilename();

		// IE has file path
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		log.info("only file name: " + uploadFileName);
		attachVO.setFileName(uploadFileName);

		UUID uuid = UUID.randomUUID();

		uploadFileName = uuid.toString() + "_" + uploadFileName;

		String mainFileName = uploadFileName;
		//String mainFileName = uploadFolder + uploadFileName;
		// String mainFileName = uploadFolder + uploadFolderPath + uploadFileName;

		try {
			// File saveFile = new File(uploadFolder, uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);
			file.transferTo(saveFile);

			attachVO.setUuid(uuid.toString());
			attachVO.setUploadPath(uploadFolder);
			//attachVO.setUploadPath("D:/upload/");
			// attachVO.setUploadPath(uploadFolderPath);

			// check image type file
			if (checkImageType(saveFile)) {

				attachVO.setFileType(true);

				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

				Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100, 100);

				thumbnail.close();

			}

			session.setAttribute("mainFileName", mainFileName);
			// add to List
			list.add(attachVO);

		} catch (Exception e) {
			log.error(e.getMessage());
		} // end try

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 서버에서 섬네일 가져오기
	@GetMapping("/display/main.do")
	@ResponseBody
	public ResponseEntity<byte[]> getFileMain(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File(fileName);
		
		System.out.println("여기냐");
		// File file = new File(("D:/upload") + fileName);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {

			//HTTPHeader 객체를 생성하여 헤더에 ""CONTENT_TYPE"를 추가 (이미지임을 알려주기 위함)
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

}
