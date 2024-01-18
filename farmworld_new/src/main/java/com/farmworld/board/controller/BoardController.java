package com.farmworld.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.all.service.ImageService;
import com.farmworld.all.util.FileUploadService;
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
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private FileUploadService fileUpload;
	
	private static String uploadDir = "C:\\Users\\keduit\\Desktop\\farmworld_ new_git\\farmworld_new\\src\\main\\webapp\\resources\\upload\\";
	
	@GetMapping("/list")
	public String listAll(@RequestParam(name = "board_category", required = false) String boardCategory, Criteria cri, Model model) {
        // board_category 값이 있으면 cri에 설정
        if (boardCategory != null && !boardCategory.isEmpty()) {
            cri.setBoard_category(boardCategory);
        }
		System.out.println("시작");
		//board main 들어갔을 때 카테고리 default=notice 설정
		if(cri.getBoard_category() == null) {
			cri.setBoard_category("notice");
		}
		
		int total = boardService.getTotal(cri);
		pageDTO pageResult = new pageDTO(cri, total);
		model.addAttribute("pageMaker",pageResult);
		System.out.println(total);
		System.out.println("---------------결과"+pageResult);
		
		return "board/board";
	}
	
	@ResponseBody
	@RequestMapping(value="/searchList", method = RequestMethod.POST)
	public List<BoardVO> searchList(Criteria cri){
		return boardService.searchList(cri);
	}
	
	@GetMapping("/register")
	public void registerGet() {}
	
	@PostMapping("/register")
	public String register(ArrayList<MultipartFile> files, BoardVO board, RedirectAttributes rttr) {
		ImageVO image = new ImageVO();
	    Integer imageNum = imageService.MaxFolder();
	    System.out.println("파일"+files.get(0));

	    for (int i = 0; i < files.size(); i++) {
	        MultipartFile file = files.get(i);

	        System.out.println("name:" + file.getOriginalFilename());
	        System.out.println("size:" + file.getSize());

	        if (file.getSize() > 0) {
	            try {
	                String fileName = file.getOriginalFilename();
	                String filePath = uploadDir + imageNum + "/";
	                fileUpload.uploadFile(file, filePath);

	                // 동적으로 setImage 실행
	                switch (i) {
	                    case 1:
	                        image.setImage1(fileName);
	                        break;
	                    case 2:
	                        image.setImage2(fileName);
	                        break;
	                    case 3:
	                    	image.setImage3(fileName);
	                    // 필요한 만큼 계속 추가 가능
	                    default:
	                        break;
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    imageNum = imageService.addGetNum(image);
	    board.setImage_folder_num(imageNum);
		
		
		boardService.add(board);
		System.out.println("board: "+board);
		return "redirect:/board/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam(name = "board_num", required = false) Integer bno,RedirectAttributes rttr) {
		log.info("remove실행 bno: "+bno);
			boardService.delete(bno);
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam(name = "board_num", required = false) Integer bno, Model model) {
		System.out.println("get실행 bno: "+bno);
		BoardVO board = boardService.get(bno);
		System.out.println(board);
		model.addAttribute("board",board);
	}
	
	@PostMapping("/modify")
	public String modify(@RequestParam(name = "board_category", required = false) String boardCategory, BoardVO board , RedirectAttributes rttr) {
		boardService.modify(board);
		return "redirect:/board/list?board_category="+boardCategory;
	}
	
	@PostMapping("/increaseViewCount")
	@ResponseBody
	public String increaseViewCount(@RequestParam("board_num") int boardNum) {
	    // 게시물 조회수 증가 로직을 처리하는 서비스 메서드 호출
	    boardService.increaseViewCount(boardNum);
	    return "success";
	}
		
}
