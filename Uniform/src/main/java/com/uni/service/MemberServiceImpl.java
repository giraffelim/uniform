package com.uni.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_hotTopicVO;
import com.uni.mapper.uni_MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private uni_MemberMapper mapper;

	@Autowired
	private PasswordEncoder pwencoder;

	@Autowired
	private JavaMailSenderImpl mailSender;

	// 아이디 찾기 select
	@Override
	public uni_MemberVO find_id(String name, String email) {
		return mapper.find_id(name, email);
	}

	// 비밀번호 찾기 update
	@Override
	public boolean find_pw(String userPW, String userID, String email) {
		UUID uuid = UUID.randomUUID();
		String str = Long.toString(uuid.getLeastSignificantBits(), 16);
		userPW = str.substring(9);

		String encoding_userPW = pwencoder.encode(userPW);

		if (mapper.find_pw(encoding_userPW, userID, email)) {

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

		return mapper.find_pw(encoding_userPW, userID, email) == true ? true : false;
	}

	@Transactional
	@Override
	public void insertSelectKey(uni_MemberVO member) {
		mapper.insertSelectKey(member);
		mapper.insert(member.getMno());

	}

	@Override
	public uni_MemberVO checkID(String userID) {

		log.info("--------------- userid : " + mapper.checkID(userID));
		return mapper.checkID(userID);
	}

	@Transactional
	@Override
	public void insertInfoMember(uni_MemberVO member) {
		// TODO Auto-generated method stub
		mapper.insertInfoMember(member);
		mapper.insert(member.getMno());
	}

	@Override
	public uni_MemberVO confirm(String name, String phone) {
		// TODO Auto-generated method stub
		return mapper.confirm(name, phone);
	}

	@Override
	public void mergeGoogle(uni_MemberVO vo) {
		// TODO Auto-generated method stub
		mapper.mergeGoogle(vo);
	}

	@Override
	public void mergeNaver(uni_MemberVO vo) {
		// TODO Auto-generated method stub
		mapper.mergeNaver(vo);
	}

	@Override

	public boolean updateMember(uni_MemberVO vo) {

		boolean resultUpdate = mapper.updateMember(vo) == 1;

		return resultUpdate;
	}

	public List<uni_hotTopicVO> list() {
		return mapper.readHotTopic();
	}

	@Override
	public ResponseEntity<String> uploadProfile(MultipartFile[] uploadFile) {
		String all = "";
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();
		// 저장 폴더 경로 설정하기 (저장 경로,날짜 세퍼레이터)
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath : " + uploadPath);

		// 현재 파일경로가 존재한다면 true 파일경로가 존재하지 않으면 false
		// mkdirs를 생성한다. yyyy/MM/dd
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// foreach문으로 배열처리
		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------------------------");
			log.info("upload File name" + multipartFile.getOriginalFilename());
			log.info("upload File size" + multipartFile.getSize());

			// 크롬은 파일명만 들어감
			String uploadFileName = multipartFile.getOriginalFilename();

			// IE는 경로로 들어가기 때문에 substring(읽을 문자열 인덱스);
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			log.info("업로드된 파일 실제 이름 : " + uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				// 날짜별폴더에 파일 생성
				File saveFile = new File(uploadPath, uploadFileName);

				// 실제 업로드
				multipartFile.transferTo(saveFile);
				all = all + uploadFolderPath;
				// mime 타입 이미지 검증
				if (checkImageType(saveFile)) {

					// 썸네일 객체 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					// 썸네일레이터 사용하여 실제 적용
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					all = all + "\\s_" + uploadFileName;
					log.info("all===========================================" + all);
					thumbnail.close();

				} else {
					return new ResponseEntity<String>("fail", HttpStatus.OK);
				}

			} catch (Exception e) {
				log.error(e.getMessage());
			} // catch
		} // for

		return new ResponseEntity<String>(all, HttpStatus.OK);
	}

	@Override
	public ResponseEntity<byte[]> getFile(String fileName) {
		// String rootDirectory = "c:\\upload\";
		log.info("display fileName=============================" + fileName);
		File file = new File("c:\\upload\\" + fileName);
		log.info("display file================" + file);

		ResponseEntity<byte[]> result = null;

		try {
			// File file = new File("c:\\upload\\"+URLDecoder.decode(fileName, "UTF-8"));
			// log.info("display file================"+file);
			HttpHeaders header = new HttpHeaders();
			String contentType = new Tika().detect(file.toPath());
			header.add("Content-Type", contentType);
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("deleteFile : " + fileName);
		File file;

		try {
			// 썸네일 파일 삭제. file 디코드 상태로 만들기
			// file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();
			// 원본파일 삭제하기 위한 replace
			String largeFileName = file.getAbsolutePath().replace("s_", "");
			log.info("largeFileName" + largeFileName);

			// 원본파일 삭제하기.
			file = new File(largeFileName);
			file.delete();

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("delete", HttpStatus.OK);
	}

	// 프로필 업로드 관련 메서드
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

	/* 누가 했는진 모르겠지만 하던거 마저 수정하세요 */
	@Override
	public uni_MemberVO getMember(int mno) {
		// TODO Auto-generated method stub
		return mapper.readMember(mno);
	}
	
	@Override
    public int getMemberCount() {
        return mapper.getMemberCount();
    }

}
