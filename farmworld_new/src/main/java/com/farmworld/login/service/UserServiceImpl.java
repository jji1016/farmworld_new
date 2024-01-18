package com.farmworld.login.service;

import org.springframework.stereotype.Service;

import com.farmworld.login.domain.UserVO;
import com.farmworld.login.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class UserServiceImpl implements UserService{
	
	private final UserMapper mapper;

	@Override
	public UserVO get(Integer k) {
		log.info("get");
		return mapper.select(k);
	}

	@Override //회원가입
	public void add(UserVO vo) {
		System.out.println("service add vo: " + vo);
		mapper.insert(vo);
	}

	@Override
	public void modify(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer k) {
		// TODO Auto-generated method stub
		
	}

	@Override // 회원가입시 아이디 중복 체크
	public String idCheck(UserVO vo) {
		return mapper.idCheck(vo); 
	}
	
	@Override // 회원가입시 닉네임 중복 체크
	public String nickCheck(UserVO vo) {
		return mapper.nickCheck(vo);
	}

	@Override
	public String findId(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void pwReset(UserVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public UserVO login(UserVO vo) {
		System.out.println("service login: "+mapper.getUserInfo(vo));
		return mapper.getUserInfo(vo);	
	}
	
	@Override
	public void logout() {
		// TODO Auto-generated method stub
		
	}

	@Override //세션에 저장된 user_num으로 확인해야함
	public boolean isAdmin(UserVO vo) {
		System.out.println("service isAdmin");
		
		UserVO isAdmin = mapper.isAdmin(vo);
		
		if(isAdmin.getUser_num()==1) { //관리자인 경우
			return true;
		}
		return false; //관리자x 경우
	}


//	@Override
//	public int join(UserVO vo) { //회원가입
//		log.info("service join vo: " + vo);
//		
//		System.out.println("mapper joinVo: "+ joinVo);
//		return joinVo;
//	}


}
