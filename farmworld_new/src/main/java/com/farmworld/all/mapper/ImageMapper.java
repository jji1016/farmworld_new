package com.farmworld.all.mapper;

import com.farmworld.all.domain.ImageVO;

public interface ImageMapper {
	
	public void insert(ImageVO vo);
	
	public ImageVO select(Integer key);
	
	public int update(ImageVO vo);
	
	public int delete(int image_folder_num);
}
