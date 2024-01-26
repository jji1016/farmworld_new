package com.farmworld.shop.mapper;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.shop.domain.GoodsVO;

import java.util.List;
import java.util.Map;

public interface GoodsMapper {
	
	// 이미지 테이블 마지막 숫자
	int getCount();
	
	// 이미지 저장
    int saveImage(ImageVO imageVo);
    
    // 상품 저장
    int saveGoods(GoodsVO goodsVo);

    List<GoodsVO> getGoodsList(GoodsVO goodsVo);

    List<Map<String, Object>> getGoodsCategoryTotalCount();


}