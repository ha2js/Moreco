<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : 회원탈퇴</title>
<script type="text/javascript">
	window.onload = function(){
		if (!confirm("회원 탈퇴를 진행 하시겠습니까?")) {
	        history.back();
	    } else {
			if (!confirm("탈퇴를 하면 데이터를 복구할 수 없습니다. 진행 하시겠습니까?")) {
				history.back();
			}
			else {
				location.href="deleteUser.jsp";
			}
	    }
	}
</script>
</head>
<body>
</body>
</html>