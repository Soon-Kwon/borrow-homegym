package com.homegym.controller.trainerboard;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymAttachVO;
import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.homegym.PageDTO;
import com.homegym.biz.trainerboard.TrainerBoardService;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.biz.trainerboard.TrainerCriteria;
import com.homegym.biz.trainerboard.TrainerPageDTO;
import com.homegym.biz.trainerboard.UploadFileUtils;

import lombok.extern.log4j.Log4j;

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
	
	//파일업로드
	// 게시글 파일 업로드
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) {
        ResponseEntity<String> entity = null;
        try {
            String savedFilePath = UploadFileUtils.uploadFile(file, request);
            entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
	    
	 // 게시글 첨부파일 출력
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception {

        HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fileName); // Http 헤더 설정 가져오기
        String rootPath = UploadFileUtils.getRootPath(fileName, request); // 업로드 기본경로 경로

        ResponseEntity<byte[]> entity = null;

        // 파일데이터, HttpHeader 전송
        try (InputStream inputStream = new FileInputStream(rootPath + fileName)) {
            entity = new ResponseEntity<>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
	
	@PostMapping("/tbWriter")
	public String insertTbWrite(HttpServletRequest request, HttpSession session, TrainerBoardVO vo) throws Exception {
		
		System.out.println("게시글 작성");
		System.out.println(vo);
		
		String[] tagList = vo.getTagList();
		System.out.println(Arrays.toString(tagList));
		
		if (tagList.length == 1){
			
			vo.setTbActivTag1(tagList[0]);
			
		} else if(tagList.length == 2) {
			
			vo.setTbActivTag1(tagList[0]);
			vo.setTbActivTag2(tagList[1]);
			
		} else if(tagList.length == 3) {
			vo.setTbActivTag1(tagList[0]);
			vo.setTbActivTag2(tagList[1]);
			vo.setTbActivTag3(tagList[2]);
		}
		
		boardService.getTbWrite(vo);
		int tno = boardService.getTno(vo);
		vo.setTno(tno);
		
		String[] files = vo.getFiles();
		
		if(files != null) {
			vo.setTbPhoto1(files[0]);
			vo.setTbPhoto2(files[1]);
			vo.setTbPhoto3(files[2]);
			
			boardService.addFile(vo);
		}
		System.out.println("게시판 작성완료");
		
		return "redirect:/trainer/tbList.do";
		
	}

	// 글 수정
	// http://localhost:8090/trainer/tbUpdate.do
	@GetMapping("/tbUpdate")
	public String getTbUpdate(HttpServletRequest request, HttpSession session, TrainerBoardVO vo, Model model) {

		System.out.println("게시판 수정하기");
		boardService.getTbUpdate(vo);
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
	
	//페이징
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


}
