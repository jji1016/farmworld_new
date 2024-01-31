package com.farmworld.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.mypage.mapper.ReviewMapper;
import com.farmworld.shop.domain.GoodsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service("ReviewService")
@Log4j
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private final ReviewMapper mapper;

	
	/*리뷰관리*/
	@Override
	public List<OrderVO> review1(Integer user_num) {
		log.info("review()");
		return mapper.review1(user_num);
	}
	@Override
	public List<GoodsVO> review2(Integer user_num) {
		log.info("review()");
		return mapper.review2(user_num);
	}
	@Override
	public List<ReviewVO> review3(Integer user_num) {
		log.info("review()");
		return mapper.review3(user_num);
	}
	@Override
	public List<ImageVO> reviewimage(Integer user_num) {
		log.info("review()");
		return mapper.reviewimage(user_num);
	}
	
	
	
	/*리뷰수정*/
	@Override
	public int reviewupdate(ReviewVO vo) {
		log.info("reviewupdate()");
		return mapper.reviewupdate(vo);
	}
	@Override
	public int updatereview(ReviewVO vo) {
		log.info("updatereview()");
		return mapper.updatereview(vo);
	}
	@Override
	public int updateimage(ReviewVO vo) {
		log.info("updatereview()");
		return mapper.updateimage(vo);
	}
	
	
	
	/*리뷰 삭제*/
	@Override
	public int reviewdelete(int review_num) {
		log.info("reviewdelete()");
		return mapper.reviewdelete(review_num);
	}
	
	
	
	@Override
	public ReviewVO getreviewVO(Integer k) {
		
		return mapper.getreviewVO(k);
	}
	
	@Override
	public List<ImageVO> getreviewVOimage() {
		log.info("getreviewVOimage()");
		return mapper.getreviewVOimage();
	}
	
	
	@Override
	public void add(ReviewVO vo) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void modify(ReviewVO vo) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(Integer k) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public ReviewVO get(Integer k) {
		return mapper.getreviewVO(k);
	}

	
	
}
