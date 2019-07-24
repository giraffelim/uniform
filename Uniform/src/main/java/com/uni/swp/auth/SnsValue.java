package com.uni.swp.auth;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;

@Data
public class SnsValue implements SnsUrls{
	
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl; // callBack URL
	private DefaultApi20 api20Instance;
	private String profileUrl;
	
	private boolean isNaver;
	private boolean isGoogle;
	
	
	// servlet-context.xml beans:constructor-arg가 4개 있으므로 만들어주어야 한다.
	public SnsValue(String service, String cid, String cs, String rurl) {
		this.service = service;
		this.clientId = cid;
		this.clientSecret = cs;
		this.redirectUrl = rurl;
		
		this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		this.isGoogle = StringUtils.equalsIgnoreCase("google", this.service);
		
		if(isNaver) {
			//naver
			this.api20Instance = NaverAPI20.instance();
			this.profileUrl = NAVER_PROFILE_URL;
		}else if(isGoogle) {
			//google
			this.api20Instance = GoogleApi20.instance();
			this.profileUrl = GOOGLE_PROFILE_URL;
		}
	}
}
