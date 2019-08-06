package com.uni.task;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_ShinChungVO;
import com.uni.domain.uni_confirmVO;
import com.uni.mapper.uni_MemberMapper;
import com.uni.mapper.uni_workplaceMapper;

import lombok.extern.log4j.Log4j;

//임대 배치처리전 테스트 코드
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class LeaseConfirmTest {
	@Inject
	private uni_workplaceMapper workplace;

	@Inject
	private uni_MemberMapper member;

	@Test
	public void leaseConfirmCheck() {
		log.warn("lease insert confirm...");
		StringBuilder nameSB = new StringBuilder();
		StringBuilder phoneSB = new StringBuilder();
		StringBuilder reservationSB = new StringBuilder();
		StringBuilder mnoSB = new StringBuilder();
		List<Integer> inoList = workplace.getTodayLeaseList();
		List<uni_confirmVO> confirmList = new ArrayList<uni_confirmVO>();
		inoList.forEach(ino -> {
			int count = 0;
			List<uni_ShinChungVO> sinchungList = workplace.getTodaySinchungList(ino);
			for (uni_ShinChungVO sinchung : sinchungList) {
				reservationSB.append(sinchung.getReservation());
				mnoSB.append(sinchung.getMno());
				uni_MemberVO mem = member.readMember(sinchung.getMno());
				nameSB.append(mem.getName());
				phoneSB.append(mem.getPhone());
				if (count < sinchungList.size() - 1) {
					nameSB.append(",");
					phoneSB.append(",");
					reservationSB.append(",");
					mnoSB.append(",");
				}
				count++;
			}

			uni_confirmVO cVo = new uni_confirmVO();
			cVo.setCName(nameSB.toString());
			cVo.setCPhone(phoneSB.toString());
			cVo.setMno(mnoSB.toString());
			cVo.setReservation(reservationSB.toString());
			cVo.setIno(ino);
			confirmList.add(cVo);
			nameSB.setLength(0);
			phoneSB.setLength(0);
			reservationSB.setLength(0);
			mnoSB.setLength(0);
			
			//delete
			workplace.deleteLeaseS(ino);
		});
		
		//confirm Insert
		confirmList.forEach(confirm -> {
			log.warn(confirm);
			workplace.insertConfirm(confirm);
		});

	}
}
