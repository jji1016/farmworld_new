package com.farmworld.farm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.GrowCriteria;
import com.farmworld.farm.domain.GrowUpVO;
import com.farmworld.farm.mapper.GrowUpMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class GrowUpimpl implements GrowUp {
	
	private final GrowUpMapper mapper;

	@Override
	public GrowUpVO get(Integer k) {
		return mapper.select(k);
	}

	@Override
	public void add(GrowUpVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void modify(GrowUpVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void delete(Integer k) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GrowUpVO> growAll(GrowCriteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<GrowUpVO> searchGrow(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(GrowCriteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<GrowUpVO> categoryAll(GrowCriteria vo) {
		
		
		return mapper.getCategory(vo);
	}

}
