package com.farmworld.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.farmworld.all.domain.Criteria;
import com.farmworld.board.domain.BoardVO;
import com.farmworld.board.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	// 의존성 주입(final)(AllArgsConstructor이용)
	private final BoardMapper mapper;
	
	@Override
	public List<BoardVO> listAll() {
		log.info("listAll()실행");
		return mapper.selectAll();
	}

	@Override
	public void add(BoardVO vo) {
		log.info("register()실행 vo: "+vo);
		mapper.insert(vo);
	}

	@Override
	public void modify(BoardVO vo) {
		log.info("modify실행");
		mapper.update(vo);
	}

	@Override
	public void delete(Integer key) {
		log.info("delete실행");
		mapper.delete(key);
	}

	@Override
	public BoardVO get(Integer key) {
		log.info("get실행");
		return mapper.select(key);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVO> searchList(Criteria cri) {
		log.info("----service in getList -----");
		log.info(cri);
		List<BoardVO> result = mapper.getListWithPaging(cri);
		log.info("----service out getList----");
		return result;
	}

	
}
