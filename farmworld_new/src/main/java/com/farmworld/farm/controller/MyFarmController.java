package com.farmworld.farm.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.all.service.ImageService;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.farm.service.MyFarm;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/myfarm")
@AllArgsConstructor
public class MyFarmController {
	
	@Autowired
	private MyFarm myFarmService;
	
	@Autowired
	private ImageService imageService; 
	
	@GetMapping("/checkSession")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> checkSession(HttpSession session) {
	    Map<String, Object> response = new HashMap<>();
	    Boolean hasUserNum = session.getAttribute("user_num") != null;
	    
	    response.put("hasUserNum", hasUserNum);
	    
	    if (hasUserNum) {
	        // 세션에 user_num이 있다면 응답에 user_num 추가
	        String userNum = (String) session.getAttribute("user_num");
	        System.out.println("usernum:"+userNum);
	        response.put("userNum", userNum);
	    }
	    
	    return ResponseEntity.ok(response);
	}
	
	@GetMapping("/register")
	public void registerget() {}
	
	@GetMapping("/farm")
	public void moveFarm(MyFarmVO myFarmVO) {
		myFarmService.view(myFarmVO);
	}
	
	@GetMapping("/main")
	public void myfarmMain(Criteria cri, Model model) {
		cri.setAmount(6);
		int total = myFarmService.getTotal(cri);
		pageDTO pageResult = new pageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
	}
	
	@PostMapping("/register")
	public String register(@RequestParam("image1") MultipartFile file, Model model, HttpSession session, MyFarmVO myFarmVO) {
	    Integer userNum = (Integer) session.getAttribute("user_num");
	    Integer imageNum = 0; 
	    String folderPath = "";  // 폴더 경로

	    if (!file.isEmpty()) {
	        try {
	            // 저장 경로 설정    
	            String uploadDir = "C:\\Users\\keduit\\git\\farmworld_new\\farmworld_new\\src\\main\\webapp\\resources\\upload\\";
	            String fileName = file.getOriginalFilename();

	            // 폴더 생성
	            ImageVO vo = new ImageVO();
	            vo.setImage1(fileName);
	            imageNum = imageService.addGetNum(vo);
	            System.out.println(imageNum);
	            
	            folderPath = uploadDir + imageNum + "/";
	            
	            File folder = new File(folderPath);
	            if (!folder.exists()) {
	                folder.mkdirs();  // 디렉터리가 없으면 생성
	            }

	            // 파일 저장
	            String filePath = folderPath + fileName;
	            File dest = new File(filePath);
	            file.transferTo(dest);

	            // 모델에 파일 경로 추가
	            model.addAttribute("filePath", filePath);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
		myFarmVO.setImage_folder_num(imageNum);
		myFarmService.add(myFarmVO);
	    return "redirect:/myfarm/main";    
	}
		
	@GetMapping("/farmlist")
	public void farmlist(Criteria cri, Model model) {
		//6개 설정
		cri.setAmount(6);
		int total = myFarmService.getTotal(cri);
		pageDTO pageResult = new pageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
	}
	
	@ResponseBody
	@PostMapping("/getlist")
	public List<MyFarmVO> getlist(Criteria cri){
		
		//타입 설정
		switch (cri.getType()) {
		case "T":
			cri.setType("farm_name");
			break;
		case "W":
			cri.setType("user_num");
			break;		
		}

		List<MyFarmVO> list = myFarmService.farmAll(cri);
		
		
		return list;
	}

}
