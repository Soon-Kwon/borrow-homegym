package com.homegym.controller.homegym;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymService;
import com.homegym.biz.homegym.HomegymVO;

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
	public String register(@ModelAttribute HomegymVO vo) {
	
		log.info("글 등록하기: " + vo);
		homegymService.register(vo);
		//rttr.addFlashAttribute("result", homegym.getHId());
		return "OK";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/hg_write.do", method=RequestMethod.POST)
//	public ResponseEntity<String> register(@RequestBody HomegymVO vo) throws Exception{
//		log.info("글 등록하기: " + vo);
//		ResponseEntity<String> entity = null;
//		homegymService.register(vo);
//		//rttr.addFlashAttribute("result", homegym.getHId());
//		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		return entity;
//	}
	
	@GetMapping("/homegymListView.do")
	public String list(Model model, HomegymVO vo, Criteria cri) {
		
		model.addAttribute("list", homegymService.getBoardListWithPaging(vo, cri));
		log.info("게시판 리스트: " + model);	
		return "/homegym/hg_list";
	}
	
	@GetMapping("/hg_details.do")
	public void get(Model model, HomegymVO vo, @ModelAttribute ("cri") Criteria cri, 
			@RequestParam("hId") int hId ) {
		
		model.addAttribute("board", homegymService.get(vo, hId));
		log.info("상세화면 정보: " + model);
	}
	
	@GetMapping("/hg_modify.do")
	public void modify(Model model, HomegymVO vo, @ModelAttribute("cri") Criteria cri,
			@RequestParam("hId") int hId) {

		model.addAttribute("board", homegymService.get(vo, hId));
		log.info("수정하기: " + model);

		
	}
}
