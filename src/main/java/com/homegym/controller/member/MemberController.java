package com.homegym.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.homegym.biz.homegym.HomegymDetailVO;
import com.homegym.biz.homegym.HomegymReviewVO;
import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.member.Criteria;
import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.member.PageMakerDTO;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.security.CustomUserDetails;

import lombok.Setter;


@Controller
@RequestMapping("/user/*")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwencoder;
	
	// 로그
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 접속 
	@GetMapping("/loginpage")
	public String loginInput(String error, String logout, Model model) {
		logger.info("error: " + error);
		logger.info("logout: " + logout);
		
		if (error != null) {
			model.addAttribute("error", "등록되지 않은 아이디나 비밀번호 입니다. 다시 입력해주세요.");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다!");
		}
		
		return "user/loginpage";
	}
	
	// 회원가입 이동
	@GetMapping("/registration")
	public String registration() {
		return "user/registration";
	}

	// 회원가입 진행
	@RequestMapping(value="/join", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String joinPOST(MemberVO member) throws Exception{
			
		logger.info("join 진입");
		// 회원가입 서비스 실행
		
		String password = member.getPassword();
		password = pwencoder.encode(password);
		member.setPassword(password);
		
		memberService.memberJoin(member);
		
		logger.info("join Service 성공");
		return "redirect:/index.jsp";
		}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	//메시지 전달을 위해 리턴 타입 String으로 변환
	
	public String idCheck(@RequestBody String memberId) throws Exception {
		
		//이메일 확인
		System.out.println(memberId);
		/* email 확인 후 email일 null 일 때는 paramMap으로 매개변수 수정하시고
		String email = paramMap.get("email");
		*/
        
        int count = 0;
        count = memberService.idCheck(memberId);
        System.out.println(count);
		
		if(count == 0) {
			return "OK";
		} else {
			return "FAIL";
		} 
    }
	
	// 닉네임 중복 체크
		@ResponseBody
		@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
		//메시지 전달을 위해 리턴 타입 String으로 변환
		
		public String nickCheck(@RequestBody String nickname) throws Exception {
			
			//이메일 확인
			System.out.println(nickname);
			/* email 확인 후 email일 null 일 때는 paramMap으로 매개변수 수정하시고
			String email = paramMap.get("email");
			*/
	        
	        int count = 0;
	        count = memberService.nickCheck(nickname);
	        System.out.println(count);
			
			if(count == 0) {
				return "OK";
			} else {
				return "FAIL";
			} 
	    }

//	// 로그아웃 이동
//	@RequestMapping("/logout.do")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "login.jsp";
//	}
	

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 마이페이지 메인 이동 */
	
//	@GetMapping("mypage/profile.do")
//	public String profile(MemberVO vo,HttpServletRequest request, HttpSession session, Model model) {
//		String memberId = request.getParameter("memberId");
//		session.setAttribute("memberId", memberId);
//
//		MemberVO memberVO = memberService.getUser(memberId);
//		model.addAttribute("member", memberVO);
//
//		System.out.println("vo정보::::: " + memberVO);
//		// 빌린 홈짐 수
//		int rentCnt = memberService.getRentHomeGymCnt(memberId);
//		model.addAttribute("rentCnt", rentCnt);
//
//		// 빌려준 홈짐 수
//		int lendCnt = memberService.getLendHomeGymCnt(memberId);
//		model.addAttribute("lendCnt", lendCnt);
//
//		// 내가 작성한 게시글 수
//		int myBoardCnt = memberService.getMyAllBoardCnt(memberId);
//		model.addAttribute("myBoardCnt", myBoardCnt);
//
//		// 내가 쓴 리뷰 수
//		int myReviewCnt = memberService.getMyAllReviewCnt(memberId);
//		model.addAttribute("myReviewCnt", myReviewCnt);
//
//		return "/user/profile";
//
//	}
	
	@GetMapping("mypage/profile.do")
	public String profile(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		
		CustomUserDetails loginMemberVO = (CustomUserDetails)authentication.getPrincipal();
		
		CustomUserDetails vo = new CustomUserDetails();
		vo = memberService.getUser(loginMemberVO.getUsername());
		
		model.addAttribute("member", vo);

		System.out.println("vo정보::::: " + vo.getUsername());
		// 빌린 홈짐 수
		int rentCnt = memberService.getRentHomeGymCnt(vo.getUsername());
		model.addAttribute("rentCnt", rentCnt);

		// 빌려준 홈짐 수
		int lendCnt = memberService.getLendHomeGymCnt(vo.getUsername());
		model.addAttribute("lendCnt", lendCnt);

		// 내가 작성한 게시글 수
		int myBoardCnt = memberService.getMyAllBoardCnt(vo.getUsername());
		model.addAttribute("myBoardCnt", myBoardCnt);

		// 내가 쓴 리뷰 수
		int myReviewCnt = memberService.getMyAllReviewCnt(vo.getUsername());
		model.addAttribute("myReviewCnt", myReviewCnt);

		return "/user/profile";
	}

	/* 1.마이페이지 회원정보 수정페이지 이동 */
	
//	@GetMapping("mypage/profile_update")
//	public String profile_update(HttpServletRequest request, HttpSession session, Model model) {
//		String memberId = request.getParameter("memberId");
//		session.setAttribute("memberId", memberId);
//
//		MemberVO vo = memberService.getMyPageInfo(memberId);
//		System.out.println(vo.getImagePath());
//		model.addAttribute("member", vo);
//
//		return "user/profile_update";
//	}
	
	/* 1.마이페이지 회원정보 수정페이지 이동 */
	
	@GetMapping("mypage/profile_update")
	public String profile_update(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomUserDetails loginMemberVO = (CustomUserDetails)authentication.getPrincipal();
		
		CustomUserDetails vo = new CustomUserDetails();
		vo = memberService.getMyPageInfo(loginMemberVO.getUsername());
		
		model.addAttribute("member", vo);

		return "user/profile_update";
	}

/* 1-2.마이페이지 회원정보 수정 요청 */
	
	@ResponseBody
	@PostMapping("mypage/update")
	public Map<String, Object> memberUpdate(@RequestBody CustomUserDetails vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("memberId============>" + vo.getMemberId());
		
		String newPassword = vo.getNewPassword();
		if(newPassword != null && !newPassword.equals("") ) {
			newPassword = pwencoder.encode(newPassword);
			vo.setPassword(newPassword);
		}

		/* id, password 체크 */
		boolean result = memberService.checkPw(vo.getMemberId(), vo.getPassword());

		/* id,password 일치 */
		if (result) {
			System.out.println("vo.getNewPassword" + vo.getNewPassword());
			System.out.println("vo.getPassword" + vo.getPassword());
			int cnt = memberService.memberUpdate(vo);
//			if(newPassword != null && !newPassword.equals("") ) {
//				Authentication newAuth = new UsernamePasswordAuthenticationToken(vo.getMemberId(), vo.getPassword(), vo.getAuthorities());
//				SecurityContextHolder.getContext().setAuthentication(newAuth);
//			} else {
//				Authentication newAuth = new UsernamePasswordAuthenticationToken(vo.getMemberId(), pwencoder.encode(vo.getPassword()), vo.getAuthorities());
//				SecurityContextHolder.getContext().setAuthentication(newAuth);
//			}
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
	/* 1-3. 프로필 이미지 등록 */
	
	  @PostMapping("mypage/userImgUpload") 
	  public String userImgUpload(MultipartFile file, MemberVO vo, HttpServletRequest request) throws IOException, Exception {
	  HashMap<String,Object> paramMap = new HashMap<String,Object>();
	  String attachPath = "/resources/imgUpload/";
	  //getRealPath("/") : webapp 폴더까지
	  String imgUploadPath = request.getSession().getServletContext().getRealPath("/");
	  String fileName = null;

	  if(file != null) {
		  //getOriginalFilename() : 파일이름을 String 값으로 반환
		  File uploadFile = new File(imgUploadPath + attachPath + file.getOriginalFilename());
		  //transfertTo : 파일 저장
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
	  
	  return "redirect:/user/mypage/profile_update.do";
	  }
	  
	/* 1-4.프로필 이미지 삭제 (DB + 서버)*/
		
		 @PostMapping("mypage/userImgDelete")
		 @ResponseBody
		 public Map<String, Object> userImgDelete(HttpServletRequest request, @RequestBody Map<String, String> paramMap ) throws IOException, Exception {
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 
		 String memberId = paramMap.get("memberId");
		 String imagePath = paramMap.get("imagePath");
		 String realPath = request.getSession().getServletContext().getRealPath("/");
		 System.out.println(realPath);
	
		 //서버에서 삭제
		 File file = new File(realPath + imagePath);
		 //폴더 및 파일 삭제
		 file.delete();
		 
		 //DB에서 삭제
		 int result = memberService.userImgDelete(memberId);
		 
		 if(result==1) {  //삭제 성공시
			 map.put("resultCode", "Success");
		 	 map.put("resultMessage", "이미지가 삭제되었습니다.");
		 } else { //삭제 실패시
			 map.put("resultCode", "fail"); 
			 map.put("resultMessage", "이미지 삭제 실패! 다시 시도해주세요.");
		 }
		 
		 return map;
	}
		 
	/* 1-5. 마이페이지 회원 탈퇴 요청 */
		 
	@ResponseBody
	@PostMapping("mypage/delete")
	public Map<String, Object> memberDelete(@RequestBody MemberVO vo, HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		// id, password 체크 
		boolean result = memberService.checkPw(vo.getMemberId(), vo.getPassword());

		// id,password 일치
		if (result) {
			int cnt = memberService.memberDelete(vo);

			if (cnt == 1) { // 회원 탈퇴 성공시 
				map.put("resultCode", "Success");
				map.put("resultMessage", "탈퇴가 완료되었습니다.");
			} else { // 회원탈퇴 실패시 
				map.put("resultCode", "fail");
				map.put("resultMessage", "회원탈퇴 실패! 재시도해주세요.");
			}
		} else { // id, password 불일치
			map.put("resultCode", "fail");
			map.put("resultMessage", "Id 혹은 Password 가 일치하지 않습니다.");
		}

		return map;

	}

	/*예약 상세내용 이동*/
	@GetMapping("mypage/reservationForm.do")
	public String getMyRequest(@RequestParam("d_id") int dId, HomegymDetailVO vo,HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);
		
		HomegymDetailVO homegymDetailVO = memberService.getMyRequest(vo,dId) ;
		model.addAttribute("myRequest", homegymDetailVO);
		
		System.out.println("myRequest >>>>>>>>>>> " + homegymDetailVO);
		return "user/reservation_detail";
	}
	
	
	/* 마이페이지 홈짐 활동내역 이동 */
	
	@GetMapping("mypage/myactiv")
	public String myactiv(Criteria cri, HttpServletRequest request, HttpSession session, Model model) {
		/*
		 * String memberId = request.getParameter("memberId");
		 * session.setAttribute("memberId", memberId);
		 */
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomUserDetails loginMemberVO = (CustomUserDetails)authentication.getPrincipal();

		String memberId = loginMemberVO.getMemberId();
		/*
		 * CustomUserDetails vo = new CustomUserDetails(); vo =
		 * memberService.getUser(loginMemberVO.getUsername());
		 */
		
		/* model.addAttribute("member", vo); */
		
		//수락 대기중 
		List<Map<String, String>> waitingHG = memberService.getWaitingHGPaging(memberId, cri);
		for(int i =0; i<waitingHG.size();i++) {
			System.out.println(waitingHG.get(i));
		}
		model.addAttribute("waitingHomegym", waitingHG);
		
		int wait_total = memberService.getMyWaitngHomegymCnt(memberId);
		PageMakerDTO wait_pageMaker = new PageMakerDTO(cri,wait_total);
		model.addAttribute("wait_pageMaker", wait_pageMaker);
		
		System.out.println("wait_pageMaker::::::" + wait_pageMaker);

		//빌려준 홈짐  (Map으로 받을 때는 camelCase 사용 X)
		List<Map<String, String>> lendHG = memberService.getLendHGPaging(memberId, cri);
		for(int i=0; i < lendHG.size(); i++) {
			System.out.println(lendHG.get(i));
		}
		model.addAttribute("lendHomegym", lendHG);

		int ld_total = memberService.getLendHomeGymCnt(memberId);
		PageMakerDTO ld_pageMaker = new PageMakerDTO(cri, ld_total);
		model.addAttribute("ld_pageMaker", ld_pageMaker);

		System.out.println("ld_pageMaker::::::" + ld_pageMaker);

		// 빌린 홈짐 
		List<Map<String, String>> rentHG = memberService.getRentdHGPaging(memberId, cri);
		for(int i=0; i < rentHG.size(); i++) {
			System.out.println(rentHG.get(i));
		}
		model.addAttribute("rentHomegym", rentHG);

		int rt_total = memberService.getRentHomeGymCnt(memberId);
		PageMakerDTO rt_pageMaker = new PageMakerDTO(cri, rt_total);
		model.addAttribute("rt_pageMaker", rt_pageMaker);

		System.out.println("rt_pageMaker ::::::" + rt_pageMaker);

		/* 진행중인 홈짐 */
		/*
		 * List<HomegymVO> progressHomegym =
		 * memberService.getMyProgressHomegym(memberId, cri);
		 * model.addAttribute("progressHomegym", progressHomegym);
		 */
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
	public String mywrite(Criteria cri, HttpServletRequest request, HttpSession session, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomUserDetails loginMemberVO = (CustomUserDetails)authentication.getPrincipal();

		String memberId = loginMemberVO.getMemberId();

		//내가 쓴글 리스트
		List<TrainerBoardVO> trainerBoardVO = memberService.getMyBoardPaging(memberId, cri);
		for(int i=0; i < trainerBoardVO.size(); i++) {
			System.out.println(trainerBoardVO.get(i));
		}
		model.addAttribute("board", trainerBoardVO);

		int writeTotal = memberService.getMyAllBoardCnt(memberId);
		PageMakerDTO tb_pageMaker = new PageMakerDTO(cri,writeTotal);
		model.addAttribute("tb_pageMaker", tb_pageMaker);

		System.out.println("tb_pageMaker::::::" + tb_pageMaker);

		
		//내가 쓴 리뷰 리스트
		List<Map<String, String>> myReviews = memberService.getMyReviews(memberId);
		model.addAttribute("myReviews", myReviews);
		
		System.out.println("myReviews :::::" + myReviews);
		return "user/mywrite";
	}

}
