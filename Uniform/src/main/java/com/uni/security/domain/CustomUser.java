package com.uni.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.uni.domain.uni_MemberVO;

import lombok.Data;
import lombok.Getter;

@Data
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private uni_MemberVO member;

	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(uni_MemberVO vo) {

		super(vo.getUserID(), vo.getUserPW(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.member = vo;
	}
}
