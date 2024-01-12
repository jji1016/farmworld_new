package com.farmworld.mypage.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.service.Generic;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.shop.domain.GoodsVO;

public interface ReviewService extends Generic<ReviewVO, Integer> {
	public List<OrderVO> review1();
	public List<GoodsVO> review2();
	public List<ReviewVO> review3();
}
