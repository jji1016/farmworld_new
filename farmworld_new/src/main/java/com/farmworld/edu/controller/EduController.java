package com.farmworld.edu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.all.domain.Criteria;
import com.farmworld.all.domain.pageDTO;
import com.farmworld.edu.service.EduService;
import com.google.gson.JsonObject;
import com.google.gson.annotations.JsonAdapter;

@Controller
@RequestMapping("/edu/*")
public class EduController {
	
	@Autowired
    private EduService eduService;
	
	@GetMapping("/agritech")
	public void searchAgritech() {
		
	}
	
	@ResponseBody
    @PostMapping("/agritech")
    public Map<String, Object> Lst(@RequestParam(name = "eduMonth", required = false) String eduMonth, @RequestParam(name = "pageNum", required = false) int pageNum,
    		@RequestParam(name = "srchStr", required = false) String srchStr ) {
		System.out.println("eduMonth: " + eduMonth);
        System.out.println("srchStr: " + srchStr);
        if(eduMonth == null) {
        	eduMonth = "";
        }
        if(srchStr == null) {
        	srchStr = "";
        }
        String result=eduService.apiTest(eduMonth, srchStr, pageNum);
        int totalCount=Integer.valueOf(result.substring(result.indexOf("<totalCount>")+12,result.indexOf("</totalCount>")));
        Map<String, Object> map = new HashMap<String, Object>();
        pageDTO page=new pageDTO(new Criteria(pageNum,8),totalCount);
        map.put("page", page);
        map.put("eduData", result);
       
		return map;
    }
    
	@GetMapping("/dtlGuideLst")
	public String getDtlGuideLst() {
		
		return "edu/getAgritech";
	}
	
	@ResponseBody
	@PostMapping("/dtlGuideLst")
	public String dtlGuideLst(@RequestParam(name = "curationNo", required = false) int curationNo) {
		System.out.println("curationNo:"+curationNo);
		String result2 = eduService.getCntntsSnn(curationNo);
		System.out.println("dtlGuideLst::"+result2);
		
		return result2 ;
	}
    
    
}

