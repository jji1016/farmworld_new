package com.farmworld.farm.mapper;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.farm.domain.MyFarmVO;

public interface MyFarmMapper {
	
	public void insert(MyFarmVO vo);

	public void insertSelectBno(MyFarmVO vo);

	public List<MyFarmVO> selectAll();

	public int update(MyFarmVO vo);

	public int delete(int myfarm_num);

	public MyFarmVO select(Integer key);


	public int getTotalCount(Criteria cri);
	
	public List<MyFarmVO> getListWithPaging(Criteria cri);
	
	public void viewCount(MyFarmVO vo);


}
