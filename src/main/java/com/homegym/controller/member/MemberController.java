package com.homegym.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.trainerboard.TrainerBoardVO;

import lombok.Setter;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwencoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 이동
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
			
		logger.info("join 진입");
		// 회원가입 서비스 실행
		
		String password = member.getPassword();
		password = pwencoder.encode(password);
		member.setPassword(password);
		
		memberService.memberJoin(member);
		memberService.insertMemberAuth(member);
		
		logger.info("join Service 성공");
		return "redirect:/index.jsp";
		}
	
	// 회원가입 이동
	@GetMapping("/registration")
	public String registration() {
		return "user/registration";
	}
	
	// 로그아웃 이동
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
	

	/* 마이페이지 메인  이동 */
	@GetMapping("profile.do")
	public String profile(HttpServletRequest request, HttpSession session,Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);
		
		MemberVO memberVO = memberService.getUser(memberId);
		model.addAttribute("member",memberVO);
		
		// 빌린 홈짐 수
	//	int rentCnt = memberService.getRentHomeGymCnt(memberId);
		model.addAttribute("rentCnt","100");
		
		//빌려준 홈짐 수
		int lendCnt = memberService.getLendHomeGymCnt(memberId);
		model.addAttribute("lendCnt",lendCnt);
		
		//내가 작성한 게시글 수
		int myBoardCnt = memberService.getMyAllBoardCnt(memberId);
		model.addAttribute("myBoardCnt",myBoardCnt);
		
		// 내가 쓴 댓글 수
		//int myReplyCnt = memberService.getMyAllReplyCnt(memberId);
		model.addAttribute("myReplyCnt","400");
		
		return "/user/profile";
		
	}
	

	/* 1.마이페이지 회원정보 수정페이지 이동 */
	@GetMapping("/profile_update")
	public String profile_update(HttpServletRequest request, HttpSession session,Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);
		
		MemberVO vo= memberService.getMyPageInfo(memberId);
		model.addAttribute("member",vo);
		
		return "user/profile_update";
	}
	
	/* 1-2.마이페이지 회원정보 수정 요청 */
	@ResponseBody
	@PostMapping("/update")
	public Map<String,Object> memberUpdate(@RequestBody MemberVO vo, HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String,Object>();
	
		/* id, password 체크  */
		boolean result = memberService.checkPw(vo.getMemberId(), vo.getPassword());
		
		/* id,password 일치*/
		if(result) {
			System.out.println("vo.getNewPassword" + vo.getNewPassword());
			System.out.println("vo.getPassword" + vo.getPassword());
			int cnt = memberService.memberUpdate(vo);
			
			if(cnt==1) { /* 회원 수정 성공시 */
				map.put("resultCode", "Success");
				map.put("resultMessage", "회원 정보가 수정되었습니다.");
			}else { /*회원수정 실패시 */
				map.put("resultCode", "fail");
				map.put("resultMessage", "회원수정 실패! 재시도해주세요.");
			}
		}else { /* id, password 불일치 */
			map.put("resultCode", "fail");
			map.put("resultMessage", "Id 혹은 Password 가 일치하지 않습니다.");
		}

		return map;
			
	}

	/*1-3. 마이페이지 회원 탈퇴 요청*/
	@ResponseBody
	@PostMapping("/delete")
	public Map<String,Object> memberDelete(@RequestBody MemberVO vo, HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String,Object>();
	
		/* id, password 체크  */
		boolean result = memberService.checkPw(vo.getMemberId(), vo.getPassword());
		

		/* id,password 일치*/
		if(result) {
			int cnt = memberService.memberDelete(vo);
			
			if(cnt==1) { /* 회원 탈퇴 성공시 */
				map.put("resultCode", "Success");
				map.put("resultMessage", "탈퇴가 완료되었습니다.");
			}else { /*회원탈퇴 실패시 */
				map.put("resultCode", "fail");
				map.put("resultMessage", "회원탈퇴 실패! 재시도해주세요.");
			}
		}else { /* id, password 불일치 */
			map.put("resultCode", "fail");
			map.put("resultMessage", "Id 혹은 Password 가 일치하지 않습니다.");
		}

		return map;
			
	}

	/* 마이페이지 홈짐 활동내역  이동 */
	@GetMapping("/myactiv")
	public String myactiv(HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);
		
		// 빌려준 홈짐
		List<HomegymVO> lendhomegym = memberService.getMyLendHomegym(memberId);
		model.addAttribute("lendHomegym", lendhomegym);
		for(HomegymVO vo : lendhomegym) {
			System.out.println(vo.toString());
		}
		
		// 빌린 홈짐
		List<HomegymVO> rentHomegym = memberService.getMyRentHomegym(memberId);
		model.addAttribute("rentHomegym", rentHomegym);
		//진행중인 홈짐
		
		//완료된 홈짐
		
		return "user/myactiv";
	}
	
	/* 수락 거절 상태값 변화 */
	@ResponseBody
	@PostMapping("/acceptCheck")
	public String acceptCheck(@RequestParam Map<String, String> paramMap,HttpServletRequest request, HttpSession session, Model model) {
		/*Map에 status, ? 로 담겨*/
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		int result = memberService.HomegymAcceptUpdate(paramMap);
		
		if(result == 1)
			if(paramMap.get("status").equals("Y"))
				return "acceptok";
			else
				return "rejectok";
		else
			return "fail";
	}
	
	
	/* 마이페이지 내 글 관리 페이지  이동 */
	@GetMapping("/mywrite")
	public String mywrite(HttpServletRequest request, HttpSession session, Model model) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);
		
		List<TrainerBoardVO> trainerBoardVO = memberService.getMyBoardList(memberId);
		System.out.println("boardlist" + trainerBoardVO);
		model.addAttribute("board",trainerBoardVO);
		
		return "user/mywrite";
	}
	
}
