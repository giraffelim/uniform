package com.uni.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uni.domain.uni_AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {


   // 파일을 년/월/일 단위의 폴더를 통해 관리
   private String getFolder() {

      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date date = new Date();
      String str = sdf.format(date);
      return str.replace("-", File.separator);
   }

   // 파일이 이미지 타입인지를 검증
   private boolean checkImageType(File file) {
      try {
         String contentType = new Tika().detect(file.toPath());
         return contentType.startsWith("image");
      } catch (IOException e) {
         e.getMessage();
      }

      return false;
   }

   @PostMapping(value = "/uploadLeaseThumbnail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   @ResponseBody
   public ResponseEntity<List<uni_AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
      List<uni_AttachFileDTO> list = new ArrayList<uni_AttachFileDTO>();
      // 업로드 될 경로
      String uploadFolder = "c:/upload/temp/";
      
      String uploadFolderPath = getFolder();
      // make Folder
      File uploadPath = new File(uploadFolder, uploadFolderPath);
      log.info(uploadPath);
      
      // 파일 존재 유무 확인 -> 존재 하지 않는다면 생성
      if(uploadPath.exists() == false) {
         uploadPath.mkdirs();
      }
      
      for(MultipartFile multipartFile : uploadFile) {
         uni_AttachFileDTO atch = new uni_AttachFileDTO();
         log.info("---------------------------------------------");
         log.info("Upload File Name: "+multipartFile.getOriginalFilename());
         log.info("Upload File Size: "+multipartFile .getSize());
         
         String uploadFileName = multipartFile.getOriginalFilename();
         atch.setFileName(uploadFileName);
         
         // IE 브라우저인 경우
         uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
         log.info("only file name: "+uploadFileName);
         
         // UUID 적용
         UUID uuid = UUID.randomUUID();
         // 업로드 파일 이름 => uuid + i_ +  파일 이름
         uploadFileName = uuid.toString() + "_" + uploadFileName;
         atch.setUuid(uuid.toString());
         atch.setUploadPath(uploadFolderPath);
         log.info(uploadFileName);
         // 파일 객체 생성
         File saveFile = new File(uploadPath, uploadFileName);
         
         try {
            //파일 저장
            multipartFile.transferTo(saveFile);
            // 파일이 이미지 타입인지 체크
            if(checkImageType(saveFile)) {
               FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "Is_" + uploadFileName));
               
               // 썸네일 생성
               Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 450, 450);
            }
         }catch(Exception e) {
            log.error(e.getMessage());
         }
         
         list.add(atch);
         
      } // end For
      
      return new ResponseEntity<>(list, HttpStatus.OK);
   }

   @PostMapping("/deleteFile")
   @ResponseBody
   public ResponseEntity<String> deleteFile(String fileName) {
      log.info("deleteFile: " + fileName);
      File file;

      try {
         log.warn("encode FileName: " + URLDecoder.decode(fileName, "utf-8"));
         file = new File("c:/upload/temp/" + URLDecoder.decode(fileName, "utf-8"));
         file.delete();
         String largeFileName = file.getAbsolutePath().replace("Is_", "");
         log.info("largeFileName: " + largeFileName);
         file = new File(largeFileName);
         file.delete();
      } catch (Exception e) {
         e.printStackTrace();
      }

      return new ResponseEntity<String>("deleted", HttpStatus.OK);
   }

   @GetMapping("/display")
   @ResponseBody
   public ResponseEntity<byte[]> getFile(String fileName) {
      log.info("getFile");
      log.info("fileName" + fileName);
      // 파일 객체 생성
      File file = new File("c:/upload/temp/" + fileName);
      log.info("file: " + file);
      // 결과를 리턴할 ResponseEntity 객체 생성
      ResponseEntity<byte[]> result = null;

      // UUID 적용
      UUID uuid = UUID.randomUUID();
      try {
         // HttpHeader 객체 생성
         HttpHeaders header = new HttpHeaders();

         header.add("Content-Type", new Tika().detect(file.toPath()));
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

      } catch (Exception e) {
         e.printStackTrace();
      }
      return result;
   }

}
