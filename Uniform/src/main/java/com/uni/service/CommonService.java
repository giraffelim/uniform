package com.uni.service;

import com.uni.domain.uni_MemberVO;
import com.uni.swp.auth.SnsValue;

public interface CommonService {
	
	public boolean readOAuthMember(SnsValue sns,String code);
	
}
