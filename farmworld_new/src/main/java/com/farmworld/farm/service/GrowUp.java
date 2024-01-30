package com.farmworld.farm.service;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.GrowCriteria;
import com.farmworld.all.service.Generic;
import com.farmworld.farm.domain.GrowUpVO;

public interface GrowUp extends Generic<GrowUpVO, Integer> {

	public List<GrowUpVO> growAll(GrowCriteria vo);
	
	
	public int getTotal(GrowCriteria cri);
	
	public List<GrowUpVO> categoryAll(GrowCriteria vo);



	List<GrowUpVO> GrowList(Integer k);
}
