package com.homegym.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.member.Criteria;
import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.member.PageMakerDTO;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.utils.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class MemberController {
	@Autowired
	MemberService memberService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 마이페이지 메인 이동 */
	@GetMapping("mypage/profile.do")
	public String profile(MemberVO vo,HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);

		MemberVO memberVO = memberService.getUser(memberId);
		model.addAttribute("member", memberVO);

		System.out.println("vo정보::::: " + memberVO);
		// 빌린 홈짐 수
		int rentCnt = memberService.getRentHomeGymCnt(memberId);
		model.addAttribute("rentCnt", rentCnt);

		// 빌려준 홈짐 수
		int lendCnt = memberService.getLendHomeGymCnt(memberId);
		model.addAttribute("lendCnt", lendCnt);

		// 내가 작성한 게시글 수
		int myBoardCnt = memberService.getMyAllBoardCnt(memberId);
		model.addAttribute("myBoardCnt", myBoardCnt);

		// 내가 쓴 댓글 수
		// int myReplyCnt = memberService.getMyAllReplyCnt(memberId);
		model.addAttribute("myReplyCnt", "400");

		return "/user/profile";

	}

	/* 1.마이페이지 회원정보 수정페이지 이동 */
	@GetMapping("mypage/profile_update")
	public String profile_update(HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);

		MemberVO vo = memberService.getMyPageInfo(memberId);
		System.out.println(vo.getImagePath());
		model.addAttribute("member", vo);

		return "user/profile_update";
	}

	/* 1-2.마이페이지 회원정보 수정 요청 */
	@ResponseBody
	@PostMapping("mypage/update")
	public Map<String, Object> memberUpdate(@RequestBody MemberVO vo, HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		/* id, password 체크 */
		boolean result = memberService.checkPw(vo.getMemberId(), vo.getPassword());

		/* id,password 일치 */
		if (result) {
			System.out.println("vo.getNewPassword" + vo.getNewPassword());
			System.out.println("vo.getPassword" + vo.getPassword());
			int cnt = memberService.memberUpdate(vo);

			if (cnt == 1) { // 회원 수정 성공시
				map.put("resultCode", "Success");
				map.put("resultMessage", "회원 정보가 수정되었습니다.");
			} else { // 회원수정 실패시
				map.put("resultCode", "fail");
				map.put("resultMessage", "회원수정 실패! 재시도해주세요.");
			}
		} else { // id, password 불일치
			map.put("resultCode", "fail");
			map.put("resultMessage", "Id 혹은 Password 가 일치하지 않습니다.");
		}

		return map;

	}

	/* 1-3. 회원 이미지 등록 */
	
	  @PostMapping("mypage/userImgUpload") 
	  public String userImgUpload(MultipartFile file,MemberVO vo, HttpServletRequest request) throws IOException, Exception {
	  HashMap<String,Object> paramMap = new HashMap<String,Object>();
	  String attachPath = "/resources/imgUpload/";
	  //getRealPath("/") : webapp 폴더
	  String imgUploadPath = request.getSession().getServletContext().getRealPath("/");
	  //String imgUploadPath = uploadPath + File.separator + "imgUpload";
	  //System.out.println(imgUploadPath);
	  //String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	  String fileName = null;

	  
	  if(file != null) {
	   //fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		  //getOriginalFilename() : 파일이름을 String 값으로 반환
		  File uploadFile = new File(imgUploadPath + attachPath + file.getOriginalFilename());
		  //transfertTo : 파일 저장
		  file.transferTo(uploadFile);
	   System.out.println("이미지 등록");
	  } else {
	   fileName = uploadPath + File.separator + "images" + File.separator + "basicImg.png";
	   System.out.println("기본이미지 등록");
	  }

	  //vo.setImagePath(File.separator + "imgUpload" + File.separator + fileName);
	  vo.setImagePath(attachPath + file.getOriginalFilename());
	  //vo.setUserThumbImg(File.separator + "imgUpload" + File.separator + "s" + File.separator + "s_" + fileName);
	  //vo.setUserThumbImg(File.separator + "imgUpload" + File.separator + "s" + File.separator + "s_" + fileName);
	  paramMap.put("memberId", vo.getMemberId());
	  paramMap.put("imagePath", vo.getImagePath());
	  paramMap.put("userThumbImg", vo.getUserThumbImg());
	  
	  memberService.userImgUpload(paramMap);
	  
	  System.out.println("vo ::::" + vo.getImagePath());
	  return "redirect:/user/mypage/profile_update.do?memberId=silverbi99@naver.com";
	  }
	  
	/* 1-4.회원 이미지 삭제 (DB)*/
	  @PostMapping("mypage/userImgDelete") 
	  public String userImgDelete(MultipartFile file,MemberVO vo, HttpServletRequest request) throws IOException, Exception {
	  
		  Map<String, Object> map = new HashMap<String, Object>();
		  String memberId = vo.getMemberId();
		  
		  int result = memberService.userImgDelete(memberId);
		  
		  if(result==1) {
			  vo.setImagePath("");
			  map.put("resultCode", "Success");
			  map.put("resultMessage", "이미지가 삭제되었습니다.");
			  
		  }else {
			  map.put("resultCode", "fail");
			  map.put("resultMessage", "이미지 삭제 실패! 다시 시도해주세요.");
			  
		  }
	 
		  return "redirect:/user/mypage/profile_update.do?memberId=silverbi99@naver.com";
	  }
	  
	/* 1-5. 마이페이지 회원 탈퇴 요청 */
	@ResponseBody
	@PostMapping("mypage/delete")
	public Map<String, Object> memberDelete(@RequestBody MemberVO vo, HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		/* id, password 체크 */
		boolean result = memberService.checkPw(vo.getMemberId(), vo.getPassword());

		/* id,password 일치 */
		if (result) {
			int cnt = memberService.memberDelete(vo);

			if (cnt == 1) { /* 회원 탈퇴 성공시 */
				map.put("resultCode", "Success");
				map.put("resultMessage", "탈퇴가 완료되었습니다.");
			} else { /* 회원탈퇴 실패시 */
				map.put("resultCode", "fail");
				map.put("resultMessage", "회원탈퇴 실패! 재시도해주세요.");
			}
		} else { /* id, password 불일치 */
			map.put("resultCode", "fail");
			map.put("resultMessage", "Id 혹은 Password 가 일치하지 않습니다.");
		}

		return map;

	}

	/* 마이페이지 홈짐 활동내역 이동 */
	@GetMapping("mypage/myactiv")
	public String myactiv(Criteria cri, HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);

		/* 수락 대기중 */
		List<HomegymVO> waitingHG = memberService.getMyWaitingHG(memberId, cri);
		model.addAttribute("waitingHomegym", waitingHG);

		/* 빌려준 홈짐 */
		List<HomegymVO> lendHG = memberService.getLendHGPaging(memberId, cri);
		model.addAttribute("lendHomegym", lendHG);

		int ld_total = memberService.getLendHomeGymCnt(memberId);
		PageMakerDTO ld_pageMaker = new PageMakerDTO(cri, ld_total);
		model.addAttribute("ld_pageMaker", ld_pageMaker);

		System.out.println("ld_pageMaker::::::" + ld_pageMaker);

		/* 빌린 홈짐 */
		List<Map<String, String>> rentHG = memberService.getRentdHGPaging(memberId, cri);
		model.addAttribute("rentHomegym", rentHG);

		int rt_total = memberService.getRentHomeGymCnt(memberId);
		PageMakerDTO rt_pageMaker = new PageMakerDTO(cri, rt_total);
		model.addAttribute("rt_pageMaker", rt_pageMaker);

		System.out.println("rt_pageMaker ::::::" + rt_pageMaker);

		/* 진행중인 홈짐 */
		List<HomegymVO> progressHomegym = memberService.getMyProgressHomegym(memberId, cri);
		model.addAttribute("progressHomegym", progressHomegym);

		// 완료된 홈짐
		// List<HomegymVO> finishedHomegym =
		// memberService.getMyFinishedHomegym(memberId);

		return "user/myactiv";
	}

	/* 수락 거절 상태값 변화 */
	@ResponseBody
	@PostMapping("/acceptCheck")
	public Map<String, Object> acceptCheck(@RequestBody Map<String, String> paramMap, HttpServletRequest request,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		int result = memberService.HomegymAcceptUpdate(paramMap);

		if (result == 1) {
			if (paramMap.get("status").equals("Y")) {
				map.put("resultCode", "Acceept");
				map.put("resultMessage", "홈짐예약이 수락 되었습니다.");
			} else {
				map.put("resultCode", "Deny");
				map.put("resultMessage", "홈짐예약이 거절 되었습니다.");
			}
		} else {
			map.put("resultCode", "Fail");
			map.put("resultMessage", "오류가 발생했습니다. 다시 시도해주세요!");
		}

		return map;
	}

	/* 마이페이지 내 글 관리 페이지 이동 */
	@GetMapping("mypage/mywrite")
	public String mywrite(HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);

		List<TrainerBoardVO> trainerBoardVO = memberService.getMyBoardList(memberId);
		model.addAttribute("board", trainerBoardVO);

		return "user/mywrite";
	}

}
