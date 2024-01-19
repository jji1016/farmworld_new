package com.farmworld.all.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.service.ImageService;

@Service
public class FileUploadService {
	
	@Autowired
	private ImageService imageService;
	
	
	public String uploadFile(MultipartFile file, String path) throws IOException, IllegalStateException {
	    String folderPath = "";  // 폴더 경로
	    String fileName = file.getOriginalFilename();
	    
	        try {
	            // 저장 경로 설정    
	            
	            
	            Date today = new Date();
	    		Locale currentLocale = new Locale("KOREAN", "KOREA");
	    		String pattern = "yyyyMMddHHmmss"; //hhmmss로 시간,분,초만 뽑기도 가능
	    		SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
	    		System.out.println(formatter.format(today));
	            fileName = formatter.format(today)+"_"+ fileName;
	            
	            File folder = new File(path);
	            if (!folder.exists()) {
	                folder.mkdirs();  // 디렉터리가 없으면 생성
	            }
	            // 파일 저장
	            folderPath = path+ fileName;
	            File dest = new File(folderPath);
	            file.transferTo(dest);


	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    
		return fileName;
	}
	

}
