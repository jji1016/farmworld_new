package com.farmworld.mypage.service;

import java.util.List;

import com.farmworld.all.service.Generic;
import com.farmworld.mypage.domain.OrderVO;

public interface Order extends Generic<OrderVO, Integer> {

	public List<OrderVO> sellList(int user_num);
	
	public List<OrderVO> buyerList(int user_num);
	
}
