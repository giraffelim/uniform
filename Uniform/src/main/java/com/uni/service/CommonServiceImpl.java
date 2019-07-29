package com.uni.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_member_authVO;
import com.uni.mapper.uni_MemberMapper;
import com.uni.security.domain.CustomUser;
import com.uni.swp.auth.SNSLogin;
import com.uni.swp.auth.SnsValue;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private uni_MemberMapper mapper;

	@Override
	public boolean readOAuthMember(SnsValue sns, String code) {
		// 데이터베이스에서 OAuth2를 통해 로그인한 회원의 정보 read

		// 첫 방문일경우 flag = true
		boolean flag = false;
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		uni_MemberVO snsUser;
		uni_MemberVO user = null;
		try {
			snsUser = snsLogin.getUserProfile(code);
			System.out.println("Profile >>" + snsUser);
			// 3. DB에 해당 유저가 존재하는지 체크 => Email로 체크
			// 3. DB에 해당 유저가 존재하는지 체크 (구글 ID, Naver ID column 추가)
			if (StringUtils.isNotEmpty(snsUser.getNaverId())) {
				user = mapper.getByNaver(snsUser.getNaverId());
			} else {
				user = mapper.getByGoogle(snsUser.getGoogleId());
			}
			
			if (user == null) {
				flag = true;
				user = snsUser;
				user = DummyAuthenticationData(user);
			}

			OAuth2Authentication(user);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	// Autehnticatino에 필요한 dummy data add
	private uni_MemberVO DummyAuthenticationData(uni_MemberVO authenticationUser) {
		// authList
		List<uni_member_authVO> authList = new ArrayList<uni_member_authVO>();

		uni_member_authVO aVo = new uni_member_authVO();

		// 임의로 권한 생성
		aVo.setAuth("ROLE_MEMBER");

		authList.add(aVo);
		
		authenticationUser.setUserID("OAuth2");
		authenticationUser.setUserPW("OAuth2");

		authenticationUser.setAuthList(authList);

		return authenticationUser;
	}

	// Authentication 처리
	private void OAuth2Authentication(uni_MemberVO authenticationUser) {
		System.out.println(authenticationUser);
		CustomUser vo = new CustomUser(authenticationUser);
		// 인증 객체 생성 (이미 인증이 되었다고 가정)
		Authentication authentication = new UsernamePasswordAuthenticationToken(vo, vo.getPassword(),
				vo.getMember().getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
						.collect(Collectors.toList()));
		// 인증 객체 저장
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}
}
