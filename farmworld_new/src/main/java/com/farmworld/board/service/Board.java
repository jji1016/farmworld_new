package com.farmworld.board.service;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.service.Generic;
import com.farmworld.board.domain.BoardVO;

public interface Board extends Generic<BoardVO, Integer>{
	
	public List<BoardVO> listAll();
	
	public List<BoardVO> searchList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
