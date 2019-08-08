package com.uni.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.uni.domain.uni_PhotoVO;
import com.uni.mapper.uni_workplaceMapper;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class FileCheckTask {

	@Inject
	private uni_workplaceMapper attachMapper;

	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str = sdf.format(cal.getTime());
		return str.replace("-", File.separator);
	}
	
	public void checkFiles() throws Exception {
		log.warn("File Check  Task run......................................");
		log.warn(new Date());
		// attach table에서 어제날짜파일목록 구하기
		List<uni_PhotoVO> fileList = attachMapper.getOldFiles();
		// Path.get -> 사이사이에 역슬래쉬를 자동을 생성하면서 인자값을 연결해줌
		// c:upload .... 파일명 구하기
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("/Users/admin/upload", vo.getPath(), vo.getUuid() + "-" + vo.getFileName()))
				.collect(Collectors.toList());

		// 이미지 파일일 경우 s_로 되어있는 섬네일 이미지를 저장
		fileList.stream().map(vo -> Paths.get("/Users/admin/upload",
				vo.getPath(), "s_" + vo.getUuid() + "_" + vo.getFileName())).forEach(p -> fileListPaths.add(p));

		log.warn("====================================");
		fileListPaths.forEach(p -> log.warn(p));

		File targetDir = Paths.get("/Users/admin/upload", getFolderYesterDay()).toFile();

		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		log.warn("-------------------------------------------------------------------");

		for (File file : removeFiles) {
			log.warn(file.getAbsoluteFile());
			file.delete();
		}

	}
}