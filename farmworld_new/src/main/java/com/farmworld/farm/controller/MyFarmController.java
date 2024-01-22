package com.farmworld.farm.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.GrowCriteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.all.service.ImageService;
import com.farmworld.all.util.FileUploadService;
import com.farmworld.farm.domain.GrowUpVO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.farm.service.GrowUp;
import com.farmworld.farm.service.MyFarm;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/myfarm")
@AllArgsConstructor
public class MyFarmController {
	
	@Autowired
	private MyFarm myFarmService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private GrowUp growUpService;
	
	@Autowired
	private FileUploadService fileUpload;

	
	private static String uploadDir = "C:\\Users\\keduit\\git\\farmworld_new\\farmworld_new\\src\\main\\webapp\\resources\\upload\\";
	
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
	
	@GetMapping("/modify")
	public void modifyFarm(Model model, MyFarmVO myFarmVO) {
		model.addAttribute("vo",myFarmService.get(myFarmVO.getFarm_num()));
	}

	
	@GetMapping("/farm")
	public void moveFarm(MyFarmVO myFarmVO, Model model) {
		System.out.println(myFarmVO);
		myFarmService.view(myFarmVO);
		model.addAttribute("vo", myFarmService.get(myFarmVO.getFarm_num()));
	}
	
	@GetMapping({"/main", "/"})
	public void myfarmMain(Criteria cri, Model model) {
		cri.setAmount(6);
		int total = myFarmService.getTotal(cri);
		pageDTO pageResult = new pageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
	}
	
	@GetMapping("/register")
	public void registerget() {}
	
	@PostMapping("/register")
	public String register(@RequestParam("image1") MultipartFile file,  HttpSession session, MyFarmVO myFarmVO) {
	    Integer userNum = (Integer) session.getAttribute("user_num");
	    Integer imageNum = imageService.MaxFolder(); 
	    String filePath = "";  // 폴더 경로
	    ImageVO vo = new ImageVO();
	    if (!file.isEmpty()) {
	        try {
	        	String fileName = file.getOriginalFilename();
	        	filePath = uploadDir + imageNum + "/";
	        	fileUpload.uploadFile(file, filePath);
	        	vo.setImage1(fileName);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    imageNum = imageService.addGetNum(vo);
		myFarmVO.setImage_folder_num(imageNum);
		myFarmService.add(myFarmVO);
	    return "redirect:/myfarm/main";    
	}
	@PostMapping("/modify")
	public String modify(@RequestParam("image1") MultipartFile file, Model model, HttpSession session, MyFarmVO myFarmVO) {
		
		return "redirect:/myfarm/farm?farm_num="+myFarmVO.getFarm_num();
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
	
	@PostMapping("/searchFarm")
	@ResponseBody
	public ResponseEntity<String> searchFarm(@RequestParam("keyword") String keyword) {
		Criteria cri = new Criteria();
		cri.setKeyword(keyword);
	    Integer farmNum = myFarmService.searchFarmKeyword(cri);
	    if (farmNum == null) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail");
	    } else {
	        return ResponseEntity.ok(farmNum.toString());
	    }
	}
	
	@PostMapping("/remove")
	public String deleteFarm(MyFarmVO vo) {
		myFarmService.delete(vo.getFarm_num());
		return "redirect:/myfarm/main";
	}
	
	@GetMapping("/growlist")
	public void growlist(MyFarmVO vo, Criteria cri, Model model) {
		
		cri.setAmount(6);
		int total = growUpService.getTotal(cri);
		pageDTO pageResult = new pageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
		model.addAttribute("vo", myFarmService.get(vo.getFarm_num()));
	}
	
	@ResponseBody
	@PostMapping("/growlist")
	public List<GrowUpVO> growgetlist(GrowCriteria cri, Model model){
		System.out.println(cri);
		cri.setAmount(6);

		List<GrowUpVO> list = growUpService.growAll(cri);
		
		
		return list;
	}
	
	@GetMapping("/growboard")
	public void growboard(GrowUpVO vo,Model model) {
		System.out.println(vo);
		GrowUpVO gvo = growUpService.get(vo.getGrow_num());
		model.addAttribute("vo", growUpService.get(vo.getGrow_num()));
		model.addAttribute("farmvo", myFarmService.get(gvo.getFarm_num()));
		model.addAttribute("image", imageService.get(gvo.getImage_folder_num()));
	}
	
	
	@GetMapping("/growregister")
	public void growregister(MyFarmVO vo, Model model) {
		model.addAttribute("vo", myFarmService.get(vo.getFarm_num()));
	}
	
	
	@GetMapping("/growmodify")
	public void growmodify(GrowUpVO vo, Model model) {
		GrowUpVO gvo = growUpService.get(vo.getGrow_num());
		model.addAttribute("vo", growUpService.get(vo.getGrow_num()));
		model.addAttribute("farmvo", myFarmService.get(gvo.getFarm_num()));
		model.addAttribute("image", imageService.get(gvo.getImage_folder_num()));
	}
	
	@PostMapping("/growmodify")
	public String growModify(ArrayList<MultipartFile> files, GrowUpVO vo) {
		System.out.println(vo);
		ImageVO image = imageService.get(vo.getImage_folder_num()) ;
		int imageNum = vo.getImage_folder_num();
		String imageNumString = String.valueOf(imageNum);
		System.out.println(image);
		for (int i = 0; i < files.size(); i++) {
	        MultipartFile file = files.get(i);

	        System.out.println("name:" + file.getOriginalFilename());
	        System.out.println("size:" + file.getSize());

	        if (file.getSize() > 0) {
	            try {
	                String fileName = file.getOriginalFilename();
	                String filePath = uploadDir + imageNumString + "/";
	                fileUpload.uploadFile(file, filePath);
	                System.out.println("반복i:"+i);

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
		imageService.modify(image);
		growUpService.modify(vo);
		return "redirect:/myfarm/growboard?grow_num="+vo.getGrow_num();
	}
	
	@PostMapping("/growregister")
	public String addgrow(ArrayList<MultipartFile> files, GrowUpVO vo) {
		System.out.println(vo);
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
	    vo.setImage_folder_num(imageNum);
	    System.out.println(vo);
	    growUpService.add(vo);
	    return "redirect:/myfarm/growlist?farm_num=" + vo.getFarm_num();
	}
	
	@ResponseBody
	@PostMapping("/getcategory")
	public List<GrowUpVO> category(GrowCriteria cri){
		cri.setAmount(6);
		
		List<GrowUpVO> list = growUpService.categoryAll(cri);
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



}
