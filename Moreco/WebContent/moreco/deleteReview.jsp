<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.movie.reviewDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : Movie recommend</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String tmp = request.getParameter("tmp");
		String sideIdx = request.getParameter("sideIdx");
		String movie_name = request.getParameter("movie_name");
		
		reviewDAO rDAO = new reviewDAO();
		boolean check = rDAO.deleteReview(tmp);
		if (check) {
			%>
			<script>
				alert("삭제가 완료 되었습니다");
				location.href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=movie_name%>";
			</script>
			<%
		} 
		else {
			%>
			<script>
				alert("삭제를 실패 하였습니다");
				location.href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=movie_name%>";
			</script>
			<%
		}
		%>
</body>
</html>