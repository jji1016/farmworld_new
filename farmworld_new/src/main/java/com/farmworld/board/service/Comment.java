package com.farmworld.board.service;

import java.util.List;

import com.farmworld.all.service.Generic;
import com.farmworld.board.domain.BoardVO;
import com.farmworld.board.domain.CommentVO;

public interface Comment extends Generic<BoardVO, String> {
	
	public List<CommentVO> comAll(int board_num);
}
