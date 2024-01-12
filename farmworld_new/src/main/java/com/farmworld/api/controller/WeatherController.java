package com.farmworld.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmworld.api.model.WeatherResponse;
import com.farmworld.api.service.WeatherService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class WeatherController {

	@Autowired
	private WeatherService weatherService;
	
	@ResponseBody
	@PostMapping("/weather")
	public WeatherResponse showWeather() {
		log.info(weatherService.apiTest());
		return weatherService.apiTest();
	}
	
}
