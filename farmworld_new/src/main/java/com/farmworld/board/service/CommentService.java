package com.farmworld.board.service;

import java.util.List;

import com.farmworld.all.service.Generic;
import com.farmworld.board.domain.CommentVO;

public interface CommentService extends Generic<CommentVO, Integer> {
	
	public List<CommentVO> comAll(int board_num);

	public void addComment(CommentVO commentVO);

	public void delComment(CommentVO commentVO);

	public void modComment(CommentVO commentVO);
}
