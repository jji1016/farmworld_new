package com.farmworld.edu.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.farmworld.edu.domain.MonthFarmTechLst;
import com.farmworld.edu.util.EduRestApiUtilXml;


@Service
public class EduService {
	private static final String SECURITY = "20240125930NT4LOI997AD1CZL9OG";
	
	public String apiTest(String eduMonth, String srchStr, int pageNum) {
        System.out.println("eduMonth--"+eduMonth);
        System.out.println("srchStr--"+srchStr);
		String url = "http://api.nongsaro.go.kr/service/monthFarmTech/monthFarmTechLst";
	
		HashMap<String, String> data = new HashMap<String, String>(); 
		HashMap<String, String> headerData = new HashMap<String, String>(); 
		data.put("apiKey", SECURITY);
		data.put("numOfRows", "8");
		data.put("srchStr", ""+srchStr); // 벼 검색내용
		data.put("sEraInfo", ""+eduMonth); //01 몇월인지
		data.put("pageNo", String.valueOf(pageNum)); //7 넘어갈 페이지
		headerData.put("Content-Type", "text/xml;charset=UTF-8");
		
		String result = EduRestApiUtilXml.ConnHttpGetType(url, headerData, data, MonthFarmTechLst.class);
		
		return result;
    
   
}
}
