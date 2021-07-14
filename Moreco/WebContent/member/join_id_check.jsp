<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.moreco.user.userDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moreco : 중복 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("user_id");
		
		userDAO uDAO = new userDAO();
		boolean check = uDAO.id_check(user_id);
		if (check == true) {
			%>
			<script>
				alert("사용 가능한 아이디입니다.");
				history.back();
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