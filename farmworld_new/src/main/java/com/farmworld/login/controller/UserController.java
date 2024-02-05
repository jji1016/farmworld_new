package com.farmworld.login.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.UserDataHandler;

import com.farmworld.login.domain.UserVO;
import com.farmworld.login.service.MailSendService;
import com.farmworld.login.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@AllArgsConstructor
@Log4j
public class UserController {
	private final UserService userService;
	private final MailSendService mailService;
	
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
	public String join(UserVO userVo) {
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
	public String postLogin(UserVO vo, HttpSession session, RedirectAttributes rttr) {
		log.info("controller postLogin: "+vo);
		System.out.println("controller postLogin 사용자 입력: "+vo);
		
		UserVO userInfo  = userService.login(vo);
		System.out.println("controller postLogin db값: "+userInfo);
		
		if(userInfo != null) {//로그인 성공
			//user_num/nickname 세션에 저장
			session.setAttribute("user_num", userInfo.getUser_num());
			session.setAttribute("user_nickname", userInfo.getUser_nickname());
			session.setAttribute("user_type", userInfo.getUser_type());
			
			System.out.println("로그인 성공");
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("message", "아이디 또는 비밀번호가 잘못되었습니다.");
			System.out.println("모델 실행");
			return "redirect:/user/login";
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

	
/*** 아이디 찾기 ***/
	@GetMapping("/findId")
	public String getFindId() {
		System.out.println("getFindId");
		return "/user/findId";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public Map<String, String> findId(UserVO vo, Model model) {
		Map<String, String> resultMap = new HashMap<String, String>();
		System.out.println("ajax findId");
		String user_id = userService.findId(vo);
		if(user_id != null) { //아이디 찾았을 때
			System.out.println("아이디 찾았다:"+user_id);
			resultMap.put("result","고객님의 아이디는 "+user_id+ "입니다.");
		}else {
			resultMap.put("result", "이름 또는 전화번호가 일치하지 않습니다.");
		}
		return resultMap;
	}
	
/*** 비밀번호 수정 ***/
	@GetMapping("/changePw") //비번수정 jps 열기
	public String getChangePw() {
		System.out.println("changePw");
		return "/user/changePw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/infoCheckForPw", method = RequestMethod.POST)
	public boolean infoCheckForPw(UserVO vo) {
		System.out.println("controller infoCheckForPw"+vo.getUser_id());
		if(userService.infoCheckForPw(vo) != null) {
			return true;
		}
		return false;
	}
	
	//비번 수정을 위한 본인 인증 번호 전달
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	public String sendMail(String user_id, Model model) {
		System.out.println("비번 인증 요청"+user_id);
		return mailService.mailSender(user_id);
	}
		
	//메일 전송 test
	@RequestMapping(value = "/testest", method = RequestMethod.GET)
	public String test () {
		return mailService.mailSender("zzazza1226@gmail.com");
	}
	
	//비번 수정
	@ResponseBody
	@RequestMapping(value = "/modPw", method = RequestMethod.POST)
	public Map<String, Object> modPw (UserVO vo) {
		System.out.println("비번 수정"+vo);
		Map<String, Object> response = new HashMap<>();
		
		try {
	        userService.modify(vo);
	        response.put("success", true);
	        response.put("message", "비밀번호가 성공적으로 수정되었습니다.");
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "비밀번호 수정에 실패했습니다.");
	    }

	    return response;
	}
}
