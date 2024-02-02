package com.farmworld.shop.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.shop.domain.GoodsVO;
import com.farmworld.shop.domain.UserAndReviewVO;
import com.farmworld.shop.service.GoodsService;

@Controller
public class GoodsController {
	private static final Logger log = LoggerFactory.getLogger(GoodsController.class);
	@Autowired
	private GoodsService goodsService;

	// 상품 화면 이동
	@GetMapping("/goods")
	public String showAddProductPage(Model model) {
		return "goods";
	}

	/**
	 * shop 리스트, 카테고리 이름, 갯수 가져오기
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/goods-list")
	public Map<String, Object> getGoodsList(GoodsVO vo){
		return goodsService.getGoodsList(vo);
	}

	// 상품 등록
	@RequestMapping(value = "/saveGoods", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> postLogin(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response, @RequestParam Map<String, String> param, HttpSession session) {
		Map<String, String> result = new HashMap<>();
		log.debug("get goods Data : " + param);
		
		try {
			/* 파일 저장 */
			Date today					= new Date();
			Locale currentLocale		= new Locale("KOREAN", "KOREA");
			String pattern				= "yyyyMMddHHmmss"; //hhmmss로 시간,분,초만 뽑기도 가능
			SimpleDateFormat formatter	= new SimpleDateFormat(pattern, currentLocale);
			String fileName				= formatter.format(today) + "_" + file.getOriginalFilename();
			String path					= request.getServletContext().getRealPath("") + "resources\\filefolder\\";
	        
	        File folder = new File(path);
	        if (!folder.exists()) { // 디렉터리가 없으면 생성
	            folder.mkdirs();
	        }
	        // 파일 저장
	        File storedFile = new File(path + fileName);
	        file.transferTo(storedFile);
	        
	        // 파일 위치 저장
	        ImageVO imageVo = new ImageVO();
	        imageVo.setImage_folder_num(goodsService.getCount());
	        imageVo.setImage1("filefolder\\" + fileName);
	        imageVo.setImage2("");
	        imageVo.setImage3("");
	        
	        int successCnt = goodsService.saveImage(imageVo);
	        
	        result.put("imageChk", successCnt == 0 ? "N" : "Y");
			/* 파일 저장 */
	        
	        if(successCnt > 0) {
	        	/* VO Setting */
				GoodsVO goodsVo = new GoodsVO();
				goodsVo.setGoods_title(param.get("goods_title"));
				goodsVo.setGoods_content(param.get("goods_content"));
				goodsVo.setGoods_category(param.get("goods_category"));
				goodsVo.setGoods_price(Integer.parseInt(param.get("goods_price")));
				goodsVo.setGoods_inventory(param.get("goods_inventory"));
				goodsVo.setGoods_view(Integer.parseInt(param.get("goods_view")));
				goodsVo.setImage_folder_num(imageVo.getImage_folder_num());
				goodsVo.setUser_num(Integer.parseInt(session.getAttribute("user_num").toString()));
				/* VO Setting */
				if(param.get("goods_num") != null){
					goodsVo.setGoods_num(Integer.parseInt(param.get("goods_num")));
					successCnt = goodsService.modifyGoods(goodsVo);
				} else {
					successCnt = goodsService.saveGoods(goodsVo);
				}

				result.put("goodsChk", successCnt == 0 ? "N" : "Y");
	        }
		} catch(Exception e) {
			log.error(e.getMessage());
			result.put("imageChk", "N");
			result.put("goodsChk", "N");
		} finally {
			return result;
		}
	}

	@ResponseBody
	@PostMapping("/shop-detail")
	public Map<String, Object> shopDetail(GoodsVO vo, HttpSession session){
		return goodsService.shopDetail(vo, session);
	}

	@ResponseBody
	@PostMapping("/delete_goods")
	public Map<String, String> deleteGoods(GoodsVO vo){
		Map<String, String> result = new HashMap<>();

		int successCnt = goodsService.deleteGoods(vo);

		result.put("result", successCnt == 0 ? "Y" : "N");

		return result;
	}

/* 리뷰 가져오기 */	
	@ResponseBody
	@RequestMapping(value = "/getReviewlist", method = RequestMethod.POST)
	public List<UserAndReviewVO> getReviewList(@RequestParam("goods_num") int goods_num) {
	    List<UserAndReviewVO> list = goodsService.getReviewList(goods_num);
	    System.out.println("list" + list);
	    return list;
	}


}