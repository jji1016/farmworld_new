package com.farmworld.all.service;

import com.farmworld.all.domain.ImageVO;

public interface ImageService extends Generic<ImageVO, Integer> {
	
	public Integer addGetNum(ImageVO vo);
	
	public Integer MaxFolder();

}
