<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/style2.css">
<link rel="stylesheet" href="/resources/css/style_lan.css">

<body>
	<form method="post" action="/login" id="login_form">
		<svg id="ryan" viewBox="0 0 120 120"
			xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243"
				stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32"
				fill="#e0a243" stroke="#000" stroke-width="2.5"
				stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32"
				fill="#e0a243" stroke="#000" stroke-width="2.5"
				stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000"
				stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000"
				stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000"
				stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path
				d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
				fill="#fff" />
                <path
				d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
				fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round"
				stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65"
				fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path
				d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105"
				fill="#fff" />
        </svg>
		<input type="text" placeholder="아이디를 입력해주세요" name="username">
		<span id="error"></span> <input type="password"
			placeholder="비밀번호를 입력해주세요" name="password"> <span>${error }</span>
		<input type="button" value="ID/PW 찾기" id="selectUP"
			data-toggle="modal" data-target="#findUP"> <input
			type="submit" value="로그인" id="logins"> <input type="hidden"
			name="${_csrf.parameterName }" value="${_csrf.token }">
	</form>

	<!-- 아이디를 찾도록 modal이 띄워지는 부분 -->
	<div class="modal fade" id="findUP" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">ID 찾기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form method="post" action="/uniform/find_id" id="id_form">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" /> <label>Name</label> <input
							type="text" class="find" id="id_userName" name="name"
							placeholder="이름을 입력해주세요."> <br> <label
							id="name-label">Email</label> <input type="text" class="find"
							id="id_email" name="email" placeholder="이메일을 입력해주세요.">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="pw_modal">비밀번호
						찾기</button>
					<button type="submit" class="btn btn-info" id="find_ID">찾기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호를 찾게 modal이 띄워지는 부분 -->
	<div class="modal fade" id="findPW" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">PW 찾기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form method="post" action="/uniform/find_pw" id="pw_form">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" /> <label id="id-label">ID</label> <input
							type="text" class="find form-group" id="pw_userID" name="userID"
							placeholder="아이디를 입력해주세요."> <br> <label>Email</label>
						<input type="text" class="find form-group" id="pw_email"
							name="email" placeholder="이메일을 입력해주세요.">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="id_modal">아이디
						찾기</button>
					<button type="submit" class="btn btn-info" id="find_PW">찾기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>
	s
	<!-- 아이디를 찾으면 자동으로 아이디를 보여지는 modal이 띄워지는 부분 -->
	<c:if test="${find_id != null}">
		<input type="hidden" id="resultID_modal" class="btn-default"
			data-toggle="modal" data-target="#resultID"></input>

		<div class="modal fade" id="resultID" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">ID</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<h5>
							회원님의 ID는
							<c:out value="${find_id.userID }" />
							입니다.
						</h5>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>
		</div>
	</c:if>

	<!-- 비밀번호를 찾으면 자동으로 임시 비밀번호가 전송되었다고  modal이 띄워지는 부분 -->
	<c:if test="${find_pw}">
		<input type="hidden" id="resultPW_modal" class="btn-default"
			data-toggle="modal" data-target="#resultPW"></input>

		<div class="modal fade" id="resultPW" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Password</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body review-body">
						<h5>회원님의 임시 비밀번호는 이메일로 발송하였습니다.</h5>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>
		</div>
	</c:if>

	<script src="/resources/js/script.js"></script>
	<script src="/resources/js/login_find.js"></script>
</body>
</html>
<script>
	$(document.body).on("keydown", this, function(event) {
		if (event.keyCode == 116) {
			alert('F5 pressed!');
		}
	});
</script>
<%@include file="includes/footer.jsp"%>