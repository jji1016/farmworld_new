package com.farmworld.all.mapper;

import java.util.Map;

import com.farmworld.all.domain.ImageVO;

public interface ImageMapper {
	
	public Integer insertReturn(ImageVO vo);
	
	public ImageVO select(Integer key);
	
	public void update(ImageVO vo);
	
	public void delete(int image_folder_num);
	
	public Integer maxNum();

	public void delImage(Map<String, Object> paramMap);
	
	
}
