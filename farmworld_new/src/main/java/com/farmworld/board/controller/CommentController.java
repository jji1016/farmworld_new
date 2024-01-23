package com.farmworld.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.board.domain.CommentVO;
import com.farmworld.board.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/comment/*")
@AllArgsConstructor
@Log4j
public class CommentController {
	
	 @Autowired
	    private CommentService commentService;

	    @GetMapping("/getComments")
	    @ResponseBody
	    public List<CommentVO> getComments(@RequestParam("board_num") int boardNum) {
	    	System.out.println("넘어오나"+boardNum);
	        // 댓글을 가져오는 비즈니스 로직을 호출
	        List<CommentVO> comments = commentService.comAll(boardNum);
	        System.out.println("comments-="+comments);
	        return comments;
	    }
	
	
}
