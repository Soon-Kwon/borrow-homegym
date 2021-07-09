package com.homegym.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.homegym.biz.homegym.HomegymDetailVO;
import com.homegym.biz.member.Criteria;
import com.homegym.biz.member.KakaoProfile;
import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.member.OAuthToken;
import com.homegym.biz.member.PageMakerDTO;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.security.CustomUserDetails;

import lombok.Setter;


@Controller
@RequestMapping("/user/*")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwencoder;
	
	// 로그인
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
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
		
		// 카카오 로그인
		@GetMapping(value="/kakao/callback", produces = "application/json; charset=utf-8")
		public String kakaoCallback(String code) throws Exception{ //Data를 리턴해주는 컨트롤러 함수
			
			// POST방식으로 key=value 데이터를 요청(카카오쪽으로)			
			RestTemplate rt = new RestTemplate();
			
			// HttpHeader 오브젝트 생성
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			// HttpBody 오브젝트 생성
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", "8073c8508d1673140cf691132162d281");
			params.add("redirect_uri", "http://localhost:8090/user/kakao/callback");
			params.add("code", code);
			
			// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
					new HttpEntity<>(params, headers);
			
			// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
			ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
			);
			
			// Gson, Json Simple, ObjectMapper
			ObjectMapper objectMapper = new ObjectMapper();
			OAuthToken oauthToken = null;
			try {
				oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
			}catch(JsonMappingException e) {
				e.printStackTrace();
			}catch(JsonProcessingException e) {
				e.printStackTrace();
			}
			
			System.out.println("카카오 엑세스 토큰:"+oauthToken.getAccess_token());
			
			// POST방식으로 key=value 데이터를 요청(카카오쪽으로)			
			RestTemplate rt2 = new RestTemplate();
							
			// HttpHeader 오브젝트 생성
			HttpHeaders headers2 = new HttpHeaders();
			headers2.add("Authorization", "Bearer "+ oauthToken.getAccess_token());
			headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = 
					new HttpEntity<>(headers2);
			
			System.out.println(kakaoProfileRequest2);
			
			// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
			ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
			);
			System.out.println(response2.getBody());
			
			ObjectMapper objectMapper2 = new ObjectMapper();
			KakaoProfile kakaoProfile = null;
			try {
				kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			}catch(JsonMappingException e) {
				e.printStackTrace();
			}catch(JsonProcessingException e) {
				e.printStackTrace();
			}
			
			// User 오브젝트: username, password, email, gender
			System.out.println("카카오 아이디(번호):" + kakaoProfile.getId());
			System.out.println("카카오 이메일:" + kakaoProfile.getKakao_account().getEmail());
			System.out.println("홈짐서버 멤버아이디:" + kakaoProfile.getKakao_account().getEmail());
			
			String garbagePassword = UUID.randomUUID().toString();
			garbagePassword = pwencoder.encode(garbagePassword);
			System.out.println("블로그서버 패스워드:" + garbagePassword);
			
			CustomUserDetails kakaoMember = CustomUserDetails.builder()
					.memberId(kakaoProfile.getKakao_account().getEmail())
					.password(garbagePassword.toString())
//					.imagePath(kakaoProfile.getConnected_at().)
					.gender(kakaoProfile.getKakao_account().getGender())
					.birth(kakaoProfile.getKakao_account().getBirthday())
					.build();
			
			// 가입자 혹은 비가입자 체크 해서 처리
			kakaoMember.setName(kakaoProfile.getProperties().nickname);
			kakaoMember.setNickname(kakaoProfile.getProperties().nickname);
