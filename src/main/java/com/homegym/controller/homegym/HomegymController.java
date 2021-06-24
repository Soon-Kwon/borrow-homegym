package com.homegym.controller.homegym;

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
import com.homegym.biz.homegym.HomegymService;
import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.homegym.PageDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/homegym/*")
@Log4j
public class HomegymController {
	
	@Autowired
	private HomegymService homegymService;
	
	@RequestMapping("/registerView.do")
	public String registerView(){
	
		log.info("글쓰기 폼 보여주기");
		return "homegym/hg_write";
	}
	
	@ResponseBody
	@RequestMapping("/register.do")
	//public String register(@ModelAttribute HomegymVO vo) {
	public String register(HomegymVO vo) {
		
		log.info("글 등록하기: " + vo);
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		homegymService.register(vo);
		//rttr.addFlashAttribute("result", homegym.getHId());
		return "OK";
	}
		
	@GetMapping("/homegymListView.do")
	public String listView(Model model, HomegymVO vo, Criteria cri, HomegymAttachVO attach) {
		
		// getBoardListWithPaging은 resultType이 hashmap인 객체들을 담은 List이다. 
		model.addAttribute("list", homegymService.getBoardListWithPaging(vo, cri, attach));

		int total = homegymService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
		log.info("게시판 리스트: " + model);
		return "/homegym/hg_list";
	}
	
	@GetMapping("/homegymDetailView.do")
	public String getView(Model model, HomegymVO vo, @ModelAttribute ("cri") Criteria cri, 
			@RequestParam("hId") int hId ) {
		
		model.addAttribute("board", homegymService.get(vo, hId));
		log.info("상세화면 정보: " + model);
		return "/homegym/hg_details";
	}
	
	@GetMapping("/homegymModifyView.do")
	public String modifyView(Model model, HomegymVO vo, @ModelAttribute("cri") Criteria cri,
			@RequestParam("hId") int hId) {

		model.addAttribute("board", homegymService.get(vo, hId));
		log.info("수정하기: " + model);
		return "/homegym/hg_modify";
	}
	
	@ResponseBody
	@PostMapping("/homegymModify.do")
	public String modify(HomegymVO vo, @ModelAttribute("cri") Criteria cri) {
		
		log.info("수정하기 POST :" + vo);
		
		if(homegymService.modify(vo)) {
			return "OK";
		}
		
		return "ERROR";
	}
	
	@ResponseBody
	@PostMapping("/homegymRemove.do")
	public String remove(@RequestParam("hId") int hId, @ModelAttribute("cri") Criteria cri) {
		
		log.info("삭제하기 POST: " + hId);
		
		if(homegymService.remove(hId)) {
			return "OK";
		}
		
		return "ERROR";
	}
	
	@GetMapping("/reservationView.do")
	public String reservationView(Model model, @ModelAttribute("cri") Criteria cri, @RequestParam("hId") int hid) {
		
		log.info("예약하기: " + model);
		return "/homegym/hg_reservation";
	}
	
	@GetMapping(value = "/getAttachList.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<HomegymAttachVO>> getAttachList(HomegymAttachVO vo, @RequestParam("hId") int hId){
		
		log.info("첨부파일 가져오기: " + hId);
		return new ResponseEntity<List<HomegymAttachVO>>(homegymService.getAttachList(vo, hId), HttpStatus.OK);
	}
}
