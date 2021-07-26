<%@page import="com.moreco.user.userDTO" %>
<%@page import="com.moreco.user.userDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moreco : 회원가입</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
		<jsp:useBean id="userJoin" class="com.moreco.user.userDTO"/>
		<jsp:setProperty property="*" name="userJoin"/>
	<%
		userDAO uDAO = new userDAO();
		boolean check = uDAO.insert_user(userJoin);
		if (check == true) {
			%>
			<script>
				alert("회원가입 완료");
				location.href="login.html";
			</script>
			<%
		}
		else {
			%>
			<script>
				alert("이미 존재하는 아이디입니다.");
				history.back();
			</script>
			<%
		}
	%>
</body>
</html>