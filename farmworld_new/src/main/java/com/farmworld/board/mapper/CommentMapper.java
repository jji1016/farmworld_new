package com.farmworld.board.mapper;

import java.util.List;

import com.farmworld.board.domain.CommentVO;

public interface CommentMapper {
	
	 public List<CommentVO> getCommentsByBoardNum(int board_num);


}
