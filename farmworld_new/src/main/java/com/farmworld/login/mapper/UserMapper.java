package com.farmworld.login.mapper;

import com.farmworld.login.domain.UserVO;

public interface UserMapper {
	
	public void insert(UserVO vo);
	
	public void delete(Integer user_num);
	
	public UserVO select(Integer user_num);
	
	public UserVO getUserInfo(UserVO vo);

	public UserVO isAdmin(UserVO vo);

	public String idCheck(UserVO vo);

	public String nickCheck(UserVO vo);
	
}
