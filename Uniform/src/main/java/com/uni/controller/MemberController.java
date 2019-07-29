package com.uni.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uni.domain.uni_MemberVO;
import com.uni.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@AllArgsConstructor
@Log4j
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Autowired
	private PasswordEncoder pwencoder;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String find_id(String name, String email, Model model) {
		log.info(name + " : " + email);
		uni_MemberVO member = service.find_id(name, email);
		model.addAttribute("find_id", member);
		return "login";
	}

	@RequestMapping(value = "find_pw", method = RequestMethod.POST)
	public String find_pw(String userPW, String userID, String email, Model model) {
		UUID uuid = UUID.randomUUID();
		String str = Long.toString(uuid.getLeastSignificantBits(), 16);
		userPW = str.substring(9);

		log.info(userPW + " : " + userID + " : " + email);

		String encoding_userPW = pwencoder.encode(userPW);

		if (service.find_pw(encoding_userPW, userID, email)) {

			String subject = "UNIFORM 임시 비밀번호";
			final String msg = "<div align='center' style='border: 1px solid black'>"
					+ "<h3 style='color: blue'>임시 비밀번호 <h3>" + "<div style='font-size: 130%'> 임시 비밀번호 : <strong>"
					+ userPW + "<strong> 입니다.";

			final MimeMessagePreparator preparator = new MimeMessagePreparator() {

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {

					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("uniform@gmail.com");
					helper.setTo(email);
					helper.setSubject(subject);
					helper.setText(msg, true);
				}
			};
			mailSender.send(preparator);
		}
		model.addAttribute("find_pw", service.find_pw(encoding_userPW, userID, email));
		return "login";
	}

	@GetMapping("/uniform/updateMember")
	public void memberUpdate() {
		log.info("==get!!!! updateMember 호출됨=========================");
	}

	@PostMapping("/uniform/updateMember")
	public String memberUpdate(RedirectAttributes rttr, uni_MemberVO vo) {
		log.info("==post!!!! updateMember 호출됨=========================" + vo);

		if (service.updateMember(vo)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/";
	}
	
	
	//프로필사진 업로드
	@PostMapping(value = "/uploadProfile")
	public ResponseEntity<String> uploadProfile(MultipartFile[] uploadFile) {
		log.info("===============uploadPhoto 호출됨 =======================");
		String all = "";
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();
		//저장 폴더 경로 설정하기 (저장 경로,날짜 세퍼레이터)
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath : " + uploadPath);
		
		//현재 파일경로가 존재한다면 true 파일경로가 존재하지 않으면 false
		//mkdirs를 생성한다. yyyy/MM/dd
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
			}
		
		//foreach문으로 배열처리
		for(MultipartFile multipartFile : uploadFile) {
			log.info("------------------------------");
			log.info("upload File name"+ multipartFile.getOriginalFilename());
			log.info("upload File size"+ multipartFile.getSize());
			
			//크롬은 파일명만 들어감
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE는 경로로 들어가기 때문에 substring(읽을 문자열 인덱스);
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("업로드된 파일 실제 이름 : "+uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() +"_"+ uploadFileName;
			
			try {
				//날짜별폴더에 파일 생성
				File saveFile = new File(uploadPath,uploadFileName);
				
				//실제 업로드
				multipartFile.transferTo(saveFile);
				all = all+ uploadFolderPath;
				//mime 타입 이미지 검증
				if(checkImageType(saveFile)) {
					
					//썸네일 객체 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+ uploadFileName));
					
					//썸네일레이터 사용하여 실제 적용
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100); 
					
					all = all+"\\s_"+uploadFileName;
					log.info("all==========================================="+all);
					thumbnail.close();
					
				}else {
					return new ResponseEntity<String>("fail" , HttpStatus.OK);
				}
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}//catch
		}//for
	
		return new ResponseEntity<String>(all , HttpStatus.OK);
	}
	
	 @GetMapping("/display")
	 @ResponseBody 
	 public ResponseEntity<byte[]> getFile(String fileName){ 
		 //String rootDirectory = "c:\\upload\";
		 log.info("display================================="+fileName);
		 File file = new File("c:\\upload\\"+fileName);
		 log.info("display==================="+file);
		 
		 ResponseEntity<byte[]> result = null;
		 
		 try {
			HttpHeaders header = new HttpHeaders();
			String contentType = new Tika().detect(file.toPath());
			header.add("Content-Type", contentType );
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return result;
	 }
	 
	 @PostMapping("/deleteFile")
	 @ResponseBody
	 public ResponseEntity<String> deleteFile(String fileName){
		 log.info("deleteFile : " + fileName);
		 File file;
		 
		 try {
			//썸네일 파일 삭제. file 디코드 상태로 만들기
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			//원본파일 삭제하기 위한 replace
			String largeFileName = file.getAbsolutePath().replace("s_", "");
			log.info("largeFileName" + largeFileName);
			
			//원본파일 삭제하기. 
			file = new File(largeFileName);
			file.delete();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		 return new ResponseEntity<String>("delete", HttpStatus.OK);
	 }
	 
	
	//프로필 업로드 관련 메서드
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	private boolean checkImageType(File file) {
		
		try {
			String contentType = new Tika().detect(file);
			log.info(contentType);
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
