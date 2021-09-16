package com.bh.b4.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	public void fileDelete(File file) throws Exception {
		
	}
	
	//fileSave 메서드 생성
	//파일 저장
	public String fileSave(MultipartFile multipartFile, File file) throws Exception {
		//저장
		//경로 받아온 후 파일 없으면 생성  
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//파일명 생성
		String fileName = UUID.randomUUID().toString();
		fileName = fileName+"_"+multipartFile.getOriginalFilename();
		
		
		//파일 정보 저장
		file = new File(file, fileName);
		
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileName;
	}

}
