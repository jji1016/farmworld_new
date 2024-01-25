package com.farmworld.board.mapper;

import java.util.List;

import com.farmworld.board.domain.CommentVO;

public interface CommentMapper {
	
	 public List<CommentVO> getCommentsByBoardNum(int board_num);
	 
	 public void registerComment(CommentVO commentVO);

	public void deleteComment(CommentVO commentVO);

	public void updateComment(CommentVO commentVO);

}
