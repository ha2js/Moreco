<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.user.userDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : 회원탈퇴</title>
</head>
<body>
	<%
		String user_id = (String)session.getAttribute("user_id");
		
		userDAO ud = new userDAO();
		ud.deleteUser(user_id);	
	%>
	<script type="text/javascript">
		alert("탈퇴 되었습니다");
		alert("이용해 주셔서 감사합니다");
		location.href="../member/login.html";
	</script>
</body>
</html>