package com.farmworld.shop.service;

import java.util.List;
import java.util.Map;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.shop.domain.GoodsVO;

import javax.servlet.http.HttpSession;

public interface GoodsService {

    List<GoodsVO> goodsAll();
    List<GoodsVO> searchGoods(Criteria cri);

    Map<String, Object> getGoodsList(GoodsVO vo);

    Map<String, Object> shopDetail(GoodsVO vo, HttpSession session);

    // 상품 삭제
    int deleteGoods(GoodsVO vo);

    // 이미지 테이블 마지막 숫자
    int getCount();
    
    // 이미지 저장
    int saveImage(ImageVO imageVo);
    
    // 상품 저장
    int saveGoods(GoodsVO goodsVo);

    int modifyGoods(GoodsVO goodsVo);

}
	