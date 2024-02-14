package com.farmworld.login.mapper;

import com.farmworld.login.domain.UserVO;
import com.farmworld.shop.domain.GoodsVO;

public interface UserMapper {
	
	public void insert(UserVO vo);
	
	public UserVO select(Integer user_num);
	
	public UserVO getUserInfo(UserVO vo);

	public UserVO isAdmin(UserVO vo);

	public String idCheck(UserVO vo);

	public String nickCheck(UserVO vo);
	
	public String findId(UserVO vo);

	public String getIdForPw(UserVO vo);

	public void modPw(UserVO vo);

	public void uploadImg(UserVO vo);
	
	public GoodsVO selectTag(UserVO vo);
	
}
