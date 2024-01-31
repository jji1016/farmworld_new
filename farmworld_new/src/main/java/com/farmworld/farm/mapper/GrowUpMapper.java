package com.farmworld.farm.mapper;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.GrowCriteria;
import com.farmworld.farm.domain.GrowUpVO;

public interface GrowUpMapper {
	
	public void insert(GrowUpVO vo);

	public void insertSelectBno(GrowUpVO vo);

	public List<GrowUpVO> selectAll(Integer k);

	public int update(GrowUpVO vo);

	public int delete(int grow_num);

	public GrowUpVO select(Integer key);

	public List<GrowUpVO> getListWithSearch(Criteria cri);
	
	public int getTotalCount(GrowCriteria cri);
	
	public List<GrowUpVO> getListWithPaging(GrowCriteria cri);

	public List<GrowUpVO> getCategory(GrowCriteria vo);
	
	public void Alter1();
	public void Alter2();
	

}
