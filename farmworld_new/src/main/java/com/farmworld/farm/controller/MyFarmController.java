package com.farmworld.farm.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import com.farmworld.all.domain.GrowCriteria;
import com.farmworld.all.domain.GrowpageDTO;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.all.service.ImageService;
import com.farmworld.all.util.FileUploadService;
import com.farmworld.farm.domain.GrowUpVO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.farm.service.GrowUp;
import com.farmworld.farm.service.MyFarm;
import com.farmworld.shop.domain.GoodsVO;

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
		System.out.println(1);
		Map<String, Object> response = new HashMap<>();
		Boolean hasUserNum = session.getAttribute("user_num") != null;
		System.out.println(hasUserNum);
		System.out.println("세션유저" + session.getAttribute("user_num"));
		response.put("hasUserNum", hasUserNum);
		int farmnum;
		if (hasUserNum) {
			// 세션에 user_num이 있다면 응답에 user_num 추가
			Integer userNum = (Integer) session.getAttribute("user_num");
			System.out.println("usernum:" + userNum);
			MyFarmVO vo = myFarmService.getByUserNum(userNum);
			System.out.println(vo);
			if (vo == null) {
				farmnum = 0;
			} else {
				farmnum = vo.getFarm_num();
			}
			System.out.println(vo);
			response.put("userNum", userNum);
			if (farmnum == 0) {
				response.put("isfarm", false);
			} else {
				response.put("isfarm", true);
				response.put("farmnum", farmnum);
			}
		}
		System.out.println(3);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/modify")
	public void modifyFarm(Model model, MyFarmVO myFarmVO) {
		model.addAttribute("vo", myFarmService.get(myFarmVO.getFarm_num()));
	}

	@GetMapping("/farm")
	public void moveFarm(MyFarmVO myFarmVO, Model model, HttpServletRequest request) {
		System.out.println("경로알아보기" + request.getServletContext().getRealPath(""));
		System.out.println(myFarmVO);
		myFarmService.view(myFarmVO);
		model.addAttribute("vo", myFarmService.get(myFarmVO.getFarm_num()));
	}

	@GetMapping({ "/main", "/" })
	public void myfarmMain(Criteria cri, Model model, HttpSession session) {
		Boolean hasUserNum = session.getAttribute("user_num") != null;
		if (hasUserNum) {
			// 세션에 user_num이 있다면 응답에 user_num 추가
			Integer userNum = (Integer) session.getAttribute("user_num");
			System.out.println("usernum:" + userNum);
			MyFarmVO vo = myFarmService.getByUserNum(userNum);
			model.addAttribute("vo", vo);
		}
		cri.setAmount(6);
		int total = myFarmService.getTotal(cri);
		pageDTO pageResult = new pageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
	}

	@GetMapping("/register")
	public void registerget() {
	}

	@PostMapping("/register")
	public String register(@RequestParam("image1") MultipartFile file, HttpSession session, MyFarmVO myFarmVO) {
		Integer userNum = (Integer) session.getAttribute("user_num");
		Integer imageNum = imageService.MaxFolder();
		String filePath = ""; // 폴더 경로
		ImageVO vo = new ImageVO();
		System.out.println(file.getOriginalFilename());
		if (!file.isEmpty()) {
			try {
				filePath = uploadDir + imageNum + "/";
				String fileName = fileUpload.uploadFile(file, filePath);
				vo.setImage1(fileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		imageNum = imageService.addGetNum(vo);
		myFarmVO.setImage_folder_num(imageNum);
		myFarmVO.setUser_num(userNum);
		myFarmService.add(myFarmVO);
		return "redirect:/myfarm/main";
	}

	@PostMapping("/modify")
	public String modify(@RequestParam("image1") MultipartFile file, Model model, HttpSession session,
			MyFarmVO myFarmVO) {

		return "redirect:/myfarm/farm?farm_num=" + myFarmVO.getFarm_num();
	}

	@PostMapping("/removefarm")
	public String removeFarm(MyFarmVO vo) {
		vo = myFarmService.get(vo.getFarm_num());
		ImageVO imageVO = imageService.get(vo.getImage_folder_num());
		try {
			String folderPath = uploadDir + imageVO.getImage_folder_num();
			String filePath = folderPath;
			Path FPath;
			FPath = Paths.get(uploadDir + imageVO.getImage_folder_num() + "\\" + imageVO.getImage1());
			Files.delete(FPath);

		List<GrowUpVO> list = growUpService.GrowList(vo.getFarm_num());
		System.out.println("리스트"+list);
		if(list.size()>0) {
		for (GrowUpVO gvo : list) {
			System.out.println("방복");
			ImageVO gimageVO = imageService.get(vo.getImage_folder_num());
			try {
				String folderPath1 = uploadDir + gimageVO.getImage_folder_num() + "/";
				String filePath1 = folderPath1 + "/";
				Path FPath1;
				if (gimageVO.getImage1() != null) {
					FPath1 = Paths.get(filePath1 + gimageVO.getImage1());
					Files.delete(FPath1);
				}
				if (gimageVO.getImage2() != null) {
					FPath1 = Paths.get(filePath1 + gimageVO.getImage2());
					Files.delete(FPath1);
				}
				if (gimageVO.getImage3() != null) {
					FPath1 = Paths.get(filePath1 + gimageVO.getImage3());
					Files.delete(FPath1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("그로우업삭제");
			growUpService.delete(gvo.getGrow_num());
			System.out.println("그로우업완");
			imageService.delete(gimageVO.getImage_folder_num());
		}
		}
		FPath = Paths.get(uploadDir + imageVO.getImage_folder_num());
		Files.delete(FPath);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("마이팜삭제시작");
		myFarmService.delete(vo.getFarm_num());
		imageService.delete(imageVO.getImage_folder_num());
		return "redirect:/myfarm/main";
	}

	@ResponseBody
	@PostMapping("/getlist")
	public List<MyFarmVO> getlist(Criteria cri) {
		// 타입 설정
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

	@GetMapping("/growlist")
	public void growlist(MyFarmVO vo, GrowCriteria cri, Model model) {

		cri.setAmount(6);
		int total = growUpService.getTotal(cri);
		GrowpageDTO pageResult = new GrowpageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
		model.addAttribute("vo", myFarmService.get(vo.getFarm_num()));
	}

	@ResponseBody
	@PostMapping("/growlist")
	public List<GrowUpVO> growgetlist(GrowCriteria cri, Model model) {
		System.out.println(cri);
		cri.setAmount(6);

		List<GrowUpVO> list = growUpService.growAll(cri);
		int total = growUpService.getTotal(cri);
		GrowpageDTO pageResult = new GrowpageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
		return list;
	}

	@GetMapping("/growboard")
	public void growboard(GrowUpVO vo, Model model) {
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
		ImageVO image = imageService.get(vo.getImage_folder_num());
		int imageNum = vo.getImage_folder_num();
		String imageNumString = String.valueOf(imageNum);
		System.out.println(image);
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = files.get(i);

			System.out.println("name:" + file.getOriginalFilename());
			System.out.println("size:" + file.getSize());

			if (file.getSize() > 0) {
				try {

					String filePath = uploadDir + imageNumString + "/";
					String fileName = fileUpload.uploadFile(file, filePath);
					Path FPath;
					System.out.println("반복i:" + i);

					// 동적으로 setImage 실행
					switch (i) {
					case 1:
						FPath = Paths.get(uploadDir + imageNum + "\\" + image.getImage1());
						if (image.getImage1() != null) {
							Files.delete(FPath);
						}
						image.setImage1(fileName);
						break;
					case 2:
						FPath = Paths.get(uploadDir + imageNum + "\\" + image.getImage2());
						if (image.getImage2() != null) {
							Files.delete(FPath);
						}
						image.setImage2(fileName);
						break;
					case 3:
						FPath = Paths.get(uploadDir + imageNum + "\\" + image.getImage3());
						if (image.getImage3() != null) {
							Files.delete(FPath);
						}
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
		return "redirect:/myfarm/growboard?grow_num=" + vo.getGrow_num();
	}

	@PostMapping("/growdelete")
	public String deleteGrow(GrowUpVO vo) {

		vo = growUpService.get(vo.getGrow_num());
		System.out.println(vo);
		ImageVO imageVO = imageService.get(vo.getImage_folder_num());
		try {
			String folderPath = uploadDir + imageVO.getImage_folder_num() + "/";
			String filePath = folderPath + "/";
			Path FPath;
			if (imageVO.getImage1() != null) {
				FPath = Paths.get(filePath + imageVO.getImage1());
				Files.delete(FPath);
			}
			if (imageVO.getImage2() != null) {
				FPath = Paths.get(filePath + imageVO.getImage2());
				Files.delete(FPath);
			}
			if (imageVO.getImage3() != null) {
				FPath = Paths.get(filePath + imageVO.getImage3());
				Files.delete(FPath);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		growUpService.delete(vo.getGrow_num());
		imageService.delete(imageVO.getImage_folder_num());

		return "redirect:/myfarm/farm?farm_num=" + vo.getFarm_num();
	}

	@PostMapping("/growregister")
	public String addgrow(ArrayList<MultipartFile> files, GrowUpVO vo) {
		System.out.println(vo);
		ImageVO image = new ImageVO();
		Integer imageNum = imageService.MaxFolder();
		System.out.println("넘버" + imageNum);

		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = files.get(i);

			System.out.println("name:" + file.getOriginalFilename());
			System.out.println("size:" + file.getSize());

			if (file.getSize() > 0) {
				try {

					String filePath = uploadDir + imageNum + "/";
					String fileName = fileUpload.uploadFile(file, filePath);

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
	public List<GrowUpVO> category(GrowCriteria cri) {
		cri.setAmount(6);

		List<GrowUpVO> list = growUpService.categoryAll(cri);
		return list;

	}

	@GetMapping("/goodslist")
	public void goodslist(MyFarmVO myFarmVO, Criteria cri, Model model) {
		cri.setAmount(6);
		System.out.println(myFarmVO);
		int total = myFarmService.getGoodsCount(myFarmVO);
		System.out.println("토오타알"+total);
		pageDTO pageResult = new pageDTO(cri, total);
		System.out.println("페이지"+pageResult);
		model.addAttribute("pageMaker", pageResult);
		model.addAttribute("vo", myFarmService.get(myFarmVO.getFarm_num()));
		model.addAttribute("image", imageService.get(myFarmService.get(myFarmVO.getFarm_num()).getImage_folder_num()));
	}

	@ResponseBody
	@PostMapping("/getgoodsimage")
	public List<ImageVO> goodsimage(MyFarmVO myFarmVO) {
		List<ImageVO> imageVO = imageService.getList(myFarmVO);

		return imageVO;
	}

	@ResponseBody
	@PostMapping("/goodslist")
	public List<GoodsVO> getGoods(GrowCriteria cri) {
		cri.setAmount(6);
		System.out.println(cri);
		List<GoodsVO> goodsvo = myFarmService.getGoodsList(cri);
		return goodsvo;
	}

}
