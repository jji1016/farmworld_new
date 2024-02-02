package com.farmworld.shop.mapper;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.login.domain.UserVO;
import com.farmworld.mypage.domain.ReviewVO;
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

    int modifyGoods(GoodsVO goodsVo);

    // 상품삭제
    int deleteGoods(GoodsVO goodsVo);

    int deleteGoodsImage(GoodsVO goodsVo);

    List<GoodsVO> getGoodsList(GoodsVO goodsVo);

    GoodsVO shopDetail(GoodsVO goodsVo);


    List<Map<String, Object>> getGoodsCategoryTotalCount();

  //리뷰 가져오기
    public List<ReviewVO> getReview(int goods_num);
    public List<UserVO> getUser(int user_num);
    public List<ImageVO> getImage(int image_folder_num);

}
