<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>UNIFORM</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">

<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">

<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/ionicons.min.css">


<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78b4abe6de9ef13e1faed34fe08afb6d"></script>

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<!-- navigation --------------------- -->
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="/">Home</a></li>
					<li><a href="list">작업실 Share</a>
						<ul class="side_ul">
							<li><a href="about.html">임대</a></li>
							<li><a href="services.html">공유</a></li>
						</ul></li>
					<li><a href="about.html">인력풀</a>
						<ul class="side_ul">
							<li><a href="about.html">구인</a></li>
							<li><a href="services.html">구직</a></li>
						</ul></li>
					<!--<li><a href="services.html">Services</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="contact.html">Contact</a></li>-->
				</ul>
				<p class="social">
					<sec:authorize access="isAnonymous()">
					<span><a href="login">로그인</a></span>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<span><a href="#" id="logout">로그아웃</a>					
					</span>
					<script>
						$(function(){
							$("#logout").click(function(e){
								e.preventDefault();
								var frm = document.createElement("form");
								frm.method = "post";
								frm.action = "/logout";
								
								var i = document.createElement("input");
								i.type = "hidden";
								i.name = "${_csrf.parameterName }";
								i.value = "${_csrf.token }";
								frm.appendChild(i);
								document.body.appendChild(frm);
								frm.submit();
							});
						});
					</script>
					</sec:authorize>
					 <span><a href="#">회원가입</a></span>
					<span><a href="#">마이페이지</a></span>
				</p>
			</nav>
			<!--navigation-->

			<div class="colorlib-footer">
				<h1 id="colorlib-logo">
					<a href="/">Uniform</a>
				</h1>
			</div>
		</aside>
		<!-- END COLORLIB-ASIDE -->