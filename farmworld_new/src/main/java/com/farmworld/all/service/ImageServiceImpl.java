package com.farmworld.all.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.mapper.ImageMapper;
import com.farmworld.farm.domain.MyFarmVO;

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
		mapper.insertReturn(vo);
	}

	@Override
	public void modify(ImageVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(Integer k) {
		mapper.delete(k);
	}

	@Override
	public Integer addGetNum(ImageVO vo) {
		mapper.insertReturn(vo);
		return vo.getImage_folder_num();
	}

	@Override
	public Integer MaxFolder() {
		return mapper.maxNum();
	}

	@Override
	public void delImage(Map<String, Object> paramMap) {
		mapper.delImage(paramMap);
	}

	@Override
	public List<ImageVO> getList(MyFarmVO vo) {
		
		return mapper.selectAll(vo);
	}


}
