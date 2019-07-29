<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="/logout" method="post" id="frm">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>

<script>
	var frm = document.getElementById("frm");
	console.log(frm);
	frm.submit();
</script>