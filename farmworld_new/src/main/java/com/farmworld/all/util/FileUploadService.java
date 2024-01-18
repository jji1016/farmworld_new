package com.farmworld.all.util;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.farmworld.all.domain.ImageVO;
import com.farmworld.all.service.ImageService;

@Service
public class FileUploadService {
	
	@Autowired
	private ImageService imageService;
	
	static String uploadDir = "C:\\Users\\keduit\\git\\farmworld_new\\farmworld_new\\src\\main\\webapp\\resources\\upload\\";
	
	public String uploadFile(MultipartFile file, String path) throws IOException, IllegalStateException {
	    String folderPath = "";  // 폴더 경로

	    
	        try {
	            // 저장 경로 설정    
	            
	            String fileName = file.getOriginalFilename();
	            
	            
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
	    
		return folderPath;
	}
	

}
