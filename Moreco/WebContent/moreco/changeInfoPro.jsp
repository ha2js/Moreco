<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.moreco.user.userDTO" %>
<%@page import="com.moreco.user.userDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String user_id = (String)session.getAttribute("user_id");
	%>
		<jsp:useBean id="us" class="com.moreco.user.userDTO"/>
		<jsp:setProperty property="*" name="us"/>
	<%
		userDAO ud = new userDAO();
		ud.updateUser(us, user_id);
	%>
	<script type="text/javascript">
		alert("수정 완료");
		alert("다시 로그인 해주세요");
		location.href="../member/logout.jsp";
	</script>
</html>