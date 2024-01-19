
package com.farmworld.mypage.controller;

import java.lang.ProcessBuilder.Redirect;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.farm.domain.MyFarmVO;
import com.farmworld.mypage.domain.OrderVO;
import com.farmworld.mypage.domain.ReviewVO;
import com.farmworld.mypage.service.OrderService;
import com.farmworld.mypage.service.ReviewService;
import com.farmworld.shop.domain.GoodsVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@AllArgsConstructor
@Log4j
public class MyPageController {

	private final OrderService orderService;
	private final ReviewService reviewService;

	/* 구매내역 */
	@GetMapping("/buylist")
	public String buyList() {
		System.out.println("구매내역");
		log.info("구매내역");
		return "purchase";
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylist1", method = RequestMethod.POST)
	public List<OrderVO> getbuyList1() {
		System.out.println("Ajax : 구매내역1");
		log.info("Ajax : 구매내역1");
		return orderService.buyList1();
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylist2", method = RequestMethod.POST)
	public List<GoodsVO> getbuyList2() {
		System.out.println("Ajax : 구매내역2");
		log.info("Ajax : 구매내역2");
		return orderService.buyList2();
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylist3", method = RequestMethod.POST)
	public List<MyFarmVO> getbuyList3() {
		System.out.println("Ajax : 구매내역3");
		log.info("Ajax : 구매내역3");
		return orderService.buyList3();
	}
	@ResponseBody
	@RequestMapping(value = "/getbuylistimg", method = RequestMethod.POST)
	public List<ImageVO> getbuyListImg() {
		System.out.println("Ajax : 구매내역사진");
		log.info("Ajax : 구매내역사진");
		return orderService.buylistimg();
	}
	
	
	/* 구매취소 */
	@PostMapping("/returnpurchase")
	public String returnpurchase(@RequestParam("order_num") Integer order_num, RedirectAttributes rttr) {
		System.out.println("구매취소");
		log.info("구매취소");
		System.out.println(order_num);
		log.info(order_num);
		
		int count = orderService.returnpurchase(order_num);
		System.out.println("count : "+count);
		if (count == 1) {
			rttr.addFlashAttribute("result", order_num);
		}
		System.out.println("구매취소2");
		log.info("구매취소2");
		return "redirect:/mypage/buylist";
	}
	
	
	/* 판매내역 */
	@GetMapping("/selllist")
	public String sellList() {
		System.out.println("판매내역");
		log.info("판매내역");
		return "sale";
	}
	@ResponseBody
	@RequestMapping(value = "/getselllist1", method = RequestMethod.POST)
	public List<OrderVO> getsellList1() {
		System.out.println("Ajax : 판매내역1");
		log.info("Ajax : 판매내역1");
		return orderService.sellList1();
	}
	@ResponseBody
	@RequestMapping(value = "/getselllist2", method = RequestMethod.POST)
	public List<GoodsVO> getsellList2() {
		System.out.println("Ajax : 판매내역2");
		log.info("Ajax : 판매내역2");
		return orderService.sellList2();
	}
	@ResponseBody
	@RequestMapping(value = "/getselllist3", method = RequestMethod.POST)
	public List<MyFarmVO> getsellList3() {
		System.out.println("Ajax : 판매내역3");
		log.info("Ajax : 판매내역3");
		return orderService.sellList3();
	}
	@ResponseBody
	@RequestMapping(value = "/getselllistimg", method = RequestMethod.POST)
	public List<ImageVO> getsellListImg() {
		System.out.println("Ajax : 판매내역사진");
		log.info("Ajax : 판매내역사진");
		return orderService.selllistimg();
	}
	
	
	
	/* 리뷰내역 */
	@GetMapping("/review")
	public String review() {
		System.out.println("리뷰관리");
		log.info("리뷰관리");
		return "review";
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewlist1", method = RequestMethod.POST)
	public List<OrderVO> review1() {
		System.out.println("Ajax : 리뷰관리1");
		log.info("Ajax : 리뷰관리1");
		return reviewService.review1();
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewlist2", method = RequestMethod.POST)
	public List<GoodsVO> review2() {
		System.out.println("Ajax : 리뷰관리2");
		log.info("Ajax : 리뷰관리2");
		return reviewService.review2();
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewlist3", method = RequestMethod.POST)
	public List<ReviewVO> review3() {
		System.out.println("Ajax : 리뷰관리3");
		log.info("Ajax : 리뷰관리3");
		return reviewService.review3();
	}
	@ResponseBody
	@RequestMapping(value = "/getreviewimage", method = RequestMethod.POST)
	public List<ImageVO> reviewimgage() {
		System.out.println("Ajax : 리뷰관리이미지");
		log.info("Ajax : 리뷰관리이미지");
		return reviewService.reviewimage();
	}
	
	
	/* 리뷰상세 */
	@PostMapping("/reviewupdate")
	public String reviewupdate(@RequestParam("review_num") Integer review_num, Model model) {
		System.out.println("리뷰상세보기" + review_num);
		model.addAttribute("getreview", reviewService.getreviewVO(review_num));
		System.out.println(model);

		return "reviewupdate";
	}

	
	/* 리뷰수정 */
	@PostMapping("/updatereview")
	public String updatereview(ReviewVO review, RedirectAttributes rttr) {
		System.out.println("리뷰수정 : " + review);
	   
	    int count = reviewService.updatereview(review);
	    if(count == 1) {
	        rttr.addFlashAttribute("result", "success");
	    }
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