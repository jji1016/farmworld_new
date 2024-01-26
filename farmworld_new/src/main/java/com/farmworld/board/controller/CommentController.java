package com.farmworld.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    	System.out.println("getcom실행");
        // 댓글을 가져오는 비즈니스 로직을 호출
        List<CommentVO> comments = commentService.comAll(boardNum);
        System.out.println(comments);
        return comments;
    }
	
    @PostMapping("/addComment")
    @ResponseBody
    public String addComment(HttpSession session, CommentVO commentVO, Model model) {
        // 댓글을 추가하는 비즈니스 로직 호출
        commentService.addComment(commentVO);
        return "success";
    }
    
    @PostMapping("/delComment")
    @ResponseBody
    public String delComment(CommentVO commentVO) {
    	System.out.println("삭제 vo"+commentVO);
    	commentService.delComment(commentVO);
    	// 댓글을 추가하는 비즈니스 로직 호출
    	return "success";
    }
    
    @PostMapping("/modComment")
    @ResponseBody
    public String modComment(CommentVO commentVO) {
    	System.out.println("수정 vo"+commentVO);
    	commentService.modComment(commentVO);
    	// 댓글을 추가하는 비즈니스 로직 호출
    	return "success";
    }
    
    
    
}
