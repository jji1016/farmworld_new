package com.farmworld.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.service.Generic;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.shop.domain.GoodsVO;

public interface OrderService extends Generic<OrderVO, Integer> {

	public List<OrderVO> sellList1();
	public List<GoodsVO> sellList2();
	public List<MyFarmVO> sellList3();
	public List<ImageVO> buylistimg();
	public int returnpurchase(int order_num);
	
	public List<OrderVO> buyList1();
	public List<GoodsVO> buyList2();
	public List<MyFarmVO> buyList3();
	public List<ImageVO> selllistimg();
	
}
