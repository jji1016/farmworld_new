package com.farmworld.farm.mapper;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.farm.domain.GrowUpVO;

public interface GrowUpMapper {
	
	public void insert(GrowUpVO vo);

	public void insertSelectBno(GrowUpVO vo);

	public List<GrowUpVO> selectAll(GrowUpVO vo);

	public int update(GrowUpVO vo);

	public int delete(int grow_num);

	public GrowUpVO select(Integer key);

	public List<GrowUpVO> getListWithSearch(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<GrowUpVO> getListWithPaging(Criteria cri);


}
