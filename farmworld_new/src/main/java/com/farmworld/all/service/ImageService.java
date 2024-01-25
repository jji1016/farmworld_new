package com.farmworld.all.service;

import java.util.List;
import java.util.Map;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.farm.domain.MyFarmVO;

public interface ImageService extends Generic<ImageVO, Integer> {
	
	public Integer addGetNum(ImageVO vo);
	
	public Integer MaxFolder();

	public void delImage(Map<String, Object> paramMap);

	public List<ImageVO> getList(MyFarmVO vo);

}
