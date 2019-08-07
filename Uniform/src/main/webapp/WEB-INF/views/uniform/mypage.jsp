<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" href="/resources/css/style_lan.css">
<link rel="stylesheet" href="/resources/css/avg_star.css">

<div id="colorlib-main">
	<script>
		var csrfHeaderName = "${_csrf.headerName }";
		var csrfTokenValue = "${_csrf.token }";
	</script>


	<sec:authentication property="principal" var="pinfo" />


	<section class="ftco-section ftco-bread ftco-extend-mb">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Services</span>
					</p>
					<h1 class="bread">My Page</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-services ftco-section ftco-no-pt">
		<div class="container-fluid px-3 px-md-0">
			<div class="row justify-content-end">
				<div class="col-md-10">
					<div class="row mb-lg-5">
						<!--회원 정보 ---------------------------------------------->
						<div
							class="profile-div col-md-5  d-flex align-self-stretch ftco-animate">
							<div class="media block-6 services d-block">

								<div class="container-fluid">
									<div class="profile-container">
										<h3 class="profile-title">프로필</h3>
										<div class="profile-btn-div">
											<button data-oper="modify" id="btnModify" type="button"
												class="btn btn-default">수정</button>
										</div>
										<div class="row profile-Row">
											<div class="col-sm-4  d-flex justify-content-center align-items-center profile-icon"></div>

												<div class="col-sm-8 media-body p-2 mt-3 profile-context">

													<input type="hidden" name="${_csrf.parameterName }"
														value="${_csrf.token }"> <input type="hidden"
														id="memberPhoto" value="${pinfo.member.photo }"> <input
														type="hidden" id="userid"
														value='<sec:authentication property="principal.member.userID"/>'>



													<div>
														이름 : <span id="name"><sec:authentication
																property="principal.member.name" /></span>
													</div>
													<div>
														전화번호 : <span id="phone"><sec:authentication
																property="principal.member.phone" /></span>
													</div>
													<div>
														이메일 : <span id="email"><sec:authentication
																property="principal.member.email" /></span>
													</div>
												</div>
											</div>

										</div>
									</div>

								</div>
								<form id="operForm" action="/uniform/MemberModify" method="get">


								</form>
							</div>
							<!--회원 정보 끝-->

							<!-- 결제창-------------------------------------->
							<div class="col-md-5 d-flex align-self-stretch ftco-animate">
								<div class="media block-6 services d-block">

									<div class="container-fluid">
										<div class="profile-container">
											<h3 class="profile-title">결제수단</h3>
											<div class="profile-btn-div2">
												<button type="button" class="btn btn-default">수정</button>
												<button type="button" class="btn btn-default">조회</button>
											</div>
											<div class="row profile-Row">

												<div class="col-sm-8 media-body p-2 mt-3 payment-context">

													<div class="profile-payment">결제수단을 관리할 수 있습니다</div>

												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
							<!--결제창 끝-->
						</div>

						<!--찜 내역 시작----------------------------->
						<hr>
						<div class="profile-table">
							<div class="container container-table">


								<div class="row">
									<div class="col-sm-6">
										<h2>찜 내역</h2>
									</div>
									<div class="col-sm-6 more" id="moreZzim">
										<a class="moreInfoBtn">더보기</a>
									</div>

								</div>
								<table class="table table-bordered table-choice">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>연락처</th>
											<th>날짜</th>
											<th>시간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>forest room</td>
											<td>cavin</td>
											<td>010-1111-5885</td>
											<td>2019-07-19</td>
											<td>18:00~20:00</td>
										</tr>
										<tr>
											<td>2</td>
											<td>forest room</td>
											<td>ive</td>
											<td>010-1251-5885</td>
											<td>2019-07-19</td>
											<td>15:00~17:00</td>
										</tr>
										<tr>
											<td>3</td>
											<td>forest room</td>
											<td>john</td>
											<td>010-1111-5885</td>
											<td>2019-07-19</td>
											<td>08:00~10:00</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<br>
						<hr>

						<!-- 신청 내역 시작  -------------------------------------->

						<div class="profile-table">
							<div class="container">


								<div class="row">
									<div class="col-sm-6">
										<h2>신청 내역</h2>
										<div class="tab">
											<button class="sinchung_tab_1">공유</button>
											<button class="sinchung_tab_2">임대</button>
										</div>
									</div>


									<div class="col-sm-6 more">
										<a class="moreInfoBtn" id="moreShare">더보기 ></a>
									</div>

								</div>


								<div class="row table-wrap">
									<div class="col-md-12" id="sinchung_share">
										<table class="table table-bordered table-choice ">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>연락처</th>
													<th>내가 사용할 시간</th>
												</tr>
											</thead>
											<tbody class="sinchung_tbody">
												<c:forEach var="unionSinchungList"
													items="${unionSinchungList }" begin="0" end="2"
													varStatus="status">
													<tr>
														<td>${status.count }</td>
														<td><a class="SsinchungBtn"
															data-sno="${unionSinchungList.sno}">${unionSinchungList.title }</a></td>
														<td>${unionSinchungList.name }</td>
														<td>${unionSinchungList.phone }</td>
														<td>${unionSinchungList.reservation }</td>
													</tr>

												</c:forEach>
											</tbody>

										</table>
										<div id="sinchung_PagingBtn">
											<span></span> <span></span>
										</div>
									</div>


									<div class="col-md-12" id="sinchung_imde">
										<table class="table table-bordered table-choice">

											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>연락처</th>
													<th>내가 사용할 시간</th>
												</tr>
											</thead>
											<tbody class="Isinchung_tbody">
												<c:forEach var="IunionSinchungList"
													items="${IunionSinchungList }" begin="0" end="2"
													varStatus="status">
													<tr>
														<td>${status.count }</td>
														<td><a class="sinchungBtn"
															data-ino="${IunionSinchungList.ino }">${IunionSinchungList.title }</a></td>
														<td>${IunionSinchungList.name }</td>
														<td>${IunionSinchungList.phone }</td>
														<td>${IunionSinchungList.reservation }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

										<div id="Isinchung_PagingBtn">
											<span></span> <span></span>
										</div>
									</div>

									<!-- 제목을 누르면 상세 정보를 띄워주는 Modal -->
									<div class="modal fade sinchung_modal" id="sinchung"
										role="dialog">
										<div class="modal-dialog modal-lg">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">신청 상세 페이지</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body left-context">
													<div class="row">
														<div class="col-md-6">
															<form class="apply_form" action="" method="post">
																<div class="apply_content">
																	<label>게시글 제목</label><input type="text" id="title"
																		name="title" />
																</div>
																<div class="apply_content">
																	<label>작업실 주소</label><input type="text" id="location"
																		name="location" />
																</div>
																<div class="apply_content">
																	<label>작업실 가격</label><input type="text" id="price"
																		name="price" />
																</div>
																<div class="apply_content">
																	<label>등록자 이름</label><input type="text" id="hname"
																		name="name" />
																</div>
																<div class="apply_content">
																	<label>등록자 번호</label><input type="text" id="hphone"
																		name="phone" />
																</div>
																<div class="apply_content">
																	<label>사용할 시간</label><input type="text"
																		id="reservation" name="reservation" />
																</div>
																<div class="apply_content" style="display: none;">
																	<label>사용할 시간</label><input type="text"
																		id="reservation1" name="reservation" />
																</div>
																<div class="apply_content" style="display: none;">
																	<label>사용할 시간</label><input type="text"
																		id="reservation2" name="reservation" />
																</div>
															</form>
														</div>
														<div class="col-md-6 img_div">
															<div class="author-image">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--시청내역 끝-->

						<!--확정내역 시작------------------------------------------->
						<br>
						<hr class="hr">
						<div class="profile-table">
							<div class="container">


								<div class="row">
									<div class="col-sm-6">
										<h2>확정 내역</h2>
										<div class="tab">
											<button class="confirm_tab_1">공유</button>
											<button class="confirm_tab_2">임대</button>
										</div>

									</div>


									<div class="col-sm-6 more" id="moreImde">
										<a class="moreInfoBtn" id="moreConfirm">더보기 ></a> <br>
										<div class="float-right">
											<span class="carousel-control-prev-icon" id="confirm_prev"></span>
											<span class="carousel-control-next-icon" id="confirm_next"></span>
										</div>
									</div>

								</div>


								<div class="row table-wrap">
									<div class="col-md-12" id="confirm_share">
										<table class="table table-bordered table-choice ">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>연락처</th>
													<th>내가 사용할 시간</th>
												</tr>
											</thead>
											<tbody class="Sconfirm_body">
												<c:forEach var="SconfirmList" items="${SconfirmList }"
													varStatus="status" begin="0" end="2">
													<tr>
														<td>${status.count }</td>
														<td><a class="SConfirmBtn" style="color: black"
															data-cno="${SconfirmList.cno }">${SconfirmList.title }</a></td>
														<td>${SconfirmList.name }</td>
														<td>${SconfirmList.phone }</td>
														<td>${SconfirmList.reservation }</td>
													</tr>
												</c:forEach>
											</tbody>

										</table>
									</div>

									<!-- Modal -->
									<div class="modal fade sinchung_modal" id="SConfirm"
										role="dialog">
										<div class="modal-dialog modal-lg">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">확정 상세 페이지</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body left-context">
													<div class="row">
														<div class="col-md-6">
															<form class="apply_form confirm_form" action=""
																method="post">
																<input type="hidden" id="sno" name="sno">
																<div class="apply_content">
																	<label>게시글 제목</label><input type="text" id="Stitle"
																		name="title" />
																</div>
																<div class="apply_content">
																	<label>작업실 주소</label><input type="text" id="Slocation"
																		name="location" />
																</div>
																<div class="apply_content">
																	<label>작업실 가격</label><input type="text" id="Sprice"
																		name="price" />
																</div>
																<div class="apply_content">
																	<label>등록자 이름</label><input type="text" id="Sname"
																		name="name" />
																</div>
																<div class="apply_content">
																	<label>등록자 번호</label><input type="text" id="Sphone"
																		name="phone" />
																</div>
																<div class="apply_content">
																	<label>등록자 시간</label><input type="text" id="Shtime"
																		name="mytime" />
																</div>
																<div class="apply_content">
																	<label>공유한 기간</label><input type="text" id="Shdate"
																		name="mydate" />
																</div>
															</form>
														</div>
														<div class="col-md-6 img_div">
															<div class="author-image" id="SThumbnail"></div>
														</div>

														<div class="col-md-12 apply_info sconfirmStr"></div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary SreviewBtn"
														data-toggle="modal" data-target="#review">후기 작성</button>
												</div>
											</div>
										</div>
									</div>


									<div class="col-md-12" id="confirm_imde">
										<table class="table table-bordered table-choice ">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>연락처</th>
													<th>내가 사용할 시간</th>
												</tr>
											</thead>
											<tbody class="Iconfirm_body">
												<c:forEach var="IconfirmList" items="${IconfirmList }"
													varStatus="status" begin="0" end="2">
													<tr>
														<td>${status.count }</td>
														<td><a class="IConfirmBtn" style="color: black"
															data-cno="${IconfirmList.cno }">${IconfirmList.title }</a></td>
														<td>${IconfirmList.name }</td>
														<td>${IconfirmList.phone }</td>
														<td>${IconfirmList.reservation }</td>
													</tr>

												</c:forEach>
											</tbody>

										</table>
									</div>

									<!-- Modal -->
									<div class="modal fade sinchung_modal" id="IConfirm"
										role="dialog">
										<div class="modal-dialog modal-lg">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">확정 상세 페이지</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body left-context">
													<div class="row">
														<div class="col-md-6">
															<form class="apply_form confirm_form" action=""
																method="post">
																<input type="hidden" id="ino" name="ino">
																<div class="apply_content">
																	<label>게시글 제목</label><input type="text" id="Ititle"
																		name="title" />
																</div>
																<div class="apply_Iontent">
																	<label>작업실 주소</label><input type="text" id="Ilocation"
																		name="location" />
																</div>
																<div class="apply_Iontent">
																	<label>작업실 가격</label><input type="text" id="Iprice"
																		name="price" />
																</div>
																<div class="apply_Iontent">
																	<label>등록자 이름</label><input type="text" id="Iname"
																		name="name" />
																</div>
																<div class="apply_Iontent">
																	<label>등록자 번호</label><input type="text" id="Iphone"
																		name="phone" />
																</div>
															</form>
														</div>
														<div class="col-md-6 img_div">
															<div class="author-image" id="IThumbnail"></div>
														</div>
														<div class="col-md-12 apply_info iconfirmStr"></div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary IreviewBtn"
														data-toggle="modal" data-target="#review">후기 작성</button>
												</div>

											</div>
										</div>
									</div>

								</div>
								<!-- Modal -->
								<div class="modal fade" id="review" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">후기 작성</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<div class="modal-body">
												<div class="row review-body">
													<div class="col-md-3">
														<div class="profile-image" id="reviewProfile">
															<input type="hidden" id="myPageUserid"
																value="${pinfo.member.userID}"> <input
																type="hidden" id="myPagePhoto"
																value="${pinfo.member.photo}">
														</div>
													</div>
													<div class="col-md-9">
														<form action="new_review" method="post" id="review_form">
															<input type="hidden" name="${_csrf.parameterName }"
																value="${_csrf.token }" /> <input type="hidden"
																id="ino" name="ino"> <input type="hidden"
																id="sno" name="sno"> <input type="hidden"
																id="cno" name="cno">
															<div>
																<sec:authorize access="isAuthenticated()">
																	<input type="hidden" id="mno" name="mno"
																		value='<sec:authentication property="principal.member.mno"/>' />
																	<span>이름 : ${pinfo.member.name }</span>

																</sec:authorize>
																<sec:authorize access="isAnonymous ()">
																	<span>회원정보없음</span>
																</sec:authorize>
																<span class="star-input"> <span class="input">
																		<input type="radio" name="star-input" value="1"
																		id="p1"> <label for="p1">1</label> <input
																		type="radio" name="star-input" value="2" id="p2">
																		<label for="p2">2</label> <input type="radio"
																		name="star-input" value="3" id="p3"> <label
																		for="p3">3</label> <input type="radio"
																		name="star-input" value="4" id="p4"> <label
																		for="p4">4</label> <input type="radio"
																		name="star-input" value="5" id="p5"> <label
																		for="p5">5</label> <input type="radio"
																		name="star-input" value="1" id="p6"> <label
																		for="p6">6</label> <input type="radio"
																		name="star-input" value="2" id="p7"> <label
																		for="p7">7</label> <input type="radio"
																		name="star-input" value="3" id="p8"> <label
																		for="p8">8</label> <input type="radio"
																		name="star-input" value="4" id="p9"> <label
																		for="p9">9</label> <input type="radio"
																		name="star-input" value="5" id="p10"> <label
																		for="p10">10</label>
																</span>
																</span> <input type="hidden" id="review_star" name="star"
																	value="" />
															</div>
															<div>
																<textArea id="review-content" name="content"></textArea>
															</div>
														</form>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-info"
													id="review_insert">등록</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!--확정내역 끝-->
					</div>
				</div>
			</div>
	</section>


	<script src="/resources/js/taeho.js"></script>
	<script src="/resources/js/review.js"></script>
	<%@include file="../includes/footer.jsp"%>