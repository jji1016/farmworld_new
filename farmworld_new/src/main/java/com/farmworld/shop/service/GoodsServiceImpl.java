package com.farmworld.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.shop.domain.GoodsVO;
import com.farmworld.shop.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service("GoodsService")
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	private static final Logger log = LoggerFactory.getLogger(GoodsServiceImpl.class);

	@Autowired
	GoodsMapper mapper;

	@Override
	public List<GoodsVO> goodsAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsVO> searchGoods(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * shop 리스트, 카테고리 카운트 가져오기
	 * @param vo
	 * @return
	 */
	@Override
	public Map<String, Object> getGoodsList(GoodsVO vo) {
		Map<String, Object> returnData = new HashMap<>();

		returnData.put("goodsList", mapper.getGoodsList(vo));
		returnData.put("categoryList", mapper.getGoodsCategoryTotalCount());

		return returnData;
	}

	// 이미지 테이블 마지막 숫자
	@Override
	public int getCount() {
		return mapper.getCount();
	}

	// 이미지 저장
	@Override
	public int saveImage(ImageVO imageVo) {
		return mapper.saveImage(imageVo);
	}

	// 상품 저장
	@Override
	public int saveGoods(GoodsVO goodsVo) {
		return mapper.saveGoods(goodsVo);
	}



}
