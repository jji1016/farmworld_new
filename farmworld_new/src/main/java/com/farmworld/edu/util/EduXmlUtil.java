package com.farmworld.edu.util;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.google.gson.Gson;

public class EduXmlUtil {
	private static final Logger logger = LoggerFactory.getLogger(EduXmlUtil.class);
	
	public static <T> String parseXml(String xmlString, Class<T> clazz) throws IOException {
		
		System.out.println("xmlString::"+xmlString);
        
		
		
		return xmlString;
	}
}
