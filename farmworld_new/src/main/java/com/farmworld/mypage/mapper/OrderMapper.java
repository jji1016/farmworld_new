package com.farmworld.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.shop.domain.GoodsVO;

public interface OrderMapper {

	public List<OrderVO> buylist1();
	public List<GoodsVO> buylist2();
	public List<MyFarmVO> buylist3();
	public List<ImageVO> buylistimg();
	public int returnpurchase(int order_num);
	
	public List<OrderVO> selllist1();
	public List<GoodsVO> selllist2();
	public List<MyFarmVO> selllist3();
	public List<ImageVO> selllistimg();
	
	public void purchase(OrderVO vo);

	public int refund(int order_num);

}
