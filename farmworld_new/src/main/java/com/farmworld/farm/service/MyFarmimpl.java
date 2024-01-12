package com.farmworld.farm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.farm.mapper.MyFarmMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MyFarmimpl implements MyFarm {
	
	private final MyFarmMapper mapper;

	@Override
	public MyFarmVO get(Integer k) {
		return mapper.select(k);
	}

	@Override
	public void add(MyFarmVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void modify(MyFarmVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(Integer k) {
		mapper.delete(k);
	}

	@Override
	public List<MyFarmVO> farmAll(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<MyFarmVO> searchFarm(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotalCount(cri);
	}

	@Override
	public void view(MyFarmVO vo) {
		mapper.viewCount(vo);
	}

}
