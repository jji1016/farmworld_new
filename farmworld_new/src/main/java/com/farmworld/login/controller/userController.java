package com.farmworld.login.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.farmworld.login.domain.UserVO;
import com.farmworld.login.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@AllArgsConstructor
@Log4j
public class userController {
	
	@Autowired
	private final UserService userService;
	
//	@GetMapping("/mypage") //로그인 o/x 상태 확인
//	public String loginCheck(HttpSession session) {
//		log.info("controller loginCheck");
//		System.out.println("controller loginCheck");
//		
//		//세션에 저장되어 있는 user_num값 받아오기
//		Integer user_num = (int) session.getAttribute("user_num"); 
//		
//		if(user_num != null && user_num !=0 ) { //로그인 된 상태
//			return "redirect:"+"/"; //후에 마이페이지 이동으로 고쳐야함
//		}
//		return "/user/login"; //로그인 안 된 상태
//	}
//	
//	@PostMapping("/mypage")
//	public void getMyPage() { //마이페이지 이동
//		
//	}
	
/*** 회원가입
 * 아이디/닉네임 중복 체크
 * 핸드폰 번호 등 타입/글자 제한
 * 이메일 인증
 * 주소 API 사용
 *  ***/	
	
	@GetMapping("/join")
	public String getJoin() {
		return "/user/join";
	}
	
	//회원가입 완료
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO userVo, HttpSession session) {
		userService.add(userVo);
		return "redirect:/";
	}
	
	@ResponseBody //아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean idCheck(UserVO vo) {
		System.out.println("controller idCheck"+vo);
		if(userService.idCheck(vo) == null) { //사용 가능
			System.out.println("controller idCheck");
			return true;
		}
		return false;
	}
	
	@ResponseBody //닉네임 중복 체크
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public boolean nickCheck(UserVO vo) {
		System.out.println("controller nickCheck"+vo);
		String user_nickname = userService.nickCheck(vo);
		if(user_nickname == null) { //사용 가능
			return true;
		}
		return false;
	}


/*** 로그인 
 * 세션에 user_num 저장
 * 닉네임 가져오기
 * 관리자 여부 체크
 * ***/
	
	@GetMapping("/login") //로그인 창 이동
	public String getLogin() {
		System.out.println("controller getLogin");
		return "/user/login";
	}
	
	//로그인 정보 확인
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String postLogin(UserVO vo, HttpSession session, Model model) {
		log.info("controller postLogin: "+vo);
		System.out.println("controller postLogin 사용자 입력: "+vo);
		
		UserVO userInfo  = userService.login(vo);
		System.out.println("controller postLogin db값: "+userInfo);
		
		if(userInfo != null) {//로그인 성공
			//user_num/nickname 세션에 저장
			session.setAttribute("user_num", userInfo.getUser_num());
			session.setAttribute("user_nickname", userInfo.getUser_nickname());
			
			System.out.println("로그인 성공");
			return "redirect:/";
		}else {
			model.addAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
			System.out.println("모델 실행");
			return "/user/login";
		}
	}

	
/*** 로그인 상태인지 확인 
 * 세션에 user_num값 있는지 확인
 * (세션에 저장할까말까) user_nickname값 header에 전달 
 * ***/
	@ResponseBody
	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public boolean checkLogin(HttpSession session) {
		System.out.println("ajax checkLogin 실행");
		
		Integer user_num = null;
		String user_nickname = null;
		
		//세션에 저장되어 있는 user_num값 받아오기
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
			user_nickname = (String) session.getAttribute("user_nickname");
			System.out.println("세션 설정: "+user_num+user_nickname);
			System.out.println("회원 메인");
		}else {
			System.out.println("비회원 메인");
		}
			
		// 로그인 여부 확인: true,false 반환
	    return user_num != null;
	}
	
	
/*** 로그아웃 ***/	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("ajax logout 실행");
		session.invalidate(); //세션 정보 초기화
		System.out.println("세션 초기화");
		return "redirect:/";
	}
	
	
	
}
