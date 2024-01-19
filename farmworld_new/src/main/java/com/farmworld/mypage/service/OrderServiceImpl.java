package com.farmworld.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.mapper.OrderMapper;
import com.farmworld.shop.domain.GoodsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service("OrderService")
@Log4j
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrderMapper mapper;

	/* 구매내역 */
	@Override
	public List<OrderVO> buyList1() {
		log.info("buylist()");
		return mapper.buylist1();
	}
	@Override
	public List<GoodsVO> buyList2() {
		log.info("buylist()");
		return mapper.buylist2();
	}
	@Override
	public List<MyFarmVO> buyList3() {
		log.info("buylist()");
		return mapper.buylist3();
	}
	@Override
	public List<ImageVO> buylistimg() {
		log.info("buylistimg()");
		return mapper.buylistimg();
	}
	
	/* 구매취소 */
	@Override
	public int returnpurchase(int order_num) {
		log.info("returnpurchase()");
		return mapper.returnpurchase(order_num);
	}


	/* 판매내역 */
	@Override
	public List<OrderVO> sellList1() {
		log.info("selllist()");
		return mapper.selllist1();
	}
	@Override
	public List<GoodsVO> sellList2() {
		log.info("selllist()");
		return mapper.selllist2();
	}
	@Override
	public List<MyFarmVO> sellList3() {
		log.info("selllist()");
		return mapper.selllist3();
	}
	@Override
	public List<ImageVO> selllistimg() {
		log.info("selllistimg()");
		return mapper.selllistimg();
	}
	

	

	
	
	
	@Override
	public void add(OrderVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer k) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public OrderVO get(Integer k) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(OrderVO vo) {
		// TODO Auto-generated method stub
		
	}
	



}
