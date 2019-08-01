<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<script src="/resources/js/map.js"></script>
<link rel="stylesheet" href="/resources/css/style_lan.css">
<link rel="stylesheet" href="/resources/css/avg_star.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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
							<form action="workplaceList" method="post" id="select_form">
								<input type="hidden" id="type" value="${type }"> <input
									type="hidden" id="location" value="${location }"> <input
									type="hidden" name="${_csrf.parameterName }"
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

	<section class="ftco-no-pt">
		<div class="container-fluid px-3 px-md-0">
			<div class="row justify-content-end">
				<div class="col-md-10">
					<div class="row d-flex">
						<div class="col-lg-6">
							<div class="row resultList"></div>
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

	<footer>
		<button id="topBtn" class="btn btn-secondary">↑</button>
		<button id="bottomBtn" class="btn btn-secondary">↓</button>
	</footer>

</div>
<!-- END COLORLIB-MAIN -->


<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/jquery.mb.YTPlayer.min.js"></script>
<script src="/resources/js/scrollax.min.js"></script>
<!-- <script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- <script src="/resources/js/google-map.js"></script> -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78b4abe6de9ef13e1faed34fe08afb6d&libraries=services"></script>
<script src="/resources/js/main.js"></script>
<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>
