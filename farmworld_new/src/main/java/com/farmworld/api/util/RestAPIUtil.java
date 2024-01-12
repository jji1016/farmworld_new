package com.farmworld.api.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;

import lombok.extern.log4j.Log4j;

@Log4j
public class RestAPIUtil {
	// http 연결을 위한 url, 헤더/요청 파라미터, 응답할 데이터 형식 전달 필요
	public static <T> T ConnHttpGetType(String connUrl, HashMap<String, String> headerData,
			HashMap<String, String> Data, Class<T> classType) {
		// 문자열 동적 처리

		try {
			StringBuilder urlBuilder = new StringBuilder(connUrl);
			int count = 0;
			for (String key : Data.keySet()) {
				if (count == 0) {

					urlBuilder.append(
							"?" + URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(Data.get(key), "UTF-8"));

				} else {
					urlBuilder.append(
							"&" + URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(Data.get(key), "UTF-8"));
				}
				count++;
			}
			log.info(urlBuilder.toString());
			if (urlBuilder.toString().startsWith("https")) {
				return JsonUtil.parseJson(RestAPIUtil.httpsConn(urlBuilder.toString(), headerData), classType);
			}else {
				return JsonUtil.parseJson(RestAPIUtil.httpConn(urlBuilder.toString(), headerData), classType);
			}

		} catch (Exception e) {
			log.error(e);

		}
		
		return null;
	}
	
	public static String httpsConn(String connUrl, HashMap<String, String> headerData) throws IOException {
		URL url = new URL(connUrl);
		//서비스를 요청할 API에 파라미터 정보와 함께 요청	
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		
		for(String key : headerData.keySet()) {
			conn.addRequestProperty(key, headerData.get(key));
		}
		BufferedReader rd;
		
		if(conn.getResponseCode()>=200&& conn.getResponseCode()<=300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line=rd.readLine())!=null){
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		
		
		return sb.toString();
	}
	
	public static String httpConn(String connUrl, HashMap<String, String> headerData) throws IOException {
		URL url = new URL(connUrl);
		//서비스를 요청할 API에 파라미터 정보와 함께 요청
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		
		for(String key : headerData.keySet()) {
			conn.addRequestProperty(key, headerData.get(key));
		}
		BufferedReader rd;
		
		if(conn.getResponseCode()>=200&& conn.getResponseCode()<=300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line=rd.readLine())!=null){
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		
		
		return sb.toString();
	}
	
	
	public static String posthttpsConn(String connUrl, HashMap<String, String> headerData, String postData) throws IOException {
		URL url = new URL(connUrl);
		//서비스를 요청할 API에 파라미터 정보와 함께 요청	
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		
		for(String key : headerData.keySet()) {
			conn.addRequestProperty(key, headerData.get(key));
		}
		conn.setDoOutput(true); // false:Get, true:Post
		conn.getOutputStream().write(postData.getBytes());; // 출력스트림얻기 : 요청을 받는 곳에서 데이터를 읽고 쓸 수 있음, byte[]로 읽어야함.
		
		BufferedReader rd;
		
		if(conn.getResponseCode()>=200&& conn.getResponseCode()<=300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line=rd.readLine())!=null){
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		
		
		return sb.toString();
	}
	public static String posthttpConn(String connUrl, HashMap<String, String> headerData) throws IOException {
		URL url = new URL(connUrl);
		//서비스를 요청할 API에 파라미터 정보와 함께 요청	
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		
		for(String key : headerData.keySet()) {
			conn.addRequestProperty(key, headerData.get(key));
		}
		
		
		BufferedReader rd;
		
		if(conn.getResponseCode()>=200&& conn.getResponseCode()<=300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line=rd.readLine())!=null){
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		
		
		return sb.toString();
	}
	
	
	
	

}

