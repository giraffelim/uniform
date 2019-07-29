package com.uni.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	// 파일을 년/월/일 단위의 폴더를 통해 관리
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat();
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	// 파일이 이미지 타입인지를 검증
	private boolean checkImageType(File file) {
		try {
			String contentType = new Tika().detect(file.toPath());
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.getMessage();
		}
		
		return false;
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		
		
		// UUID 적용
		UUID uuid = UUID.randomUUID();
		
	}
	
}
