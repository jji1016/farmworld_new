package com.farmworld.shop.service;

import org.springframework.stereotype.Service;

import com.farmworld.login.mapper.UserMapper;
import com.farmworld.login.service.UserServiceImpl;
import com.farmworld.shop.domain.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewServiceImpl implements ReviewService{

	@Override
	public ReviewVO get(Integer k) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void add(ReviewVO vo) {
		
	}

	@Override
	public void modify(ReviewVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer k) {
		// TODO Auto-generated method stub
		
	}

}
