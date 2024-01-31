package com.farmworld.api.util;


import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Log4j
public class JsonUtil {
	
	public static <T> T parseJson(String JsonString, Class<T> clazz) {
		
		Gson gson = new Gson();
		System.out.println("여기?"+JsonString);
		T result = gson.fromJson(JsonString, clazz);
		System.out.println("끝"+JsonString);
		return result;
	}

}
