package com.farmworld.mypage.service;

import java.util.List;

import com.farmworld.all.service.Generic;
import com.farmworld.mypage.domain.ReviewVO;

public interface Review extends Generic<ReviewVO, Integer> {

	public List<ReviewVO> reviewAll(int goods_num);
	
	public int getScore(int goods_num);
}
