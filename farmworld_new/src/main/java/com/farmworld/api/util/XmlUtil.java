package com.farmworld.api.util;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.google.gson.Gson;

public class XmlUtil {
	private static final Logger logger = LoggerFactory.getLogger(XmlUtil.class);
	
	public static <T> T parseXml(String xmlString, Class<T> clazz) throws IOException {
		System.out.println(xmlString);
		// XML을 JSON노드로 변환
		XmlMapper xmlMapper = new XmlMapper();
		JsonNode node = xmlMapper.readTree(xmlString.getBytes());
		System.out.println(xmlString.getBytes());
		// JSON노드를 JSON문자열로 변환
		ObjectMapper jsonMapper = new ObjectMapper();
		String jsonString = jsonMapper.writeValueAsString(node);
		
		System.out.println("JSON변환한다");
		// Json을 지정된 JAVA 클래스를 파싱(변환)
		T result = JsonUtil.parseJson(jsonString, clazz);
		
		System.out.println("parseJson {} : "+jsonString);
		System.out.println("parseJson result {} : "+result);
		
		return result;
	}
}
