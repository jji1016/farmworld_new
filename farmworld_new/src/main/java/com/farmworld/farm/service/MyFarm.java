package com.farmworld.farm.service;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.service.Generic;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.shop.domain.GoodsVO;

public interface MyFarm extends Generic<MyFarmVO, Integer> {
	
	public List<MyFarmVO> farmAll(Criteria cri);
	
	public List<MyFarmVO> searchFarm(Criteria cri);
	
	public MyFarmVO getByUserNum(Integer user_num);
	
	public int getTotal(Criteria cri);
	
	public void view(MyFarmVO vo);

	public Integer searchFarmKeyword(Criteria cri);
	
	public Integer getGoodsCount(MyFarmVO vo);

	public List<GoodsVO> getGoodsList(MyFarmVO vo);
}
