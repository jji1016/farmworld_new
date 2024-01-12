package com.farmworld.login.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@GetMapping("/mypage") //로그인 o/x 상태 확인
	public String loginCheck(HttpSession session) {
		log.info("controller loginCheck");
		System.out.println("controller loginCheck");
		
		//세션에 저장되어 있는 user_num값 받아오기
		Integer user_num = (int) session.getAttribute("user_num"); 
		
		if(user_num != null && user_num !=0 ) { //로그인 된 상태
			return "redirect:"+"/"; //후에 마이페이지 이동으로 고쳐야함
		}
		return "/user/login"; //로그인 안 된 상태
	}
	
	@PostMapping("/mypage")
	public void getMyPage() { //마이페이지 이동
		
	}
	
	@GetMapping("/join")
	public String getJoin() {
		return "/user/join";
	}
	
	@PostMapping("/join")
	public void join() {
		
	}
	
	@ResponseBody //아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean idCheck(UserVO vo) {
		System.out.println("controller idCheck"+vo);
		if(userService.idCheck(vo) == null) { //사용 가능
			return true;
		}
		return false;
	}
	
	@ResponseBody //닉네임 중복 체크
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public boolean nickCheck(UserVO vo) {
		System.out.println("controller nickCheck"+vo);
		if(userService.nickCheck(vo) == null) { //사용 가능
			return true;
		}
		return false;
	}
	
	@GetMapping("/login") //로그인 창 이동
	public String getLogin() {
		System.out.println("controller getLogin");
		return "/user/login";
	}
	
	@ResponseBody //로그인 정보 확인
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String postLogin(UserVO vo, HttpSession session) {
		log.info("controller postLogin: "+vo);
		System.out.println("controller postLogin: "+vo);
		
		UserVO userInfo  = userService.login(vo);
		
		if((vo.getUser_id()).equals(userInfo.getUser_id()){
			
		}
		
		//로그인 성공 = null
		//user_num값 존재하면 세션에 저장
		session.setAttribute("user_num", userInfo.getUser_num());
		
		return null;
		
	} 
	
}
