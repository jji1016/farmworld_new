package com.farmworld.board.mapper;

import java.util.List;

import com.farmworld.all.domain.Criteria;
import com.farmworld.board.domain.BoardVO;
import com.farmworld.login.domain.UserVO;

public interface BoardMapper {
	
	public void insert(BoardVO vo);

	public void insertSelectBno(BoardVO vo);

	public List<BoardVO> selectAll();

	public int update(BoardVO vo);

	public int delete(int board_num);

	public BoardVO select(Integer key);

	public List<BoardVO> getListWithSearch(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<BoardVO> getListWithPaging(Criteria cri);

}
