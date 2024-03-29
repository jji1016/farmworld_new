package com.farmworld.mypage.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.service.Generic;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.shop.domain.GoodsVO;

public interface ReviewService extends Generic<ReviewVO, Integer> {
	public List<OrderVO> review1(Integer user_num);
	public List<GoodsVO> review2(Integer user_num);
	public List<ReviewVO> review3(Integer user_num);
	public List<ImageVO> reviewimage(Integer user_num);
	
	public int reviewupdate(ReviewVO vo);
	
	public int updatereview(ReviewVO vo);
	public int updateimage(ReviewVO vo);
	public List<ImageVO> getreviewVOimage();
	
	public int reviewdelete(int review_num);
	
	public ReviewVO getreviewVO(Integer k);
	
	public int register(ReviewVO vo);
}
