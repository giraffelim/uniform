package com.uni.swp.auth;

// 변하지 않는 값들 저장
public interface SnsUrls {
	// TOKEN을 받아오는 URL
	static final String NAVER_ACCESS_TOKEN = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	static final String NAVER_AUTH = "https://nid.naver.com/oauth2.0/authorize";

	// PROFILE을 받아오는 URL
	static final String GOOGLE_PROFILE_URL = "https://www.googleapis.com/plus/v1/people/me";
	static final String NAVER_PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
}
