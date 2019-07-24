package com.uni.swp.auth;

import java.util.Iterator;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.uni.domain.uni_MemberVO;

public class SNSLogin {
	
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
		this.sns = sns;
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public uni_MemberVO getUserProfile(String code) throws Exception{
		//access Token을 받아온다
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		// request 만들기
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		// accessToken을 request에 담기
		oauthService.signRequest(accessToken, request);
		// Response 받기
		Response response = oauthService.execute(request);
		// json 형식으로 response가 온다.
		return parseJson(response.getBody());
	}
	
	private uni_MemberVO parseJson(String body) throws Exception{
		System.out.println(body);
		uni_MemberVO user = new uni_MemberVO();

		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if(this.sns.isGoogle()) {
			
			String id = rootNode.get("id").asText();
			if(sns.isGoogle()) {
				user.setGoogleId(id);
			}
			String displayName = rootNode.get("displayName").asText();
			JsonNode nameNode = rootNode.path("name");
			
			String name = nameNode.get("familyName").asText()+nameNode.get("givenName").asText();
			user.setName(name);
			Iterator<JsonNode> iterEmails = rootNode.path("emails").elements();
			while(iterEmails.hasNext()) {
				JsonNode emailNode = iterEmails.next();
				String type = emailNode.get("type").asText();
				if(StringUtils.equals(type, "account")) {
					user.setEmail(emailNode.get("value").asText());
					break;
				}
			}
		}else if(this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			user.setNaverId(resNode.get("id").asText());
			user.setEmail(resNode.get("email").asText());
			user.setPhoto(resNode.get("profile_image").asText());
			user.setName(resNode.get("name").asText());
		}
		return user;
	}
}
