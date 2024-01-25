package com.farmworld.farm.mapper;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.shop.domain.GoodsVO;

public interface MyFarmMapper {
	
	public void insert(MyFarmVO vo);

	public void insertSelectBno(MyFarmVO vo);

	public List<MyFarmVO> selectAll(Integer user_num);

	public int update(MyFarmVO vo);

	public int delete(int myfarm_num);

	public MyFarmVO select(Integer key);
	
	public int getTotalCount(Criteria cri);
	
	public List<MyFarmVO> getListWithPaging(Criteria cri);
	
	public void viewCount(MyFarmVO vo);

	public void FarmCreate(MyFarmVO vo);

	public Integer selectFarmKeyword(Criteria cri);
	
	public int getGoodsCount(MyFarmVO vo);

	public List<GoodsVO> getGoodsList(MyFarmVO vo);


}
