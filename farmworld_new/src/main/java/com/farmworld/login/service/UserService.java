package com.farmworld.login.service;

import com.farmworld.all.service.Generic;
import com.farmworld.login.domain.UserVO;

public interface UserService extends Generic<UserVO, Integer> {

	public String idCheck(UserVO vo);
	
	public String nickCheck(UserVO vo); //�������̽� ���̾�׷��� �߰��ؾ� ��
	
	public String findId(UserVO vo);
	
	public void pwReset(UserVO vo);
	
	public UserVO login(UserVO vo);
	
	public void logout();
	
	public boolean isAdmin(UserVO vo);

	public String infoCheckForPw(UserVO vo);

//	public UserVO join(UserVO vo);

}
