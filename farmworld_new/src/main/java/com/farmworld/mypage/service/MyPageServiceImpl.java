package com.farmworld.mypage.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.farm.mapper.MyFarmMapper;
import com.farmworld.login.domain.UserVO;
import com.farmworld.login.mapper.UserMapper;
import com.farmworld.mypage.domain.MyPageVO;
import com.farmworld.mypage.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service("MyPageService")
@AllArgsConstructor
@Log4j
public class MyPageServiceImpl implements MyPageService{
	
	private final UserMapper userMapper;
	private final MyFarmMapper farmMapper;
	private final MyPageMapper mypageMapper;
	
	@Override
	public MyPageVO get(Integer user_num) {
		MyPageVO vo = new MyPageVO();

		UserVO userVo = userMapper.select(user_num);
		vo.setUserVO(userVo);
		
		//농장 있을때만 농장이름 가져오기
		if(userVo.isUser_isFarm() == true) {
			MyFarmVO farmVo = farmMapper.selectAll(user_num);
			vo.setFarm_name(farmVo.getFarm_name());
		}
		return vo;
	}

	@Override //정보 수정
	public void modify(MyPageVO vo) {
		System.out.println("modify service 넘어옴"+vo);
		
		// 사용자 정보 수정
	    UserVO userVo = vo.getUserVO();
	    mypageMapper.updateUserInfo(userVo);
	    
	    System.out.println("정보 수정 완료");
	}
	
	@Override
	public void imgUpload(UserVO userVo) {
		userMapper.uploadImg(userVo);
		
	}
	
	@Override
	public String pwCheck(UserVO vo) {
		return mypageMapper.getPw(vo);
	}

	@Override
	public void delete(Integer user_num) {
		mypageMapper.changeUserType(user_num);
		
	}

	@Override
	public void add(MyPageVO vo) {
		// TODO Auto-generated method stub
		
	}

	

	
}