//			kakaoMember.setImagePath(kakaoProfile.getProperties().);
			
			CustomUserDetails originMember = memberService.getUserKakao(kakaoMember.getMemberId());
			
			if(originMember == null) {
				System.out.println("기존 회원입니다");
				memberService.memberJoinKakao(kakaoMember);   
				originMember = memberService.getUserKakao(kakaoMember.getMemberId());
			}
			
			// 로그인 처리
			Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(originMember.getMemberId(), originMember.getPassword(), originMember.getAuthorities()));
			SecurityContextHolder.getContext().setAuthentication(authentication);

			return "redirect:/";
		}

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 마이페이지 메인 이동 */
	
	@GetMapping("mypage/profile.do")
	public String profile(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
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
	
	@GetMapping("mypage/profile_update")
	public String profile_update(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomUserDetails loginMemberVO = (CustomUserDetails)authentication.getPrincipal();
		
		CustomUserDetails vo = new CustomUserDetails();
		vo = memberService.getMyPageInfo(loginMemberVO.getMemberId());
		
		model.addAttribute("member", vo);

		return "user/profile_update";
	}

	/* 1-2.마이페이지 회원정보 수정 요청 (일반 회원) */
	
	@ResponseBody
	@PostMapping("mypage/update")
	public Map<String, Object> memberUpdate(@RequestBody CustomUserDetails vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("memberId============>" + vo.getMemberId());
		
		String newPassword = vo.getNewPassword();
		if(newPassword != null && !newPassword.equals("") ) {
			newPassword = pwencoder.encode(newPassword);
			vo.setNewPassword(newPassword);
		}
		
		// 사용자가 가진 모든 롤 정보를 얻습니다. 
		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		
		Iterator<? extends GrantedAuthority> iter = authorities.iterator();
		
		String authority = "";
		
		while (iter.hasNext()) { 
			GrantedAuthority auth = iter.next(); 
			authority = auth.getAuthority();
			System.out.println(auth.getAuthority()); 
		}
		boolean result = true;
		System.out.println(vo.getPassword());
		
		/* id, password 체크 */
		if(!authority.equals("ROLE_KAKAO")) {
			result = memberService.checkPw(vo.getMemberId(), vo.getPassword());
		}
		else {
			result = true;
		}

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
	public Map<String, Object> memberDelete(@RequestBody CustomUserDetails vo, HttpSession session) throws Exception {

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
	@GetMapping("mypage/reservationForm")
	public String getMyRequest(@RequestParam("d_id") int dId, HomegymDetailVO vo,HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);
		
		//HomegymDetailVO homegymDetailVO = memberService.getMyRequest(memberId) ;
		//model.addAttribute("myRequest", homegymDetailVO);
		
//		System.out.println("myRequest >>>>>>>>>>> " + homegymDetailVO);
		
		return "user/reservation_detail";
	}
	
	
	/* 마이페이지 홈짐 활동내역 이동 */
	
	
	/*관리할 홈짐 리스트 (수락/거절)*/
	@GetMapping("mypage/myactiv")
	public String myactiv(Criteria cri, HttpServletRequest request, HttpSession session, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomUserDetails loginMemberVO = (CustomUserDetails)authentication.getPrincipal();

		String memberId = loginMemberVO.getMemberId();
		
		List<Map<String, String>> waitingHG = memberService.getWaitingHGPaging(memberId, cri);
		model.addAttribute("waitingHomegym", waitingHG);
		
		int wait_total = memberService.getMyWaitngHomegymCnt(memberId);
		PageMakerDTO wait_pageMaker = new PageMakerDTO(cri,wait_total);
		model.addAttribute("wait_pageMaker", wait_pageMaker);
		model.addAttribute("wait_total", wait_total);
		System.out.println("wait_pageMaker::::::" + wait_pageMaker);
		
		
		List<Map<String, String>> lendHG = memberService.getLendHGPaging(memberId, cri);
		model.addAttribute("lendHomegym", lendHG);

		int ld_total = memberService.getLendHomeGymCnt(memberId);
		PageMakerDTO ld_pageMaker = new PageMakerDTO(cri, ld_total);
		model.addAttribute("ld_total", ld_total);
		model.addAttribute("ld_pageMaker", ld_pageMaker);

		System.out.println("ld_pageMaker::::::" + ld_pageMaker);
		
		List<Map<String, String>> rentHG = memberService.getRentdHGPaging(memberId, cri);
		model.addAttribute("rentHomegym", rentHG);
		
		int rt_total = memberService.getRentHomeGymCnt(memberId);
		PageMakerDTO rt_pageMaker = new PageMakerDTO(cri, rt_total);
		model.addAttribute("rt_total", rt_total);
		model.addAttribute("rt_pageMaker", rt_pageMaker);
		model.addAttribute("selectedBtnId", cri.getSelectedBtnId());

		return "user/myactiv";
	}
	
	
	/* 결제 상태값 변화  */
	
	@GetMapping("/payUpdate")
	public String payUpdate(@RequestParam(value="d_id",required=false) int dId,@RequestParam(value="payYN",required=false) String payYN,HttpServletRequest request, HttpSession session) {
		
		System.out.println("결제 vo>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + dId);
		System.out.println("결제 payYN>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + payYN);
		
		HomegymDetailVO vo = new HomegymDetailVO();
		
		vo.setDId(dId);
		vo.setPayYN(payYN);
		memberService.payUpdate(vo);
		
		
		return "redirect:/user/mypage/myactiv";
	}
	
	/*결제 완료시 (jsp 페이지 보여줌) */
	@GetMapping("/payOk")
	public String payOK() {
	
		return "user/payOk";
	}
	
	/* 수락 거절 상태값 변화 */
	
	@ResponseBody
	@PostMapping("/acceptCheck")
	public Map<String, Object> acceptCheck(@RequestBody Map<String, String> paramMap, HttpServletRequest request,HttpSession session, Model model) {

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
		model.addAttribute("selectedBtnId", cri.getSelectedBtnId());

		System.out.println("tb_pageMaker::::::" + tb_pageMaker);

		
		//내가 쓴 리뷰 리스트
		List<Map<String, String>> myReviews = memberService.getMyReviewsPaging(memberId,cri);
		model.addAttribute("myReviews", myReviews);
		for(int i=0; i < myReviews.size(); i++) {
			System.out.println(myReviews.get(i));
		}
		int reviewTotal = memberService.getMyAllReviewCnt(memberId);
		PageMakerDTO rv_pageMaker = new PageMakerDTO(cri,reviewTotal);
		model.addAttribute("rv_pageMaker",rv_pageMaker);
		
		System.out.println("myReviews :::::" + rv_pageMaker);

		model.addAttribute("selectedBtnId", cri.getSelectedBtnId());
		
		return "user/mywrite";
	}
	
	/* FAQ 이동 */
	@GetMapping("FAQ")
	public String FAQ() {
		return "others/FAQ";
	}
	

}
