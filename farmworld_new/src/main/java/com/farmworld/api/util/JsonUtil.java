package com.farmworld.api.util;


import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Log4j
public class JsonUtil {
	
	public static <T> T parseJson(String JsonString, Class<T> clazz) {
		
		Gson gson = new Gson();
		log.info("Json시작, jsonstring : "+ JsonString);
		log.info(clazz);
		T result = gson.fromJson(JsonString, clazz);
		log.info("json끝, parseJson result : " +result);
		
		return result;
	}

}
