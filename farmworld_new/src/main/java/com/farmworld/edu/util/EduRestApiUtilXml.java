package com.farmworld.edu.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class EduRestApiUtilXml {
	private static final Logger logger = LoggerFactory.getLogger(EduRestApiUtilXml.class);
	
	// http연결을 위한 url, 헤더/본문 요청 파라미터, 응답할 데이터 형식 전달 필요
	public static <T> String ConnHttpGetType(String conUrl, HashMap<String, String> headerData, 
			HashMap<String, String> data){
		try {
			// StringBuilder를 쓰는이유
			// 원래 String 클래스는 불변
//			String s = "hello";
//			s = "hi"; // 문자열 변경할떄 마다 객체 다시 생성
			
			// 문자열 동적(가변) 처리 : 문자열의 처리 효율 증대
			StringBuilder urlBuilder = new StringBuilder(conUrl);
			// 반복 횟수 체크
			int count = 0;
			// 요청 : conUrl?name=value&name2=value.......이걸 해줘야함
			for(String key: data.keySet()) {
				if(count==0) {
					urlBuilder.append("?"+URLEncoder.encode(key, "UTF-8")+"="+URLEncoder.encode(data.get(key), "UTF-8")); 
				}else {																									
					urlBuilder.append("&"+URLEncoder.encode(key, "UTF-8")+"="+URLEncoder.encode(data.get(key), "UTF-8"));
				}
				count++;
			}
			System.out.println("xml변환시작한다" + urlBuilder);
			if(urlBuilder.toString().startsWith("https")) {
				return EduRestApiUtilXml.httpsConn(urlBuilder.toString(), headerData);
			}else {
				return EduRestApiUtilXml.httpConn(urlBuilder.toString(), headerData);
			}
		} catch (Exception e) {
			logger.error("ConnHttpGetType Error : {}",e);
			return null;
		}
	}
	
	public static String httpsConn(String conUrl, HashMap<String, String> headerData) throws IOException {
		URL url = new URL(conUrl);
		// 서비스를 제공할 API에 파라미터 정보와 함께 요청
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		for(String key: headerData.keySet()) {
			conn.addRequestProperty(key, headerData.get(key));
		}
		BufferedReader rd;
		
		//응답 성공
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <=300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		//응답 실패
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		System.out.println("뭐가문제지1");
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println("뭐가문제지2");
		return sb.toString();
	}
	
	public static String httpConn(String conUrl, HashMap<String, String> headerData) throws IOException {
		URL url = new URL(conUrl);
		// 서비스를 제공할 API에 파라미터 정보와 함께 요청
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");									
		for(String key: headerData.keySet()) {
			conn.addRequestProperty(key, headerData.get(key));
		}
		BufferedReader rd;
		
		//응답 성공
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <=300) {		
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		//응답 실패
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		System.out.println("뭐가문제지3");
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println("뭐가문제지4");
		return sb.toString();
	}
	
	// POST 방식으로 요청시
	public static String PosthttpConn(String conUrl, HashMap<String, String> headerData , String postData) throws IOException {
		URL url = new URL(conUrl);
		// 서비스를 제공할 API에 파라미터 정보와 함께 요청
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		
		for(String key: headerData.keySet()) {
			conn.addRequestProperty(key, headerData.get(key));
		}
		
		conn.setDoOutput(true); // false : Get , true : Post 를 의미함
		
		// String postData
		
		// HttpURLConnection객체에서 출력 스트림을 얻기위한 메서드
		// 요청을 받는 곳에서 데이터를 읽음
		conn.getOutputStream().write(postData.getBytes("UTF-8"));
		
		// 응답처리 단계 시작
		BufferedReader rd;
		
		//응답 성공
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <=300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		//응답 실패
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	}
}
