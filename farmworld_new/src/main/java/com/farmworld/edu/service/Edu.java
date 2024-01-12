package com.farmworld.edu.service;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.service.Generic;
import com.farmworld.edu.domain.EduVO;

public interface Edu extends Generic<EduVO, Integer> {

	public List<EduVO> eduAll();

	public List<EduVO> searchList(Criteria cri);
		
}
