
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
import com.farmworld.mypage.service.OrderService;
import com.farmworld.shop.domain.GoodsVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@AllArgsConstructor
@Log4j
public class MyPageController {

	private final OrderService orderService;

	@GetMapping("/buylist")
	public String buyList() {
		System.out.println("备概郴开");
		log.info("备概郴开");
		return "purchase";
	}

	@ResponseBody
	@RequestMapping(value = "/getbuylist1", method = RequestMethod.POST)
	public List<OrderVO> getbuyList1() {
		System.out.println("Ajax : loadTableData1");
		log.info("Ajax : loadTableData");
		return orderService.buyList1();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getbuylist2", method = RequestMethod.POST)
	public List<GoodsVO> getbuyList2() {
		System.out.println("Ajax : loadTableData2");
		log.info("Ajax : loadTableData");
		return orderService.buyList2();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getbuylist3", method = RequestMethod.POST)
	public List<MyFarmVO> getbuyList3() {
		System.out.println("Ajax : loadTableData3");
		log.info("Ajax : loadTableData");
		return orderService.buyList3();
	}
}