package com.farmworld.all.service;

import java.util.Map;

import com.farmworld.all.domain.ImageVO;

public interface ImageService extends Generic<ImageVO, Integer> {
	
	public Integer addGetNum(ImageVO vo);
	
	public Integer MaxFolder();

	public void delImage(Map<String, Object> paramMap);

}
