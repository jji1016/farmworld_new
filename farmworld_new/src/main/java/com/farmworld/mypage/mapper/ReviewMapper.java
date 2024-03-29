package com.farmworld.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.shop.domain.GoodsVO;

public interface ReviewMapper {
	
	public List<OrderVO> review1(Integer user_num);
	public List<GoodsVO> review2(Integer user_num);
	public List<ReviewVO> review3(Integer user_num);
	public List<ImageVO> reviewimage(Integer user_num);
	
	public int reviewupdate(ReviewVO vo);
	public List<ImageVO> getreviewVOimage();
	
	public int reviewdelete(int review_num);
	
	public int updatereview(ReviewVO vo);
	public int updateimage(ReviewVO vo);
	
	public ReviewVO getreviewVO(int review_num);
	
	public int insertReview(ReviewVO vo);
}
