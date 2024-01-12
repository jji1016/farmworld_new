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

	@Override
	public void add(UserVO vo) {
		log.info("vo: " + vo);
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
	
	@Override // 회원가입시 아이디 중복 체크
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
	public int login(UserVO vo) {
		//아이디 체크
		String db_id = mapper.idCheck(vo);
		//비번 체크
		
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


}
