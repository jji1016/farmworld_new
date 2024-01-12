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
	
	@GetMapping("/mypage") //�α��� o/x ���� Ȯ��
	public String loginCheck(HttpSession session) {
		log.info("controller loginCheck");
		System.out.println("controller loginCheck");
		
		//���ǿ� ����Ǿ� �ִ� user_num�� �޾ƿ���
		Integer user_num = (int) session.getAttribute("user_num"); 
		
		if(user_num != null && user_num !=0 ) { //�α��� �� ����
			return "redirect:"+"/"; //�Ŀ� ���������� �̵����� ���ľ���
		}
		return "/user/login"; //�α��� �� �� ����
	}
	
	@PostMapping("/mypage")
	public void getMyPage() { //���������� �̵�
		
	}
	
	@GetMapping("/join")
	public String getJoin() {
		return "/user/join";
	}
	
	@PostMapping("/join")
	public void join() {
		
	}
	
	@ResponseBody //���̵� �ߺ� üũ
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean idCheck(UserVO vo) {
		System.out.println("controller idCheck"+vo);
		if(userService.idCheck(vo) == null) { //��� ����
			return true;
		}
		return false;
	}
	
	@ResponseBody //�г��� �ߺ� üũ
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public boolean nickCheck(UserVO vo) {
		System.out.println("controller nickCheck"+vo);
		if(userService.nickCheck(vo) == null) { //��� ����
			return true;
		}
		return false;
	}
	
	@GetMapping("/login") //�α��� â �̵�
	public String getLogin() {
		System.out.println("controller getLogin");
		return "/user/login";
	}
	
	@ResponseBody //�α��� ���� Ȯ��
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String postLogin(UserVO vo, HttpSession session) {
		log.info("controller postLogin: "+vo);
		System.out.println("controller postLogin: "+vo);
		
		UserVO userInfo  = userService.login(vo);
		
		if((vo.getUser_id()).equals(userInfo.getUser_id())){
			
		}
		
		//�α��� ���� = null
		//user_num�� �����ϸ� ���ǿ� ����
		session.setAttribute("user_num", userInfo.getUser_num());
		
		return null;
		
	} 
	
}
