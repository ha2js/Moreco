<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.moreco.user.userDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moreco : 로그인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		userDAO uDAO = new userDAO();
		boolean check = uDAO.login(user_id, user_pw);
		if (check == true) {
			session.setAttribute("user_id",user_id);
			response.sendRedirect("../moreco/main.jsp");
		}
		else {
			%>
			<script>
				alert("아이디 또는 패스워드 오류입니다");
				history.back();
			</script>
			<%
		}
	%>
</body>
</html>