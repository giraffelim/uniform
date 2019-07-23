<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<sec:authorize access="isAnonymous()">
	<script>
		location.href = "/login"
	</script>
</sec:authorize>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>list.jsp
</body>
</html>