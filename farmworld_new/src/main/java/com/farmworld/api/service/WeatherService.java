package com.farmworld.api.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.farmworld.api.model.WeatherResponse;
import com.farmworld.api.util.RestAPIUtil;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class WeatherService {
	private static final String SECURITY = "rIWEpDoAlyY3dRtdXm7X76uCXLIKlEKbIodCjXzNf7MH9IwlreWNKEmOGwEEGzxWRB5uxmsw+vvEqz5hBsYYDA==";
	
	public WeatherResponse apiTest() {
        // 현재 날짜 가져오기
        LocalDate currentDate = LocalDate.now();

        // 포맷 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

        // 포맷에 맞게 날짜를 문자열로 변환
        String formattedDate = currentDate.format(formatter);
        
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		HashMap<String, String> data = new HashMap<String, String>(); 
		HashMap<String, String> headerData = new HashMap<String, String>(); 
		data.put("ServiceKey", SECURITY);
		data.put("pageNo", "1");
		data.put("numOfRows", "1000");
		data.put("dataType", "JSON");
		data.put("base_date", formattedDate);
		data.put("base_time", "0500");
		data.put("nx", "55");
		data.put("ny", "127");
		headerData.put("Content-Type", "application/json;charset=UTF-8;");
		
		WeatherResponse result = RestAPIUtil.ConnHttpGetType(url, headerData, data, WeatherResponse.class);
		log.info("result"+result);
		
		return result;
	}
}
