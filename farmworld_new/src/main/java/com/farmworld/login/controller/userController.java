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
	
//	@GetMapping("/mypage") //�α��� o/x ���� Ȯ��
//	public String loginCheck(HttpSession session) {
//		log.info("controller loginCheck");
//		System.out.println("controller loginCheck");
//		
//		//���ǿ� ����Ǿ� �ִ� user_num�� �޾ƿ���
//		Integer user_num = (int) session.getAttribute("user_num"); 
//		
//		if(user_num != null && user_num !=0 ) { //�α��� �� ����
//			return "redirect:"+"/"; //�Ŀ� ���������� �̵����� ���ľ���
//		}
//		return "/user/login"; //�α��� �� �� ����
//	}
//	
//	@PostMapping("/mypage")
//	public void getMyPage() { //���������� �̵�
//		
//	}
	
/*** ȸ������
 * ���̵�/�г��� �ߺ� üũ
 * �ڵ��� ��ȣ �� Ÿ��/���� ����
 * �̸��� ����
 * �ּ� API ���
 *  ***/	
	
	@GetMapping("/join")
	public String getJoin() {
		return "/user/join";
	}
	
	//ȸ������ �Ϸ�
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO userVo, HttpSession session) {
		userService.add(userVo);
		return "redirect:/";
	}
	
	@ResponseBody //���̵� �ߺ� üũ
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean idCheck(UserVO vo) {
		System.out.println("controller idCheck"+vo);
		if(userService.idCheck(vo) == null) { //��� ����
			System.out.println("controller idCheck");
			return true;
		}
		return false;
	}
	
	@ResponseBody //�г��� �ߺ� üũ
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public boolean nickCheck(UserVO vo) {
		System.out.println("controller nickCheck"+vo);
		String user_nickname = userService.nickCheck(vo);
		if(user_nickname == null) { //��� ����
			return true;
		}
		return false;
	}


/*** �α��� 
 * ���ǿ� user_num ����
 * �г��� ��������
 * ������ ���� üũ
 * ***/
	
	@GetMapping("/login") //�α��� â �̵�
	public String getLogin() {
		System.out.println("controller getLogin");
		return "/user/login";
	}
	
	//�α��� ���� Ȯ��
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String postLogin(UserVO vo, HttpSession session, Model model) {
		log.info("controller postLogin: "+vo);
		System.out.println("controller postLogin ����� �Է�: "+vo);
		
		UserVO userInfo  = userService.login(vo);
		System.out.println("controller postLogin db��: "+userInfo);
		
		if(userInfo != null) {//�α��� ����
			//user_num/nickname ���ǿ� ����
			session.setAttribute("user_num", userInfo.getUser_num());
			session.setAttribute("user_nickname", userInfo.getUser_nickname());
			
			System.out.println("�α��� ����");
			return "redirect:/";
		}else {
			model.addAttribute("loginError", "���̵� �Ǵ� ��й�ȣ�� �߸��Ǿ����ϴ�.");
			System.out.println("�� ����");
			return "/user/login";
		}
	}

	
/*** �α��� �������� Ȯ�� 
 * ���ǿ� user_num�� �ִ��� Ȯ��
 * (���ǿ� �����ұ��) user_nickname�� header�� ���� 
 * ***/
	@ResponseBody
	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public boolean checkLogin(HttpSession session) {
		System.out.println("ajax checkLogin ����");
		
		Integer user_num = null;
		String user_nickname = null;
		
		//���ǿ� ����Ǿ� �ִ� user_num�� �޾ƿ���
		if(session.getAttribute("user_num") != null) {
			user_num = (int) session.getAttribute("user_num");
			user_nickname = (String) session.getAttribute("user_nickname");
			System.out.println("���� ����: "+user_num+user_nickname);
			System.out.println("ȸ�� ����");
		}else {
			System.out.println("��ȸ�� ����");
		}
			
		// �α��� ���� Ȯ��: true,false ��ȯ
	    return user_num != null;
	}
	
	
/*** �α׾ƿ� ***/	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("ajax logout ����");
		session.invalidate(); //���� ���� �ʱ�ȭ
		System.out.println("���� �ʱ�ȭ");
		return "redirect:/";
	}
	
	
	
}
