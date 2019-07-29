/**
 * 
 */

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