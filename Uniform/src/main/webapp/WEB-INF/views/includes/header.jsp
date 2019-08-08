<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/taeho.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78b4abe6de9ef13e1faed34fe08afb6d&libraries=services"></script>

</head>

<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<!-- navigation --------------------- -->
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li id="Home"><a href="/">Home</a></li>
					<li><a href="/uniform/hotTopicList" id="headerShare">작업실 Share</a>
						<ul class="side_ul" id="headerSide">
							<li id = "lease"><a href="/uniform/leaseInsert">임대</a></li>
							<li id = "share"><a href="/uniform/shareInsert">공유</a></li>
						</ul></li>
				</ul>
				<p class="social">
					<sec:authorize access="isAnonymous()">
						<span><a href="/login">로그인</a></span>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<span><a href="#" id="logout">로그아웃</a> </span>
						<script>
							$(function() {
								$("#logout").click(function(e) {
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
					<sec:authorize access="isAnonymous()">
						<span><a href="/uniform/join">회원가입</a></span>
					</sec:authorize>

				<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="pinfo" />
						<span id="myPageNav"><a
							href="/uniform/myPage?mno=${pinfo.member.mno }">마이페이지</a></span>

					</sec:authorize>



				</p>
			</nav>
			<!--navigation-->



			<div class="colorlib-footer">
						<img src="/resources/images/uniform_logos.png" style="position:relative; left:-200px; bottom:-250px;">
			</div>
		</aside>
		
		<script>
			$(function(){
				var flag = "${flag}";
				switch(flag){
				case "index" :
					$("#Home").addClass("colorlib-active");
					break;
				case "hotTopicList" :
					$("#headerShare").addClass("colorlib-active");
					break;
				case "lease" :
					$("#lease").addClass("colorlib-active");
					break;
				case "share" :
					$("#share").addClass("colorlib-active");
					break;
				}
			});
		</script>
		<!-- END COLORLIB-ASIDE -->