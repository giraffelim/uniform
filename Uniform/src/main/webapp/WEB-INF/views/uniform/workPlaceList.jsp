<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<script src="/resources/js/map.js"></script>
<link rel="stylesheet" href="/resources/css/avg_star.css">
<link rel="stylesheet" href="/resources/css/style_lan.css">


<div id="colorlib-main">

	<section class="ftco-section ftco-bread">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>작업실
							Share</span>
					</p>
					<h1 class="bread">작업실 Share</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-search">
		<div class="container-fluid px-3 px-md-0">
			<div class="row justify-content-end">
				<div class="col-md-10 list_search">
					<div class="row d-flex">
						<div class="col-lg-7 list_search">
							<form action="/uniform/workplaceList" method="post" id="select_form">
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }" /> <label> 장소 </label><input
									type="text" id="keyword" name="location" value="${location }">
								<c:if test="${type == 'imde' }">
									<label> 날짜 </label>
									<input type="text" id="IfirstDate" name="Date"
										placeholder="년 - 월 - 일">
									<b> ~ </b>
									<input type="text" id="IlastDate" name="Date"
										placeholder="년 - 월 - 일">
								</c:if>
								<c:if test="${type == 'share' }">
									<label> 날짜 </label>
									<c:if test="${SfirstDate == 'fail' }">
										<input type="text" id="SfirstDate" name="SfirstDate"
											placeholder="년 - 월 - 일">
									</c:if>
									<c:if test="${SfirstDate != 'fail' }">
										<input type="text" id="SfirstDate" name="SfirstDate"
											placeholder="년 - 월 - 일" value="${SfirstDate }">
									</c:if>
									<b> ~ </b>
									<c:if test="${SlastDate == 'fail' }">
										<input type="text" id="SlastDate" name="SlastDate"
											placeholder="년 - 월 - 일">
									</c:if>
									<c:if test="${SlastDate != 'fail' }">
										<input type="text" id="SlastDate" name="SlastDate"
											placeholder="년 - 월 - 일" value="${SlastDate }">
									</c:if>
								</c:if>
								<label>종류</label> <select id="selectType" name="type">
									<c:if test="${type == null}">
										<option value="imde" selected>임대</option>
										<option value="share">공유</option>
									</c:if>
									<c:if test="${type == 'imde' }">
										<option value="imde" selected>임대</option>
										<option value="share">공유</option>
									</c:if>
									<c:if test="${type == 'share' }">
										<option value="imde">임대</option>
										<option value="share" selected>공유</option>
									</c:if>
								</select>
								<button type="submit" class="btn btn-primary btn-md"
									id="btnSearch">검색</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt">
		<div class="container-fluid px-3 px-md-0">
			<div class="row justify-content-end">
				<div class="col-md-10">
					<div class="row d-flex">
						<div class="col-lg-6">
							<div class="row">
								<c:if test="${workplace != null }">
									<c:forEach items="${workplace }" var="list">
										<c:if test="${type == 'imde' }">
											<input type="hidden" id="imdeType" value="${type }">
											<input type="hidden" id="imdeLocation" value="${location }">
											<c:forEach items="${avg_star }" var="star">
												<c:if test="${list.ino == star.ino }">
													<input type="hidden" id="avg_star${star.ino }"
														value="${star.avg }">
													<input type="hidden" id="num_star${star.ino }"
														value="${list.ino }">
												</c:if>
											</c:forEach>
											<div class="col-md-12">
												<div class="blog-entry ftco-animate">
													<a href="single.html" class="img img-2"
														style="background-image: url(/resources/images/image_1.jpg);"></a>
													<div class="text pt-3">
														<h2 class="mb-2">${list.title }</h2>

														<div class="meta-wrap">
															<span>등록일 : <fmt:formatDate
																	value="${list.regDate}" pattern="yyyy-MM-dd" /></span> <span>가격
																: ${list.price }원 </span>
															<div class="star-wrap">
																<span class="star-input${list.ino }"> <span
																	class="input"> </span>
																</span>
															</div>
															<div class="result-wrap">
																<span class="star-input${list.ino }"> <span
																	class="result"> </span>
																</span>
															</div>

														</div>
														<p>
															<a href="#" class="btn btn-primary">Read More <span
																class="ion-ios-arrow-forward"></span></a>
														</p>
													</div>
												</div>
											</div>
										</c:if>
										<c:if test="${type == 'share' }">
											<input type="hidden" id="shareType" value="${type }">
											<input type="hidden" id="shareLocation" value="${location }">
											<c:forEach items="${avg_star }" var="star">
												<c:if test="${list.sno == star.sno }">
													<input type="hidden" id="avg_star${star.sno }"
														value="${star.avg }">
													<input type="hidden" id="num_star${star.sno }"
														value="${list.sno }">
												</c:if>
											</c:forEach>
											<div class="col-md-12">
												<div class="blog-entry ftco-animate">
													<a href="single.html" class="img img-2"
														style="background-image: url(/resources/images/image_1.jpg);"></a>
													<div class="text pt-3">
														<h2 class="mb-2">${list.title }</h2>

														<div class="meta-wrap">
															<span>등록일 : <fmt:formatDate
																	value="${list.regDate }" pattern="yyyy-MM-dd" /></span> <span>가격
																: ${list.price }원 </span>
															<div class="star-wrap">
																<span class="star-input${list.sno }"> <span
																	class="input"> </span>
																</span>
															</div>
															<div class="result-wrap">
																<span class="star-input${list.sno }"> <span
																	class="result"> </span>
																</span>
															</div>

														</div>
														<p>
															<a href="#" class="btn btn-primary">Read More <span
																class="ion-ios-arrow-forward"></span></a>
														</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
							<!--end-->

						</div>
						<div class="col-md-6 mapWrap">
							<div id="resultMap" class="bg-light"></div>
						</div>
						<!-- END COL -->
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="../includes/footer.jsp"%>