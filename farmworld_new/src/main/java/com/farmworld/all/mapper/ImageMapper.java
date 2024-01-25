package com.farmworld.all.mapper;

import java.util.List;
import java.util.Map;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.farm.domain.MyFarmVO;

public interface ImageMapper {
	
	public Integer insertReturn(ImageVO vo);
	
	public ImageVO select(Integer key);
	
	public void update(ImageVO vo);
	
	public void delete(int image_folder_num);
	
	public Integer maxNum();

	public void delImage(Map<String, Object> paramMap);

	public List<ImageVO> selectAll(MyFarmVO vo);
	
	
}
