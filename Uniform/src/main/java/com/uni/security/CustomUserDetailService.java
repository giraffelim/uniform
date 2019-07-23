package com.uni.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;
import com.uni.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
//스프링의 UserDetailService를 구현한 class
public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired
	private uni_MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// 데이터베이스에서 유저 정보를 가져 온다.
		
		log.warn("Load User By UserName: "+ userName);
		
		// userName means userID
		uni_MemberVO vo = memberMapper.read(userName);
		
		return vo == null ?  null : new CustomUser(vo);
	}
	
}
