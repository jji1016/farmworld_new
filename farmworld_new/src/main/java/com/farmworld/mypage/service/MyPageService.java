package com.farmworld.mypage.service;

import org.springframework.web.multipart.MultipartFile;

import com.farmworld.all.service.Generic;
import com.farmworld.login.domain.UserVO;
import com.farmworld.mypage.domain.MyPageVO;

public interface MyPageService extends Generic<MyPageVO, Integer>{

	public void imgUpload(UserVO userVo);

	public String pwCheck(UserVO vo);


}
