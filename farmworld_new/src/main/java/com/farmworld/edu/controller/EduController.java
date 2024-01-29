package com.farmworld.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.api.model.WeatherResponse;
import com.farmworld.board.domain.CommentVO;
import com.farmworld.board.service.CommentService;
import com.farmworld.edu.domain.MonthFarmTechLst;
import com.farmworld.edu.service.EduService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/edu/*")
@Log4j
public class EduController {
	
	@Autowired
    private EduService eduService;
	
	@GetMapping("/agritech")
	public void aa() {}
	
	@ResponseBody
    @PostMapping("/agritech")
    public MonthFarmTechLst Lst() {
    	
		return eduService.apiTest();
    }
    
    
    
}

