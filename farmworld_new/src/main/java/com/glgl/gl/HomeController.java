package com.glgl.gl;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.login.service.UserService;
import com.farmworld.shop.domain.GoodsVO;
import com.farmworld.shop.service.GoodsService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	GoodsService goodsService;
	@Autowired
	UserService userService;
	
	@ResponseBody
	@PostMapping("/recommendTag")
	public Map<String, Object> recommendTag(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("시작");
		int user_num = (int) session.getAttribute("user_num");
		if (user_num>1) {
			System.out.println("성공유저넘있음");
			GoodsVO goodsvo = userService.getTag(userService.get(user_num));
			map.put("goodsvo", goodsvo);
		}
	
		else {
			System.out.println("유저넘없음");
			map.put("goodsvo", "no");
		}
		return map;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/shopmain", method = RequestMethod.GET)
	public String shopmain() {
		return "/shopmain";
	}
	@RequestMapping(value = "/shopdetail", method = RequestMethod.GET)
	public String shopdetail() {
		return "/shopdetail";
	}
	
	@RequestMapping(value = "/myfarmMain", method = RequestMethod.GET)
	public String myfarm() {
		return "/myfarmMain";
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board() {
		return "/board";
	}
	
	@RequestMapping(value = "/chackout", method = RequestMethod.GET)
	public String checkOut() {
		return "/chackout";
	}
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String shop() {
		return "/sh";
	}
	
}
