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

	@Override //ȸ������
	public void add(UserVO vo) {
		System.out.println("service add vo: " + vo);
		mapper.insert(vo);
	}

	@Override //��� ����
	public void modify(UserVO vo) {
		mapper.modPw(vo);
	}

	@Override
	public void delete(Integer k) {
		// TODO Auto-generated method stub
		
	}

	@Override // ȸ�����Խ� ���̵� �ߺ� üũ
	public String idCheck(UserVO vo) {
		return mapper.idCheck(vo); 
	}
	
	@Override // ȸ�����Խ� �г��� �ߺ� üũ
	public String nickCheck(UserVO vo) {
		return mapper.nickCheck(vo);
	}

	@Override //���̵� ã��
	public String findId(UserVO vo) {
		System.out.println("service findId: "+mapper.findId(vo));
		return mapper.findId(vo);
	}

	@Override
	public void pwReset(UserVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override //�α���
	public UserVO login(UserVO vo) {
		System.out.println("service login: "+mapper.getUserInfo(vo));
		return mapper.getUserInfo(vo);	
	}
	
	@Override //�α׾ƿ�
	public void logout() {
		// TODO Auto-generated method stub
		
	}

	@Override //���ǿ� ����� user_num���� Ȯ���ؾ���
	public boolean isAdmin(UserVO vo) {
		System.out.println("service isAdmin");
		
		UserVO isAdmin = mapper.isAdmin(vo);
		
		if(isAdmin.getUser_num()==1) { //�������� ���
			return true;
		}
		return false; //������x ���
	}

	@Override //��� ���� ���� ���� Ȯ��
	public String infoCheckForPw(UserVO vo) {
		String id = mapper.getIdForPw(vo);
		System.out.println("service infoCheckForPw:"+id);
		if(id != null) {
			return id;
		}
		return null;
	}



}
