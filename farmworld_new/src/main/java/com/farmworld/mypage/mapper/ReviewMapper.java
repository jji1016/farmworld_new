package com.farmworld.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.shop.domain.GoodsVO;

public interface ReviewMapper {
	
	public List<OrderVO> review1();
	public List<GoodsVO> review2();
	public List<ReviewVO> review3();
	

}
