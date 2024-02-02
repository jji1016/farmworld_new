package com.farmworld.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.login.domain.UserVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.shop.domain.GoodsVO;
import com.farmworld.shop.domain.UserAndReviewVO;
import com.farmworld.shop.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import javax.servlet.http.HttpSession;

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

	/**
	 * 상품 상세를 조회
	 * @param vo
	 * @param session
	 * @return
	 */
	@Override
	public Map<String, Object> shopDetail(GoodsVO vo, HttpSession session) {
		Map<String, Object> returnData = new HashMap<>();

		GoodsVO goodsDetail = mapper.shopDetail(vo);
		returnData.put("shopDetail", goodsDetail);

		String createdUser = String.valueOf(goodsDetail.getUser_num());
		// 작성자가 로그인한 사람인지 확인
		Boolean user_num = session.getAttribute("user_num") != null;
		if(user_num){
			String loginUser = session.getAttribute("user_num").toString();
			Boolean createUser = true;
			if(!createdUser.equals(loginUser)){
				createUser = false;
			}

			returnData.put("loginYn", createUser);
		}

		return returnData;
	}

	@Override
	public int deleteGoods(GoodsVO vo) {
		mapper.deleteGoods(vo);
		return mapper.deleteGoodsImage(vo);
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

	@Override
	public int modifyGoods(GoodsVO goodsVo) {
		return mapper.modifyGoods(goodsVo);
	}


	//리뷰 가져오기
	@Override
	public List<UserAndReviewVO> getReviewList(int goods_num) {
		List<ReviewVO> rs = mapper.getReview(goods_num);
		List<UserAndReviewVO> list = new ArrayList<UserAndReviewVO>();
		
		for (ReviewVO r : rs) {
            //리뷰 정보 불러오기
			UserAndReviewVO vo = new UserAndReviewVO();
            vo.setReviewVo(r);
            
            //리뷰 작성자 정보 불러오기
            List<UserVO> us = mapper.getUser(r.getUser_num());
            if (!us.isEmpty()) {
                vo.setUserVo(us.get(0));
            }
            
            //리뷰 이미지 불러오기
            List<ImageVO> is = mapper.getImage(r.getImage_folder_num());
            if (!is.isEmpty()) {
                vo.setImageVo(is.get(0));
            }
            
            list.add(vo);
	
		}
		System.out.println("Service list"+list);
		return list;
	}

}
