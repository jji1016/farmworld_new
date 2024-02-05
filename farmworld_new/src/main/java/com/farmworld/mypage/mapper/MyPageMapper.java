package com.farmworld.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.login.domain.UserVO;
import com.farmworld.mypage.domain.MyPageVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.shop.domain.GoodsVO;

public interface MyPageMapper {
	
	public void updateFarmName(MyPageVO vo);

	public void updateUserInfo(UserVO vo);
	public void updateBoardInfo(UserVO vo);

	public String getPw(UserVO vo);

	public void changeUserType(Integer user_num);
	
}
