package com.farmworld.cart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.cart.domain.BillHistoryVO;
import com.farmworld.cart.domain.CartVO;
import com.farmworld.cart.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CartController {
	@Autowired
	private CartService cartService;

	// 장바구니 화면 이동
	@GetMapping("/cartMain")
	public String showAddProductPage(Model model, HttpSession session, HttpServletRequest request) {
		String userNum = session.getAttribute("user_num") == null ? "" : session.getAttribute("user_num").toString();
		
		if("".equals(userNum)) {
			return "home";
		} else {
			return "cart";
		}
	}
	
	// 결제화면 데이터 가져오기
	@RequestMapping(value = "/getMyCart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMyCart(@RequestBody Map<String, String> map, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		try {
			CartVO cartVo = new CartVO();
			String userNum = session.getAttribute("user_num") == null ? "" : session.getAttribute("user_num").toString();
			cartVo.setUser_num(Integer.parseInt(userNum));
			
			result.put("cartList",	cartService.getMyCartList(cartVo));
			
			result.put("result", "Y");
		} catch(Exception e) {
			log.error(e.getMessage());
			result.put("result", "N");
		}
		
		return result;
	}
	
	// 장바구니 담기
	@ResponseBody
	@PostMapping(value = "/insertCart")
	public Map<String, Object> insertCart(CartVO cartVo, HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		try {
			cartVo.setUser_num(Integer.parseInt(session.getAttribute("user_num").toString()));
			
			// 상품 장바구니에 담기
			int successCnt = cartService.mergeGoods(cartVo);
			
			if(successCnt != 0) {
				result.put("result", "Y");
			} else {
				result.put("result", "N");
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			result.put("result", "N");
		}
		
		return result;
	}
	
	// 결제 이력 저장
	@RequestMapping(value = "/saveHistory", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveHistory(@RequestBody Map<String, String> map, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		try {
			BillHistoryVO historyVo = new BillHistoryVO();
			historyVo.setUser_no(Integer.parseInt(session.getAttribute("user_num").toString()));
			historyVo.setName_first(map.get("name_first"));
			historyVo.setName_last(map.get("name_last"));
			historyVo.setCompany_name(map.get("company_name"));
			historyVo.setAddr(map.get("addr"));
			historyVo.setPostcode(map.get("postcode"));
			historyVo.setCity(map.get("city"));
			historyVo.setCountry(map.get("country"));
			historyVo.setMobile(map.get("mobile"));
			historyVo.setEmail(map.get("email"));
			historyVo.setShipDetail(map.get("shipDetail"));
			historyVo.setAmt(Integer.parseInt(map.get("amt")));
			
			int successCnt = cartService.insertHistory(historyVo);
			
			if(successCnt != 0) {
				successCnt = 0;
				successCnt = cartService.removeCartInfo(historyVo);
				if(successCnt != 0) {
					result.put("result", "Y");
				} else {
					result.put("result", "N");
				}
			} else {
				result.put("result", "N");
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			result.put("result", "N");
		}
		
		return result;
	}
	
	// 장바구니 데이터 전송
	@RequestMapping(value = "/cartData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cartData(@RequestBody Map<String, String> map, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		try {
			CartVO cartVo = new CartVO();
			String userNum = session.getAttribute("user_num") == null ? "" : session.getAttribute("user_num").toString();
			cartVo.setUser_num(Integer.parseInt(userNum));
			cartVo.setCategory(map.get("category"));
			cartVo.setKeywords(map.get("keywords"));
			
			result.put("cartList",	cartService.getMyCartList(cartVo));
			result.put("cntList",	cartService.categoryCntList(cartVo));
			
			result.put("result", "Y");
		} catch(Exception e) {
			log.error(e.getMessage());
			result.put("result", "N");
		}
		
		return result;
	}
	
	// 장바구니 버튼 컨트롤
	@RequestMapping(value = "/changeCart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postLogin(@RequestBody Map<String, String> map, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		log.debug("getParam : " + ", " + map.get("id"));
		try {
			int state	= Integer.parseInt(map.get("state").toString());
			int id		= Integer.parseInt(map.get("id").toString());
			int succ	= 0;
			CartVO cartVo = new CartVO();
			cartVo.setCart_num(id);
			
			if(state == 0) { // 제거
				succ = cartService.delete(cartVo);
			} else if(state == 2) { // 증가
				succ = cartService.plus(cartVo);
			} else if(state == 1) { // 감소
				succ = cartService.minus(cartVo);
			}
			
			if(succ == 1) {
				result.put("result", "Y");
			} else {
				result.put("result", "N");
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			result.put("result", "N");
		}
		
		return result;
	}
}