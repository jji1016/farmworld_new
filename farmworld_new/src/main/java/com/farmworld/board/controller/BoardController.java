package com.farmworld.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.board.domain.BoardVO;
import com.farmworld.board.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Log4j
public class BoardController {
	private final BoardService boardService;
	
	@GetMapping("/list")
	public String listAll(Criteria cri, Model model) {
		System.out.println("시작");
		log.info("---- controller in list -----");
		System.out.println(cri);
		
		int total = boardService.getTotal(cri);
		pageDTO pageResult = new pageDTO(cri, total);
		model.addAttribute("pageMaker",pageResult);
		log.info("---- controller out list -----");
		System.out.println(total);
		System.out.println(pageResult);

		return "board/board";
	}
	
	@ResponseBody
	@RequestMapping(value="/searchList", method = RequestMethod.POST)
	public List<BoardVO> searchList(Criteria cri){
		System.out.println("searchList -> Type : "+ cri.getType());
		System.out.println("searchList -> Keyword : "+ cri.getKeyword());
		System.out.println("searchList리턴값:  "+boardService.searchList(cri));
		return boardService.searchList(cri);
	}
	
	// board/register.jsp로 화면 이동
		@GetMapping("/register")
		public void registerGet() {}
		
		// Ajax, Form으로 controller접근 : 데이터 이동
		@PostMapping("/register")
		public String register(BoardVO board, RedirectAttributes rttr) {
			
//			int num = boardService.add(board);
			log.info("board: "+board);
//			rttr.addFlashAttribute("alert",num);
			
			// redirect : 클라이언트의 브라우저에게 다른 URL이동하라는 명령
			//			  새로고침으로 인한 중복 요청 방지
			return "redirect:/board/list";
		}
		
		@GetMapping("/remove")
		public String remove(Integer bno,RedirectAttributes rttr) {
			log.info("remove실행 bno: "+bno);
//			int count = boardService.delete(bno);
//			if(count==1) {
//				rttr.addFlashAttribute("alert", "success");
//			}
			return "redirect:/board/list";
		}
		
		@GetMapping({"/get","/modify"})
		public void get(Integer bno , Model model) {
			log.info("get실행 bno: "+bno);
			BoardVO board = boardService.get(bno);
			model.addAttribute("board",board);
		}
		
		@PostMapping("/modify")
		public String modify(BoardVO board , RedirectAttributes rttr) {
			log.info("modify실행");
//			int count = boardService.modify(board);
//			if(count==1) {
//				rttr.addFlashAttribute("alert", "success");
//			}
			return "redirect:/board/list";
		}
		
		@PostMapping("/list")
		public void list(Integer bno,Model model) {
			log.info("해당 번호 회원 목록");
			List<BoardVO> listb = new ArrayList<BoardVO>();
			listb.add(boardService.get(bno));
			model.addAttribute("boardList",listb);
			log.info(model);
		}
	
}
