
package com.farmworld.mypage.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.mypage.service.OrderService;
import com.farmworld.mypage.service.ReviewService;
import com.farmworld.shop.domain.GoodsVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@AllArgsConstructor
@Log4j
public class MyPageController {

	private final OrderService orderService;
	private final ReviewService reviewService;

	/* 备概郴开 */
	@GetMapping("/buylist")
	public String buyList() {
		System.out.println("备概郴开");
		log.info("备概郴开");
		return "purchase";
	}

	@ResponseBody
	@RequestMapping(value = "/getbuylist1", method = RequestMethod.POST)
	public List<OrderVO> getbuyList1() {
		System.out.println("Ajax : 备概郴开1");
		log.info("Ajax : 备概郴开1");
		return orderService.buyList1();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getbuylist2", method = RequestMethod.POST)
	public List<GoodsVO> getbuyList2() {
		System.out.println("Ajax : 备概郴开2");
		log.info("Ajax : 备概郴开2");
		return orderService.buyList2();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getbuylist3", method = RequestMethod.POST)
	public List<MyFarmVO> getbuyList3() {
		System.out.println("Ajax : 备概郴开3");
		log.info("Ajax : 备概郴开3");
		return orderService.buyList3();
	}
	
	
	/* 魄概郴开 */
	@GetMapping("/selllist")
	public String sellList() {
		System.out.println("魄概郴开");
		log.info("魄概郴开");
		return "sale";
	}

	@ResponseBody
	@RequestMapping(value = "/getselllist1", method = RequestMethod.POST)
	public List<OrderVO> getsellList1() {
		System.out.println("Ajax : 魄概郴开1");
		log.info("Ajax : 魄概郴开1");
		return orderService.sellList1();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getselllist2", method = RequestMethod.POST)
	public List<GoodsVO> getsellList2() {
		System.out.println("Ajax : 魄概郴开2");
		log.info("Ajax : 魄概郴开2");
		return orderService.sellList2();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getselllist3", method = RequestMethod.POST)
	public List<MyFarmVO> getsellList3() {
		System.out.println("Ajax : 魄概郴开3");
		log.info("Ajax : 魄概郴开3");
		return orderService.sellList3();
	}
	
	
	/* 府轰郴开 */
	@GetMapping("/review")
	public String review() {
		System.out.println("府轰包府");
		log.info("府轰包府");
		return "review";
	}

	@ResponseBody
	@RequestMapping(value = "/getreviewlist1", method = RequestMethod.POST)
	public List<OrderVO> review1() {
		System.out.println("Ajax : 府轰包府1");
		log.info("Ajax : 府轰包府1");
		return reviewService.review1();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getreviewlist2", method = RequestMethod.POST)
	public List<GoodsVO> review2() {
		System.out.println("Ajax : 府轰包府2");
		log.info("Ajax : 府轰包府2");
		return reviewService.review2();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getreviewlist3", method = RequestMethod.POST)
	public List<ReviewVO> review3() {
		System.out.println("Ajax : 府轰包府3");
		log.info("Ajax : 府轰包府3");
		return reviewService.review3();
	}
}