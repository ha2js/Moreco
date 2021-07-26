<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : Movie recommend</title>
<script type="text/javascript">
	window.onload = function(){
		if (!confirm("삭제 하시겠습니까?")) {
	        history.back();
	    } else {
			document.delete_review_fr.submit();	        
	    }
	}
</script>
</head>
<body>
<%
	String tmp = request.getParameter("tmp");
	String sideIdx = request.getParameter("sideIdx");
	String movie_name = request.getParameter("movie_name");
%>
	<form name="delete_review_fr" method="post" action="deleteReview.jsp">
		<input type="hidden" name="tmp" value="<%=tmp%>"/>
		<input type="hidden" name="sideIdx" value="<%=sideIdx%>"/>
		<input type="hidden" name="movie_name" value="<%=movie_name%>"/>
	</form>
</body>
</html>