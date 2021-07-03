package com.homegym.controller.homegym;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymAttachVO;
import com.homegym.biz.homegym.HomegymReviewVO;
import com.homegym.biz.homegym.HomegymService;
import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.homegym.PageDTO;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/homegym/*")
@Log4j
public class HomegymController {
	
	@Autowired
	private HomegymService homegymService;
	

	private static final String UPLOAD_FOLDER = "C:/Users/silve/Desktop/Upload/";
	// private static final String UPLOAD_FOLDER = "C:\final_bitProject\.metadata\.plugins\org.eclipse.wst.server.core\tmp3\wtpwebapps\borrow_homegym\resources";

	// 글쓰기 페이지로 이동
	@RequestMapping("/registerView.do")
	public String registerView(Model model, Criteria cri){

		log.info("글쓰기 폼 보여주기");
		model.addAttribute("cri", cri);
		return "homegym/hg_write";
	}
	
	// 글작성 완료시 작동
	@ResponseBody
	@RequestMapping("/register.do")
	//public String register(@ModelAttribute HomegymVO vo) {
	public String register(HomegymVO vo, Criteria cri) {
		
		log.info("글 등록하기: " + vo);
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		homegymService.register(vo);
		return "OK";
	}
	
	// 게시글 리스트 보여주기
	@GetMapping("/homegymListView.do")
	public String listView(Model model, HomegymVO vo, Criteria cri, HomegymAttachVO attach, HomegymReviewVO review) {
		
		// getBoardListWithPaging은 resultType이 hashmap인 객체들을 담은 List이다. 
		// 첨부파일, vo, 페이징을 모두 보여줘야 되기 때문이다.
		
		// jsp의 지도위에 데이터베이스에 존재하는 데이터를 보여주기 위해서는 json 데이터로 보내주는 것이 자바스크립트를 사용하기 편하다.
		// 그래서 jsonArray 관련 라이브러리를 활용하여 json 데이터로 만들어 view단에 뿌려준다.
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("list", jsonArray.fromObject(homegymService.getBoardListWithPaging(vo, cri, attach)));
		model.addAttribute("listAll", jsonArray.fromObject(homegymService.getAllInfo(vo, cri, attach)));
		
		// 페이징할 때 필요한 cri 인스턴스와 전체 게시물을 담은 total 인스턴스 변수를 모델에 담는다.
		int total = homegymService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
		log.info("게시판 리스트: " + model);
		return "/homegym/hg_list";
	}
	
	// 상세 게시글 보여주기
	@GetMapping("/homegymDetailView.do")
	public String getView(Model model, HomegymVO vo, @ModelAttribute ("cri") Criteria cri, 
			@RequestParam("hId") int hId ) {
		model.addAttribute("board", homegymService.get(vo, hId));
		model.addAttribute("score", homegymService.getScore(hId));
		
		log.info("상세화면 정보: " + model);
		return "/homegym/hg_details";
	}
	
	// 수정 페이지 보여주기
	@GetMapping("/homegymModifyView.do")
	public String modifyView(Model model, HomegymVO vo, @ModelAttribute("cri") Criteria cri,
			@RequestParam("hId") int hId) {

		model.addAttribute("board", homegymService.get(vo, hId));
		log.info("수정하기: " + model);
		return "/homegym/hg_modify";
	}
	
	// 수정 완료 요청시 작동
	@ResponseBody
	@PostMapping("/homegymModify.do")
	public String modify(HomegymVO vo, @ModelAttribute("cri") Criteria cri) { //ModelAttribute가 없어도 된다.
		
		log.info("수정하기 POST :" + vo);
		
		if(homegymService.modify(vo)) {
			return "OK";
		}
		
		return "ERROR";
	}
	
	// 삭제 완료 요청시 작동
	@ResponseBody
	@PostMapping("/homegymRemove.do")
	public String remove(@RequestParam("hId") int hId, @ModelAttribute("cri") Criteria cri //ModelAttribute가 없어도 된다.
			, HomegymAttachVO attach) {
		
		log.info("삭제하기 POST: " + hId);
		
		// 첨부파일 리스트 획득
		List<HomegymAttachVO> attachList = homegymService.getAttachList(attach, hId);
		
		if(homegymService.remove(hId)) {
			
			// deleteFiles 메서드를 이용해서 해당 게시물에 속하는 첨부파일을 삭제해준다.
			deleteFiles(attachList);
			return "OK";
		}
		
		return "ERROR";
	}
	
	// 첨부파일 리스트 요청시 작동 
	@GetMapping(value = "/getAttachList.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<HomegymAttachVO>> getAttachList(HomegymAttachVO vo, @RequestParam("hId") int hId){
		
		log.info("첨부파일 가져오기: " + hId);
		return new ResponseEntity<List<HomegymAttachVO>>(homegymService.getAttachList(vo, hId), HttpStatus.OK);
	}
	
	// 첨부파일 데이터 삭제 메서드
	private void deleteFiles(List<HomegymAttachVO> attachList) {
		
		// 첨부파일 존재 유무 확인
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("첨부파일 삭제.....");
		
		attachList.forEach(attach -> {
			
			try {
				
				// java.nio.file.Path 클래스를 활용해서 특정 경로의 파일을 가져온다. (파일 접근)
				// attach.getUplodaPath()로 해당 날짜 폴더에 존재하는 파일을 찾아간다.
				Path file = Paths.get(UPLOAD_FOLDER+ attach.getUploadPath()
				+ "/" + attach.getUuid() + "_" + attach.getFileName());
				
				// java.nio.file.Files 클래스를 활용해서 파일이 있으면 지운다.
				Files.deleteIfExists(file);
				
				// 이미지 파일이면 섬네일도 지워준다.	
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get(UPLOAD_FOLDER + attach.getUploadPath()
				+ "/s_" + attach.getUuid() + "_" + attach.getFileName());
					
				Files.delete(thumbNail);
				}
			}catch(Exception e) {
				log.error("첨부파일 삭제 오류" + e.getMessage())	;
			}
		});
	}
}
