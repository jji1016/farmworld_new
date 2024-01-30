package com.farmworld.farm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.GrowCriteria;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.farm.mapper.MyFarmMapper;
import com.farmworld.shop.domain.GoodsVO;

import lombok.AllArgsConstructor;

@Service
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
		mapper.FarmCreate(vo);
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

	@Override
	public Integer searchFarmKeyword(Criteria cri) {
		return mapper.selectFarmKeyword(cri);
	}

	@Override
	public Integer getGoodsCount(MyFarmVO vo) {
		return mapper.getGoodsCount(vo);
	}

	@Override
	public List<GoodsVO> getGoodsList(GrowCriteria cri) {
		
		
		return mapper.getGoodsList(cri);
	}

	@Override
	public MyFarmVO getByUserNum(Integer user_num) {
		
		return mapper.selectAll(user_num);
	}
	
	

}
