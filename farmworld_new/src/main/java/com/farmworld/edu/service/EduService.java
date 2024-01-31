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
		
		String result = EduRestApiUtilXml.ConnHttpGetType(url, headerData, data);
		
		return result;
	}
	
	public String getAgritech(int curationNo) {
		System.out.println("curationNo--"+curationNo);
		// monthFarmTechDtlGuideLst 
		String url1 = "http://api.nongsaro.go.kr/service/monthFarmTech/monthFarmTechDtlGuideLst";
		HashMap<String, String> data1 = new HashMap<String, String>(); 
		HashMap<String, String> headerData1 = new HashMap<String, String>(); 
		data1.put("apiKey", SECURITY);
		data1.put("srchCurationNo", String.valueOf(curationNo));
		headerData1.put("Content-Type", "text/xml;charset=UTF-8");
		String result1 = EduRestApiUtilXml.ConnHttpGetType(url1, headerData1, data1);
		System.out.println("result1::"+result1);
		
		// monthFarmTechDtlDefaultInfo
		String url2 = "http://api.nongsaro.go.kr/service/monthFarmTech/monthFarmTechDtlDefaultInfo";
		HashMap<String, String> data2 = new HashMap<String, String>(); 
		HashMap<String, String> headerData2 = new HashMap<String, String>(); 
		data2.put("apiKey", SECURITY);
		data2.put("srchCurationNo", String.valueOf(curationNo));
		headerData2.put("Content-Type", "text/xml;charset=UTF-8");
		String result2 = EduRestApiUtilXml.ConnHttpGetType(url2, headerData2, data2);
		System.out.println("result2::"+result2);
		
		// monthFarmTechDtl
		String srchCntntsSnn=result1.substring(result1.indexOf("<cntntsSnn>")+20,result1.indexOf("]]></cntntsSnn>"));
		System.out.println("srchCntntsSnn::"+srchCntntsSnn);
		String url3 = "http://api.nongsaro.go.kr/service/monthFarmTech/monthFarmTechDtl";
		HashMap<String, String> data3 = new HashMap<String, String>(); 
		HashMap<String, String> headerData3 = new HashMap<String, String>(); 
		data3.put("apiKey", SECURITY);
		data3.put("srchCurationNo", String.valueOf(curationNo));
		data3.put("srchCntntsSnn", srchCntntsSnn);
		headerData3.put("Content-Type", "text/xml;charset=UTF-8");
		String result3 = EduRestApiUtilXml.ConnHttpGetType(url3, headerData3, data3);
		System.out.println("result3::"+result3);
		
		
		
		return result1;
	}
	
}
