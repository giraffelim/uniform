<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/header.jsp"%>

<div id="colorlib-main">


	<!--검색 조건 --------------------------------------------------------------->

	<input type="hidden" id="currentDate" value=${currentDate }>

	<section class="ftco-section ftco-bread select-info">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<form action="/uniform/workplaceList" method="get" id="select_form">
						<div>
							<input type="text" id="inputLocation" name="location"
								placeholder="모든위치"> <input type="text"
								id="inputFirstDate" name="SfirstDate" placeholder="년/월/일">
							~ <input type="text" id="inputLastDate" name="SlastDate"
								placeholder="년/월/일"> <select id="typeChoice"
								name="selectChoice">
								<option value="select">종류</option>
								<option value="share">공유</option>
								<option value="imde">임대</option>

							</select>
							<button type="submit" class="btn-warning" id="btnSelect">
								검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--검색 조건 끝 -->

	<!--작업실 공유 핫토픽 시작--------------------------------------------------->
	<section class="ftco-section ftco-bread">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">

					<h3>작업실 공유</h3>
					<div class="row">
						<div class="col-md-10"></div>
						<div class="col-md-2">
							<sec:authorize access="isAuthenticated()">
								<button type="button" class="btn-success" id="shareBtn">등록</button>
							</sec:authorize>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>



	<section class="ftco-section ftco-bread ftco-extend-mb">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<div class="row">

						<div class="col-sm-4" id="firstShareDiv">

							<div id="firstShareImg"></div>


							<div class="stardiv">

								<input type="hidden" id="bestShareStar1"
									value='<c:forEach var = "hotTopicList" items="${hotTopicList }" begin="0" end="0" >${hotTopicList.star}</c:forEach>'>

								<!-- 빨간 -->
								<div class="star-wrap">
									<span class="star-input"> <span class="input"> </span>
									</span>
								</div>
								<!-- 하얀 -->
								<div class="result-wrap">
									<span class="star-input"> <span class="result"> </span>
									</span>
								</div>
							</div>

							<div id="firstBestShareContext">
								<c:forEach var="hotTopicList" items="${hotTopicList }" begin="0"
									end="0">${hotTopicList.context}</c:forEach>
							</div>
							<h1></h1>
							<div class="BestShareWriterDiv">
								<input type="hidden" id="firstBestShareProfileIP"
									value='<c:forEach var = "hotTopicList" items="${hotTopicList }" begin="0" end="0" >${hotTopicList.photo}</c:forEach>'>
								<div id="firstBestShareProfile"></div>
								<div id="firstbestShareWriter">
									<c:forEach var="hotTopicList" items="${hotTopicList }"
										begin="0" end="0">${hotTopicList.name}</c:forEach>
								</div>
							</div>

						</div>
						<div class="col-sm-4" id="secondShareDiv">
							<div id="secondShareImg"></div>
							<div class="stardiv">

								<input type="hidden" id="bestShareStar2"
									value='<c:forEach var = "hotTopicList" items="${hotTopicList }" begin="1" end="1" >${hotTopicList.star}</c:forEach>'>


								<div class="star-wrap">
									<span class="star-input"> <span class="input"> </span>
									</span>
								</div>

								<div class="result-wrap">
									<span class="star-input"> <span class="result"> </span>
									</span>
								</div>
							</div>

							<div id="secondBestShareContext">
								<c:forEach var="hotTopicList" items="${hotTopicList }" begin="1"
									end="1">${hotTopicList.context}</c:forEach>
							</div>
							<h1></h1>
							<div class="BestShareWriterDiv">
								<input type="hidden" id="secondBestShareProfileIP"
									value='<c:forEach var = "hotTopicList" items="${hotTopicList }" begin="1" end="1" >${hotTopicList.photo}</c:forEach>'>
								<div id="secondBestShareProfile"></div>
								<div id="secondbestShareWriter">
									<c:forEach var="hotTopicList" items="${hotTopicList }"
										begin="1" end="1">${hotTopicList.name}</c:forEach>
								</div>

							</div>

						</div>
						<div class="col-sm-4" id="thirdShareDiv">
							<div id="thirdShareImg"></div>
							<div class="stardiv">

								<input type="hidden" id="bestShareStar3"
									value='<c:forEach var = "hotTopicList" items="${hotTopicList }" begin="2" end="2" >${hotTopicList.star}</c:forEach>'>


								<div class="star-wrap">
									<span class="star-input"> <span class="input"> </span>
									</span>
								</div>

								<div class="result-wrap">
									<span class="star-input"> <span class="result"> </span>
									</span>
								</div>
							</div>

							<div id="thirdBestShareContext">
								<c:forEach var="hotTopicList" items="${hotTopicList }" begin="2"
									end="2">${hotTopicList.context}</c:forEach>
							</div>
							<h1></h1>
							<div class="BestShareWriterDiv">
								<input type="hidden" id="thirdBestShareProfileIP"
									value='<c:forEach var = "hotTopicList" items="${hotTopicList }" begin="2" end="2" >${hotTopicList.photo}</c:forEach>'>
								<div id="thirdBestShareProfile"></div>
								<div id="thirdbestShareWriter">
									<c:forEach var="hotTopicList" items="${hotTopicList }"
										begin="2" end="2">${hotTopicList.name}</c:forEach>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--작업실 공유 핫토픽 끝-->

	<!--작업실 임대 핫토픽 시작--------------------------------------------------------------->
	<section class="ftco-section ftco-bread imde">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">

					<h3>작업실 임대</h3>
					<div class="row">
						<div class="col-md-10"></div>
						<div class="col-md-2">
							<sec:authorize access="isAuthenticated()">
								<button type="button" class="btn-success" id="imdeBtn">등록</button>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<section class="ftco-section ftco-bread ftco-extend-mb">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<div class="row">

						<div class="col-sm-4" id="firstImdeDiv">

							<div id="firstImdeImg"></div>

							<div class="stardiv">

								<input type="hidden" id="bestImdeStar1"
									value='<c:forEach var = "hotTopicListImde" items="${hotTopicListImde }" begin="0" end="0" >${hotTopicListImde.star}</c:forEach>'>


								<!-- 빨간 -->
								<div class="star-wrap">
									<span class="star-input"> <span class="input"> </span>
									</span>
								</div>
								<!-- 하얀 -->
								<div class="result-wrap">
									<span class="star-input"> <span class="result"> </span>
									</span>
								</div>
							</div>

							<div id="firstBestImdeContext">
								<c:forEach var="hotTopicListImde" items="${hotTopicListImde }"
									begin="0" end="0">${hotTopicListImde.context}</c:forEach>
							</div>
							<h1></h1>
							<div class="BestImdeWriterDiv">
								<input type="hidden" id="firstBestImdeProfileIP"
									value='<c:forEach var = "hotTopicListImde" items="${hotTopicListImde }" begin="0" end="0" >${hotTopicListImde.photo}</c:forEach>'>
								<div id="firstBestImdeProfile"></div>
								<div id="firstbestImdeWriter">
									<c:forEach var="hotTopicListImde" items="${hotTopicListImde }"
										begin="0" end="0">${hotTopicListImde.name}</c:forEach>
								</div>

							</div>

						</div>
						<div class="col-sm-4" id="secondImdeDiv">
							<div id="secondImdeImg"></div>
							<div class="stardiv">

								<input type="hidden" id="bestImdeStar2"
									value='<c:forEach var = "hotTopicListImde" items="${hotTopicListImde }" begin="1" end="1" >${hotTopicListImde.star}</c:forEach>'>

								<!-- 빨간 -->
								<div class="star-wrap">
									<span class="star-input"> <span class="input"> </span>
									</span>
								</div>
								<!-- 하얀 -->
								<div class="result-wrap">
									<span class="star-input"> <span class="result"> </span>
									</span>
								</div>
							</div>

							<div id="secondBestImdeContext">
								<c:forEach var="hotTopicListImde" items="${hotTopicListImde }"
									begin="1" end="1">${hotTopicListImde.context}</c:forEach>
								.
							</div>
							<h1></h1>
							<div class="BestImdeWriterDiv">
								<input type="hidden" id="secondBestImdeProfileIP"
									value='<c:forEach var = "hotTopicListImde" items="${hotTopicListImde }" begin="1" end="1" >${hotTopicListImde.photo}</c:forEach>'>
								<div id="secondBestImdeProfile"></div>
								<div id="secondbestImdeWriter">
									<c:forEach var="hotTopicListImde" items="${hotTopicListImde }"
										begin="1" end="1">${hotTopicListImde.name}</c:forEach>
								</div>

							</div>

						</div>
						<div class="col-sm-4" id="thirdImdeDiv">
							<div id="thirdImdeImg"></div>

							<div class="stardiv">

								<input type="hidden" id="bestImdeStar3"
									value='<c:forEach var = "hotTopicListImde" items="${hotTopicListImde }" begin="2" end="2" >${hotTopicListImde.star}</c:forEach>'>

								<!-- 빨간 -->
								<div class="star-wrap">
									<span class="star-input"> <span class="input"> </span>
									</span>
								</div>
								<!-- 하얀 -->
								<div class="result-wrap">
									<span class="star-input"> <span class="result"> </span>
									</span>
								</div>
							</div>


							<div id="thirdBestImdeContext">
								<c:forEach var="hotTopicListImde" items="${hotTopicListImde }"
									begin="2" end="2">${hotTopicListImde.context}</c:forEach>
							</div>
							<h1></h1>
							<div class="BestImdeWriterDiv">
								<input type="hidden" id="thirdBestImdeProfileIP"
									value='<c:forEach var = "hotTopicListImde" items="${hotTopicListImde }" begin="2" end="2" >${hotTopicListImde.photo}</c:forEach>'>
								<div id="thirdBestImdeProfile"></div>
								<div id="thirdbestImdeWriter">
									<c:forEach var="hotTopicListImde" items="${hotTopicListImde }"
										begin="2" end="2">${hotTopicListImde.name}</c:forEach>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--작업실 임대 핫토픽 끝-->

	<script src="/resources/js/taeho.js"></script>
	<%@include file="../includes/footer.jsp"%>