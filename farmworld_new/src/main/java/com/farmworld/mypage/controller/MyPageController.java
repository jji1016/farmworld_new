package com.farmworld.mypage.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.all.service.ImageService;
import com.farmworld.all.util.FileUploadService;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.login.domain.UserVO;
import com.farmworld.mypage.domain.MyPageVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.mypage.service.ImageUploadService;
import com.farmworld.mypage.service.MyPageService;
import com.farmworld.mypage.service.OrderService;
import com.farmworld.mypage.service.ReviewService;
import com.farmworld.shop.domain.GoodsVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@AllArgsConstructor
@Log4j
@SessionAttributes("user_num") //세션에 저장된 user_num 가져오기
public class MyPageController {

	private final OrderService orderService;
	private final ReviewService reviewService;
	private final MyPageService mypageService;
	private final ImageUploadService imageUploadService;
	private FileUploadService fileUpload;
	private final ImageService imageService;

	private static String uploadDir = "C:\\Users\\keduit\\Desktop\\farmworld_ new_git\\farmworld_new\\farmworld_new\\farmworld_new\\src\\main\\webapp\\resources\\upload\\review\\";
	
/* 메인
 * 	비회원 권한 없음 */
	@RequestMapping(value = "/myPageMain", method = RequestMethod.GET)
	public String main(HttpSession session, Model model, RedirectAttributes rttr) throws IOException {
		Integer user_num = (Integer) session.getAttribute("user_num");
		
		if(user_num == null){ //비회원은 로그인 페이지로 이동
			System.out.println("비회원 마이페이지 접근 권한 없음");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>alert('로그인이 필요합니다.'); window.location.href='/user/login';</script>");
//			out.flush(); 
			rttr.addFlashAttribute("message", "로그인이 필요합니다.");
			return "redirect:/user/login";
		}else {
			System.out.println("회원 마이페이지 메인 접속");
			MyPageVO vo = mypageService.get(user_num);
			System.out.println("메인 받았다:"+vo);
			log.info(vo);
			model.addAttribute("vo",vo);
		}
		
		return "/mypage/myPageMain";
	}
	
/* 정보 수정 페이지 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getModify(HttpSession session, Model model) {
		System.out.println("getModify 넘어옴");
		Integer user_num = (Integer) session.getAttribute("user_num");
		MyPageVO vo = mypageService.get(user_num);
		
		//세션 새로 저장
		session.setAttribute("user_nickname", vo.getUserVO().getUser_nickname());
		
		System.out.println("getModify mainService에서 받았다:"+vo);
		model.addAttribute("vo", vo);
		return "/mypage/modify";
	}
	
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public Map<String, Object> modify(@RequestParam("user_image") MultipartFile imgName, @ModelAttribute("user_num") Integer user_num, UserVO userVo, String farm_name) {
		MyPageVO vo = new MyPageVO();
		vo.setUserVO(userVo);
		vo.setFarm_name(farm_name);
		System.out.println("postModify 넘어옴"+vo);
		Map<String, Object> response = new HashMap<>();
		
		// 이미지 업로드
	    if (!imgName.isEmpty()) {
	        try {
	            String user_img = imageUploadService.uploadImg(imgName, user_num);
	            System.out.println("사진 이름" + user_img);
	            vo.getUserVO().setUser_image(user_img);
	            // 이미지 정보 DB에 저장
	            mypageService.imgUpload(vo.getUserVO());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    try {
	        mypageService.modify(vo);
	        response.put("success", true);
	        response.put("message", "수정이 완료되었습니다.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("success", false);
	        response.put("message", "수정 중 오류 발생");
	    }

	    return response;
	}
	
/* 탈퇴(비활성회원 전환) 
 * 비번 체크 후 탈퇴 진행 
 * user_type = 1 */	
	@ResponseBody
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public boolean pwCheck(@ModelAttribute("user_num") Integer user_num, UserVO vo) {
		System.out.println("비번 확인");
		vo.setUser_num(user_num);
		if(mypageService.pwCheck(vo) != null) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeDisabled", method = RequestMethod.POST)
	public Map<String, Object> delete(@ModelAttribute("user_num") Integer user_num) {
		System.out.println("비활성 진행");
		Map<String, Object> response = new HashMap<>();
	    try {
	        mypageService.delete(user_num); //user_type = 1로 바꿈
	        response.put("success", true);
	        System.out.println("비활성 성공");
	    } catch (Exception e) {
	    	e.printStackTrace();
	        response.put("success", false);
	        System.out.println("비활성 실패");
	    }
	    return response;
	}	
	
	

	/* 구매내역 */
	@GetMapping("/buylist")
	public String buyList(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("구매내역 user_num : " + user_num);
		log.info("구매내역 user_num : " + user_num);
		
		return "/mypage/purchase";
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylist1", method = RequestMethod.POST)
	public List<OrderVO> getbuyList1(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("구매내역1 user_num : " + user_num);
		log.info("구매내역1 user_num : " + user_num);
		return orderService.buyList1(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylist2", method = RequestMethod.POST)
	public List<GoodsVO> getbuyList2(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("구매내역2 user_num : " + user_num);
		log.info("구매내역2 user_num : " + user_num);
		return orderService.buyList2(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylist3", method = RequestMethod.POST)
	public List<MyFarmVO> getbuyList3(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("구매내역3 user_num : " + user_num);
		log.info("구매내역3 user_num : " + user_num);
		return orderService.buyList3(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylistimg", method = RequestMethod.POST)
	public List<ImageVO> getbuyListImg(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("구매내역사진 user_num : " + user_num);
		log.info("구매내역사진 user_num : " + user_num);
		return orderService.buylistimg(user_num);
	}
	
	
	/* 구매취소 */
	@PostMapping("/returnpurchase")
	public String returnpurchase(@RequestParam("order_num") int order_num, RedirectAttributes rttr) {
		System.out.println("구매취소 order_num : " + order_num);
		log.info("구매취소 order_num : " + order_num);
		
		int count = orderService.returnpurchase(order_num);
		System.out.println("count : "+count);
		if (count == 1) {
			rttr.addFlashAttribute("result", order_num);
		}
		return "redirect:/mypage/buylist";
	}
	
	
	/* 판매내역 */
	@GetMapping("/selllist")
	public String sellList(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("판매내역 user_num : " + user_num);
		log.info("판매내역 user_num : " + user_num);
		return "/mypage/sale";
	}
	@ResponseBody
	@RequestMapping(value = "/getselllist1", method = RequestMethod.POST)
	public List<OrderVO> getsellList1(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("판매내역1 user_num : " + user_num);
		log.info("판매내역1 user_num : " + user_num);
		return orderService.sellList1(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getselllist2", method = RequestMethod.POST)
	public List<GoodsVO> getsellList2(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("판매내역2 user_num : " + user_num);
		log.info("판매내역2 user_num : " + user_num);
		return orderService.sellList2(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getselllist3", method = RequestMethod.POST)
	public List<MyFarmVO> getsellList3(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("판매내역3 user_num : " + user_num);
		log.info("판매내역3 user_num : " + user_num);
		return orderService.sellList3(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getselllistimg", method = RequestMethod.POST)
	public List<ImageVO> getsellListImg(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("판매내역4 user_num : " + user_num);
		log.info("판매내역4 user_num : " + user_num);
		return orderService.selllistimg(user_num);
	}
	
	
	
	/* 리뷰내역 */
	@GetMapping("/review")
	public String review(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("리뷰관리");
		log.info("리뷰관리");
		return "/mypage/review";
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewlist1", method = RequestMethod.POST)
	public List<OrderVO> review1(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("Ajax : 리뷰관리1");
		log.info("Ajax : 리뷰관리1");
		return reviewService.review1(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewlist2", method = RequestMethod.POST)
	public List<GoodsVO> review2(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("Ajax : 리뷰관리2");
		log.info("Ajax : 리뷰관리2");
		return reviewService.review2(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewlist3", method = RequestMethod.POST)
	public List<ReviewVO> review3(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("Ajax : 리뷰관리3");
		log.info("Ajax : 리뷰관리3");
		return reviewService.review3(user_num);
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewimage", method = RequestMethod.POST)
	public List<ImageVO> reviewimgage(HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		System.out.println("Ajax : 리뷰관리이미지");
		log.info("Ajax : 리뷰관리이미지");
		return reviewService.reviewimage(user_num);
	}
	
	
	
	/* 리뷰상세 */
	@PostMapping("/reviewupdate")
	public String reviewupdate(@RequestParam("review_num") Integer review_num, Model model) {
		ReviewVO vo = reviewService.get(review_num);
		System.out.println(vo);
		System.out.println("확인1");
		int a = vo.getImage_folder_num();
		System.out.println("리뷰상세보기" + review_num);
		model.addAttribute("getreview", reviewService.getreviewVO(review_num));
		model.addAttribute("getreviewVOimage", imageService.get(a));
		System.out.println(model);
		System.out.println("확인2");
		return "/mypage/reviewupdate";
	}
	@PostMapping("/getreviewVOimage")
	public String getreviewVOimage(@RequestParam("image1") String image1, Model model) {
		System.out.println("리뷰상세이미지" + image1);
		System.out.println("확인3");
		model.addAttribute("getreviewVOimage", reviewService.getreviewVOimage());
		System.out.println(model);
		System.out.println("확인4");
		return "/mypage/reviewupdate";
	}
	
	
	/* 리뷰수정 */
	@PostMapping("/updatereview")
	public String updatereview(MultipartFile file, @RequestParam(name = "reviewimage", required = false) String image1,  ReviewVO review, RedirectAttributes rttr) {
		Integer imageNum = review.getImage_folder_num();
		ImageVO image = imageService.get(imageNum);
	    System.out.println("review : " + review);
	    System.out.println("imgae : " + image);
        System.out.println("여기1");
	    if (file != null && !file.isEmpty()) {
	        // 이미지가 null이 아닌 경우에만 아래 코드 실행
	        System.out.println("여기2");
	        if (file.getSize() > 0) {
	            try {
	                String filePath = uploadDir  + imageNum + "/";
	                String fileName = fileUpload.uploadFile(file, filePath);
	                Path FPath = Paths.get(uploadDir + imageNum + "\\" + image.getImage1());
	                System.out.println("filePath : " + filePath);
	                System.out.println("fileName : " + fileName);        
	                System.out.println("FPath : " + FPath);
	                System.out.println("여기3");
	                if (image.getImage1() != null) {
	                    Files.delete(FPath);
	                    System.out.println(FPath);
	                    System.out.println("여기4");
	                }
	                image.setImage1(fileName);
	            } catch (Exception e) {
	                e.printStackTrace();
	                System.out.println("여기5");
	            }
	        }
	       
	        imageService.modify(image);
	        System.out.println("이미지1: " + image.getImage1());
	        System.out.println("여기6");
	        
	        
	    }
	    reviewService.updatereview(review);
	    return "redirect:/mypage/review";
	}
	 
	
	/* 리뷰삭제 */
	@PostMapping("/reviewdelete")
	public String reviewdelete(@RequestParam("review_num") Integer review_num, RedirectAttributes rttr) {
		System.out.println("리뷰삭제");
		log.info("리뷰삭제");
		
		int count = reviewService.reviewdelete(review_num);
		System.out.println("count : "+count);
		if (count == 1) {
			rttr.addFlashAttribute("result", review_num);
		}
		System.out.println("리뷰삭제2");
		log.info("리뷰삭제2");
		return "redirect:/mypage/review";
	}
}