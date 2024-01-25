package com.farmworld.mypage.service;

import java.io.File;
import java.sql.Date;

import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ImageUploadService {
	
	private MyPageService service;
	
	private static String uploadDir = "C:\\Users\\keduit\\Desktop\\farm_me_ws\\farmworld_new_240118\\farmworld_new\\src\\main\\webapp\\resources\\upload\\profile\\";
	
	public String uploadImg(MultipartFile img, Integer user_num) {
		
		try {
			//이미지 이름에 user_num 추가
			String imgName = String.valueOf(user_num) + "_" + img.getOriginalFilename();
			
			//이미지 저장
			String imgPath = uploadDir + imgName;	//이미지 경로
			File dest = new File(imgPath); //업로드된 이미지의 저장 경로를 나타내는 File 객체 생성
			img.transferTo(dest); //MultipartFile 객체인 img에서 실제 파일을 dest에 전송 -> 업로드 된 이미지가 지정된 디렉터리에 저장
			
			return imgName;	//업로드 된 이미지 정보(이름) 반환
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;	//업로드 실패 시 null 반환
		}
		
	}
}
