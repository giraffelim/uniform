package com.uni.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uni.domain.Sinchung_ListVO;
import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;
import com.uni.service.MemberService;
import com.uni.service.WorkPlaceService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/uniform/*")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	private WorkPlaceService service_work;

	@Autowired
	private PasswordEncoder pwencoder;
	
	@Inject
	private uni_MemberMapper mapper;

	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String find_id(String name, String email, Model model) {
		log.info(name + " : " + email);
		uni_MemberVO member = service.find_id(name, email);
		model.addAttribute("find_id", member);
		return "login";
	}

	@RequestMapping(value = "find_pw", method = RequestMethod.POST)
	public String find_pw(String userPW, String userID, String email, Model model) {
		log.info(userPW + " : " + userID + " : " + email);
		model.addAttribute("find_pw", service.find_pw(userPW, userID, email));
		return "login";
	}

	@GetMapping("/join")
	public void join() {
		log.info("join");
	}

	@PostMapping("/join")
	public String join(uni_MemberVO member) {
		log.info("join");
		log.info(member);
		if(member.getUserPW() == null) {
			// 임의의 ID, PW 지정
			member.setUserID(pwencoder.encode("uniform"));
			member.setUserPW(pwencoder.encode("uniform"));
			log.warn("addInfo ======"+member);
			service.insertInfoMember(member);
			return "redirect:/dummy";
		}else {
			 member.setUserPW(pwencoder.encode(member.getUserPW()));
			service.insertSelectKey(member);
		}
		log.info("==========================이것은인코딩후패스워드:" + member.getUserPW());
		return "redirect:/uniform/index";
	}

	@GetMapping("/uniform/index")
	public void index() {

	}

	// end user가 로그인화면에서 input id에 아이디를 입력했을 경우
	// 아이디의 존재 유무를 확인해주는 컨트롤러
	@GetMapping(value = "/idcheck/{id}", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String confirmID(@PathVariable("id") String id) {
		uni_MemberVO vo = service.checkID(id);
		log.info("uni_Membr: " + vo);
		return vo == null ? "okay" : "";

	}

	// index에서 마이페이지 클릭시 이동
	@GetMapping("/myPage")
	public void mypage(Model model, Long mno) {
		log.info("마이페이지 컨트롤러 mno" + mno);
		List<Sinchung_ListVO> unionSinchungList = service_work.sinchung_list(mno);
		List<Sinchung_ListVO> IunionSinchungList = service_work.Isinchung_list(mno);
		model.addAttribute("unionSinchungList", unionSinchungList);
		model.addAttribute("IunionSinchungList", IunionSinchungList);
		log.info("=======================mypage 컨트롤러==============================");

	}

	@RequestMapping(value = "moreInfo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public ResponseEntity<List<Sinchung_ListVO>> moreInfo(Long mno) {
		service_work.sinchung_list_ajax(mno);

		return new ResponseEntity<List<Sinchung_ListVO>>(service_work.sinchung_list_ajax(mno), HttpStatus.OK);

	}

	@RequestMapping(value = "moreInfoImde", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public ResponseEntity<List<Sinchung_ListVO>> moreInfoImde(Long mno) {
		service_work.Isinchung_list_ajax(mno);
		

		
		return new ResponseEntity<List<Sinchung_ListVO>>(service_work.Isinchung_list_ajax(mno), HttpStatus.OK);

	}

	// 마이페이지에서 profile 수정버튼 클릭시 회원정보 수정 페이지로 이동
	/*
	 * @GetMapping("/MemberModify") public void memberModify() {
	 * log.info("=======================memberModify컨트롤러=========================");
	 * }
	 */

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	//회원정보수정으로 이동
	@GetMapping("/uniform/updateMember")
	public void memberUpdate() {
		log.info("==get!!!! updateMember 호출됨=========================");
	}
	//회원정보수정
	
	@PostMapping("/uniform/updateMember")
	public String memberUpdate(RedirectAttributes rttr, uni_MemberVO vo) {
		log.info("==post!!!! updateMember 호출됨=========================" + vo);
		
		vo.setUserPW(pwencoder.encode(vo.getUserPW()));
		service.updateMember(vo);

		return "redirect:/";
	}
	
    
 // end user가 로그인화면에서 input id에 아이디를 입력했을 경우
    // 아이디의 존재 유무를 확인해주는 컨트롤러
    @GetMapping(value = "/confirm/{name}/{phone}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public uni_MemberVO confirmSnsID(@PathVariable("name") String name, @PathVariable("phone") String phone){
    	log.warn(name+","+phone);
        uni_MemberVO vo = service.confirm(name,phone);
        log.info("uni_Membr: "+ vo);
        return vo;
        
    }
    
    @PutMapping(value="/mergeMember", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
	public uni_MemberVO mergeMember(@RequestBody uni_MemberVO vo) {
    	log.warn("mergeMember ==== VO ==>"+ vo);
    	uni_MemberVO returnVO = null;
		if(vo.getGoogleId() != null) {
			// vo 넘겨서 update
			log.info("googleId Merge");
			service.mergeGoogle(vo);
			returnVO = mapper.getByGoogle(vo.getGoogleId());
		}else {
			log.info("naver Merge");
			service.mergeNaver(vo);
			returnVO = mapper.getByNaver(vo.getNaverId());
		}
		
		return returnVO;
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
