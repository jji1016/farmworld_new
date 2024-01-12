package com.farmworld.board.service;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.service.Generic;
import com.farmworld.board.domain.BoardVO;

public interface BoardService extends Generic<BoardVO, Integer>{
	
	public List<BoardVO> listAll();
	
	public int getTotal(Criteria cri);
	
	public List<BoardVO> searchList(Criteria cri);
}
