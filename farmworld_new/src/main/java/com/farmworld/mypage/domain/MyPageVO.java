package com.farmworld.mypage.domain;

import com.farmworld.login.domain.UserVO;

import lombok.Data;

@Data
public class MyPageVO {
	private UserVO userVO;
	private String farm_name;
}
