package com.farmworld.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.farmworld.board.domain.CommentVO;
import com.farmworld.board.mapper.CommentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommentServiceImpl implements CommentService{
	// 의존성 주입(final)(AllArgsConstructor이용)
	private final CommentMapper mapper;

	@Override
	public CommentVO get(Integer k) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void add(CommentVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(CommentVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer k) {
		// TODO Auto-generated method stub
		
	}

	@Override
    public List<CommentVO> comAll(int board_num) {
        // 댓글 목록을 가져오는 부분을 여기에 구현
        return mapper.getCommentsByBoardNum(board_num);
    }
	
	

}
