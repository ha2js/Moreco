<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moreco.movie.reviewDTO" %>
<%@ page import="com.moreco.movie.reviewDAO" %>
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
	
		int sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		
		reviewDTO rDTO = new reviewDTO();
		reviewDAO rDAO = new reviewDAO();
		
		rDTO.setMovie_name(request.getParameter("movie_name"));
		rDTO.setReview_point(Integer.parseInt(request.getParameter("review_point")));
		rDTO.setReview_str(request.getParameter("review_str"));
		rDTO.setUser_id((String)session.getAttribute("user_id"));
		
		rDAO.insertReview(rDTO);
	%>
	<script type="text/javascript">
		alert("감상평이 추가 되었습니다");
		location.href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=rDTO.getMovie_name()%>";
	</script>
</body>
</html>