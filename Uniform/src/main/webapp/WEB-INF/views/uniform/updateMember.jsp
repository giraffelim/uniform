<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<!--폰트어썸---------------------------------------------------------------------------->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<!--폰트어썸-->

<link rel="stylesheet" href="/resources/css/style_ino.css">
<sec:authentication property="principal" var="pinfo"/>

<div id="colorlib-main">
	
	<section class="ftco-section ftco-bread ftco-extend-mb">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span>
					</p>
					<h1 class="bread">회원정보 수정 </h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section contact-section ftco-no-pt">
		<div class="container-fluid">

			<div class="row block-9 justify-content-end">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-10">

							<div id="profileBox" class="row text-center">
								<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
									<div>
										<i style="margin-top: 20px;" class="far fa-user-circle fa-3x"></i>
									</div>
									<span id="profileInput"><input type="file"
										class="memberupdate" id="photoFile" name="photo"></span>
									<button id="uploadFileBtn" class="btn btn-primary btn-sm"
										type="button">프로필사진 등록</button>
									&nbsp; <input id='csrf' type="hidden"
										name="${_csrf.headerName }" value="${_csrf.token }">
								</div>
								<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
									<div id="uploadResult">
									<input type="hidden" value="<sec:authentication property="principal.member.photo"/>" id="encodephoto">
										<%-- <c:if test="${empty principal.member.photo } ">
                                        		<img style="width: 150px; height: 150px;" src="/resources/images/profileDefault.jpg">
                                        	</c:if> --%>
										<c:choose>
											<c:when test="${not empty pinfo.member.photo }">
											
											</c:when>
											<c:otherwise>
												<img style="width: 150px; height: 150px;"
													src="/resources/images/profileDefault.jpg">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<br>

							<form id="updateMemberForm" action="/uniform/updateMember"
								method="post" class="p-5 contact-form inho">
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }"> <input type="hidden"
									name="mno"
									value='<sec:authentication property="principal.member.mno"/>'>
								<div class="form-group ino">
									<div class="memberupdateid">
										<i class="fas fa-id-card fa-2x"></i>
									</div>
									<input type="text" class="memberupdate" id="inouserID"
										name="userID"
										value='<sec:authentication property="principal.member.userID"/>'
										readonly="readonly">

								</div>

								<div class="form-group ino">
									<div class="memberupdateid">
										<i class="fas fa-user-lock  fa-2x"></i>
									</div>
									<input type="password" class="memberupdate" id="userPW"
										name="userPW" value=""
										placeholder="비밀번호(영문 숫자 특수문자 1가지 이상 6~15자 이내)">
									<p id="pw_null">변경하실 비밀번호를 입력해주세요.</p>
									<p id="pw_former">영문, 숫자, 특수문자 1가지 이상 6~15자 이내로 입력해주세요.</p>
								</div>

								<div class="form-group ino">
									<div class="memberupdateid">
										<i class="fas fa-user-check fa-2x"></i>
									</div>
									<input type="password" class="memberupdate" id="userPWCheck"
										name="userPWCheck" value="" placeholder="비밀번호 확인">
									<p id="pw_null_check">비밀번호 확인을 위해 입력해주세요.</p>
									<p id="pw_differ">입력하신 비밀번호와 다릅니다.</p>
								</div>

								<div class="form-group ino">
									<div class="memberupdateid">
										<i class="fas fa-user fa-2x"></i>
									</div>
									<input type="text" class="memberupdate" id="inoname"
										name="name"
										value='<sec:authentication property="principal.member.name"/>'
										placeholder="이름" readonly="readonly">
								</div>

								<div class="form-group ino">
									<div class="memberupdateid">
										<i id="phoneIcon" class="fas fa-mobile-alt fa-2x"></i>
									</div>
									<input type="text" class="memberupdate" id="phone" name="phone"
										value="<sec:authentication property="principal.member.phone"/>" placeholder="휴대폰 번호">
									<p id="phone_null">휴대폰 번호를 입력해주세요.</p>
									<p id="phone_former">-을 제외하고 입력해주세요.</p>
								</div>

								<div class="form-group ino">
									<div class="memberupdateid">
										<i class="far fa-envelope fa-2x"></i>
									</div>
									<input type="text" class="memberupdate" id="inoemail"
										name="email"
										value='<sec:authentication property="principal.member.email"/>'
										placeholder="이메일" readonly="readonly">
								</div>

								<div class="form-group a">
									<input type="button" value="취소"
										class="inoUpdateBtn1 btn btn-primary float-right"> <input
										id="submitBtn" type="submit" value="수정"
										class="inoUpdateBtn2 btn btn-primary float-right">
								</div>
							</form>
						</div>


					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="/resources/js/main.inho.js"></script>
	<%@ include file="../includes/footer.jsp"%>