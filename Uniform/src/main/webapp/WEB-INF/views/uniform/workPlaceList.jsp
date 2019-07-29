<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" href="/resources/css/style_lan.css">
<link rel="stylesheet" href="/resources/css/avg_star.css">

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

	<!-- <section class="ftco-search">
		<div class="container-fluid px-3 px-md-0">
			<div class="row justify-content-end">
				<div class="col-md-10">
					<input type="text" id="keyword" name="keyword">
				</div>
			</div>
		</div>
	</section> -->

	<section class="ftco-section ftco-no-pt">
		<div class="container-fluid px-3 px-md-0">
			<div class="row justify-content-end">
				<div class="col-md-10">
					<div class="row d-flex">
						<div class="col-lg-6">
							<div class="row">
								<c:if test="${workplace != null }">
									<c:forEach items="${workplace }" var="list">
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
														<span>등록일 : <fmt:formatDate value="${list.regDate}"
																pattern="yyyy-MM-dd" /></span> <span>가격 : ${list.price }원
														</span>
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
									</c:forEach>
								</c:if>
							</div>
							<!--end-->

							<!--paging -------------- -->
							<div class="row">
								<div class="col">
									<div class="block-27">
										<ul>
											<li><a href="#">&lt;</a></li>
											<li class="active"><span>1</span></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#">&gt;</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!--paging-->
						</div>
						<div class="col-md-6 mapWrap">
							<div id="listMap" class="bg-light"></div>
						</div>
						<!-- END COL -->
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="../includes/footer.jsp"%>
	<script src="/resources/js/map.js"></script>