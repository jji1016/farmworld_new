package com.farmworld.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.shop.domain.GoodsVO;

public interface OrderMapper {

	public List<OrderVO> buylist1();
	public List<GoodsVO> buylist2();
	public List<MyFarmVO> buylist3();
	
	public List<OrderVO> sellist();
	
	public void purchase(OrderVO vo);

	public int refund(int order_num);

}
