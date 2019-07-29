package com.uni.swp.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

//OAuth2 Naver
public class NaverAPI20 extends DefaultApi20 implements SnsUrls{
	
	
	
	private NaverAPI20() {
	}
	
	private static class InstanceHolder{
		// Edit 불가
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}
	
	//JVM 메모리상에 객체가 한개만 존재하도록 singleTone
	public static NaverAPI20 instance() {
		return InstanceHolder.INSTANCE;
	}
	
	//Token을 얻어오는 EndPoint
	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
		return NAVER_AUTH;
	}

}
