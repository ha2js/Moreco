<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.user.userDAO" %>
<%@ page import= "com.moreco.user.userDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moreco : 정보 찾기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
		<jsp:useBean id="userJoin" class="com.moreco.user.userDTO"/>
		<jsp:setProperty property="*" name="userJoin"/>
	<%
		userDAO uDAO = new userDAO();
		String str = uDAO.find_info(userJoin);
		out.print(str);
	%>
</body>
</html>