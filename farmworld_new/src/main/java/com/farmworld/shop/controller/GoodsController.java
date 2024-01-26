package com.farmworld.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.farmworld.login.domain.UserVO;
import com.farmworld.mypage.controller.MyPageController;
import com.farmworld.mypage.service.ImageUploadService;
import com.farmworld.mypage.service.MyPageService;
import com.farmworld.mypage.service.OrderService;
import com.farmworld.mypage.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop/*")
@AllArgsConstructor
@Log4j
@SessionAttributes("user_num") //세션에 저장된 user_num 가져오기
public class GoodsController {
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String shopdt(@ModelAttribute("user_num") Integer user_num) {
		//상품 클릭해서 가면
		
		
		return "/shop/shopdt";
	}
	
}
