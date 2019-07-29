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

<script>
	$(document)
			.ready(
					function() {
						var oauth2LoginUser = '    <sec:authentication property="principal.member.mno"/>';
						if (oauth2LoginUser == 0) {
							location.href = "/";
						}
						//inoJS--------------------------------------------------------------------------------------------------------------
						var veriPW = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/;
						var veriPhone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
						var submitBoolean1;
						var submitBoolean2;
						var submitBoolean3;

						var a = '${principal.member.photo}';
						console.log(a);
						console.log("principal.member.photo ees");

						var csrfHeaderName = $("#csrf").attr('name');
						var csrfTokenValue = $("#csrf").val();

						//ajax csrf 토큰 전송하기!!!!!!
						$(document).ajaxSend(
								function(e, xhr, options) {
									xhr.setRequestHeader(csrfHeaderName,
											csrfTokenValue);
								});

						$('#userPW').on('focusout', function() {
							if ($(this).val().length == 0) {
								$('#pw_null').css('display', 'block');
								$('#userPW').css('border-color', 'red');
								submitBoolean1 = false;
							} else if (!veriPW.test($(this).val())) {
								$('#pw_null').css('display', 'none');
								$('#userPW').css('border-color', 'red');
								$('#pw_former').css('display', 'block');
								submitBoolean1 = false;
							} else if (veriPW.test($(this).val())) {
								$('#userPW').css('border-color', '');
								$('#pw_null').css('display', 'none');
								$('#pw_former').css('display', 'none');
								submitBoolean1 = true;
								console.log(submitBoolean1);
							}
						});

						$('#userPWCheck').on('focusout', function() {
							if ($(this).val().length == 0) {
								$('#pw_null_check').css('display', 'block');
								$('#userPWCheck').css('border-color', 'red');
								submitBoolean2 = false;
							} else if ($(this).val() !== $('#userPW').val()) {
								$('#pw_null_check').css('display', 'none');
								$('#userPWCheck').css('border-color', 'red');
								$('#pw_differ').css('display', 'block');
								submitBoolean2 = false;
							} else if (veriPW.test($(this).val())) {
								$('#userPWCheck').css('border-color', '');
								$('#pw_null_check').css('display', 'none');
								$('#pw_differ').css('display', 'none');
								submitBoolean2 = true;
								console.log(submitBoolean2);
							}
						});

						$('#phone').on('focusout', function() {
							if ($(this).val().length === 0) {
								$('#phone_former').css('display', 'none');
								$('#phone_null').css('display', 'block');
								$('#phone').css('border-color', 'red');
								submitBoolean3 = false;
							} else if (!veriPhone.test($(this).val())) {
								$('#phone_null').css('display', 'none');
								$('#phone_former').css('display', 'block');
								$('#phone').css('border-color', 'red');
								submitBoolean3 = false;
							} else if (veriPhone.test($(this).val())) {
								$('#phone').css('border-color', '');
								$('#phone_null').css('display', 'none');
								$('#phone_former').css('display', 'none');
								submitBoolean3 = true;
								console.log(submitBoolean3);
							}
						});

						/* 여기부터 복사 */

						var regex = new RegExp("(.*?)\.(jpg|png|jpeg|gif)$");
						var maxSize = 5242880; // 5mb

						var cloneProfileInput = $("#profileInput").clone();

						//업로드 파일 검증함수.
						function checkExtension(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}
							if (!regex.test(fileName)) {
								console.log("check");
								alert("업로드가 불가능한 파일입니다");
								return false;
							}
							return true;
						}

						$('#submitBtn').on('click',function(e) {

											e.preventDefault();

											if (submitBoolean1 == true
													&& submitBoolean2 == true
													&& submitBoolean3 == true) {
												var str = "";
												if ($('#profilePhoto').data('file')) {
													str += "<input type='hidden' name='photo' value='"+'c:\\upload\\'+ $('#profilePhoto').data('file')+ "'>"
												} else {
													str += "<input type='hidden' name='photo' value='/resources/images/profileDefault.jpg'>"
												}
												
												
												
												$('#updateMemberForm').append(str).submit();
											}
										});

						$('#uploadFileBtn').on('click',function() {

									//ajax 이용하는 첨부파일 처리는 FormData 객체 이용! form이 없기때문에
									var formData = new FormData();

									//수많은 배열형태 input이 됨.
									var inputFile = $("input[name='photo']");

									var files = inputFile[0].files;

									console.log(files);

									if (!checkExtension(files[0].name,
											files[0].size)) {
										console.log(files[0].name
												+ files[0].size);
										return false;
									}

									//가상의 폼태그에 uploadFile한 것 추가.
									formData.append("uploadFile", files[0]);

									$.ajax({
										url : '/uploadProfile',
										processData : false,
										contentType : false,
										type : 'POST',
										data : formData,
										dataType : "text",
										success : function(result) {

											console.log(result);

											//input태그 초기화
											$('#profileInput').html(
													cloneProfileInput.html());

											if (result === "fail") {
												alert("이미지 파일이 아닙니다.")
												return false;
											}

											showUploadedFile(result);

										}
									});//ajax
								})

						var uploadResult = $("#uploadResult");

						//썸네일 띄우기
						function showUploadedFile(uploadResultArr) {
							console.log("aaaaaa : " + uploadResultArr);
							var str = '';
							var fileCallPath = encodeURIComponent(uploadResultArr)
							console.log("bbbbbb : " + fileCallPath);
							str += "<img src='/display?fileName="
									+ fileCallPath + "'>";
							str += "<div id='profilePhoto' style='cursor:pointer;' data-file='"+fileCallPath+"'><i class='far fa-times-circle'></i></div>"

							uploadResult.html(str);
						}

						//delegate 동적 생성 => div클릭시 이벤트 발생시키기
						$("#uploadResult").on("click", "div", function(e) {
							var targetFile = $(this).data("file");
							console.log(targetFile);

							$.ajax({
								url : '/deleteFile',
								data : {
									fileName : targetFile
								},
								dateType : 'text',
								type : 'post',
								success : function(result) {
									alert(result);

									$("#uploadResult").empty();
								}

							})
						});
						//복사끝

						// END.inoJS---------------------------------------------------
					})
</script>

<div id="colorlib-main">

	<section class="ftco-section ftco-bread ftco-extend-mb">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span>
					</p>
					<h1 class="bread">회원정보 수정</h1>
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
										<%-- <c:if test="${empty principal.member.photo } ">
                                        		<img style="width: 150px; height: 150px;" src="/resources/images/profileDefault.jpg">
                                        	</c:if> --%>

										<c:choose>
											<c:when test="${not empty principal.member.photo }">
											
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
										value="" placeholder="휴대폰 번호">
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