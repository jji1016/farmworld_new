package com.farmworld.shop.domain;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.login.domain.UserVO;
import com.farmworld.mypage.domain.ReviewVO;

import lombok.Data;

@Data
public class UserAndReviewVO {
	private UserVO userVo;
	private ReviewVO reviewVo;
	private ImageVO imageVo;
}
