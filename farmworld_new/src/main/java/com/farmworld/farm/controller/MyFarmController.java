package com.farmworld.farm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.farm.service.MyFarm;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myfarm")
@Log4j
@AllArgsConstructor
public class MyFarmController {
	
	@Autowired
	private MyFarm myFarmService;
	
	@GetMapping("/checkSession")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkSession(HttpSession session) {
        Map<String, Boolean> response = new HashMap<>();
        Boolean hasUserNum = session.getAttribute("user_num") != null;
        response.put("hasUserNum", hasUserNum);
        return ResponseEntity.ok(response);
    }
	@GetMapping("/register")
	public void registerget() {}
	
	@PostMapping("/register")
	public String register(HttpSession session, MyFarmVO myFarmVO) {
		Integer userNum = (Integer) session.getAttribute("user_num");
		myFarmService.add(myFarmVO);
	    return "redirect:/myfarm/farmlist";    
	}
	
	@GetMapping("/farmlist")
	public void farmlist(Criteria cri, Model model) {
		int total = myFarmService.getTotal(cri);
		log.info(total);
		pageDTO pageResult = new pageDTO(cri, total);
		pageResult.getCri().setAmount(6);
		log.info(pageResult);
		model.addAttribute("pageMaker", pageResult);
	}
	
	@ResponseBody
	@PostMapping("/getlist")
	public List<MyFarmVO> getlist(Criteria cri){
		
		switch (cri.getType()) {
		case "T":
			cri.setType("farm_name");
			break;
		case "W":
			cri.setType("user_num");
			break;		
		}
		
		cri.setAmount(6);
		List<MyFarmVO> list = myFarmService.farmAll(cri);
		log.info(list);
		
		return list;
	}

}
