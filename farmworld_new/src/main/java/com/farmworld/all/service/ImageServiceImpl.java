package com.farmworld.all.service;

import org.springframework.stereotype.Service;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.mapper.ImageMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ImageServiceImpl implements ImageService {

	private ImageMapper mapper;
	
	@Override
	public ImageVO get(Integer k) {
		return mapper.select(k);
	}

	@Override
	public void add(ImageVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public void modify(ImageVO vo) {
		
	}

	@Override
	public void delete(Integer k) {
		
	}


}
