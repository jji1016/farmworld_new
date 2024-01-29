package com.farmworld.edu.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.farmworld.api.util.RestAPIUtil;
import com.farmworld.api.util.RestApiUtilXml;
import com.farmworld.edu.domain.MonthFarmTechLst;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class EduService {
	private static final String SECURITY = "20240125930NT4LOI997AD1CZL9OG";
	
	public MonthFarmTechLst apiTest() {
        
		String url = "http://api.nongsaro.go.kr/service/monthFarmTech/monthFarmTechLst";
		HashMap<String, String> data = new HashMap<String, String>(); 
		HashMap<String, String> headerData = new HashMap<String, String>(); 
		data.put("apiKey", SECURITY);
		
		headerData.put("Content-Type", "text/xml;charset=UTF-8");
		System.out.println("서비스시작");
		MonthFarmTechLst result = RestApiUtilXml.ConnHttpGetType(url, headerData, data, MonthFarmTechLst.class);
		log.info("result"+result);
		
		return result;
	}
}
