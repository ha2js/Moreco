<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.moreco.movie.movieDTO" %>
<%@page import="com.moreco.movie.movieDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moreco : 영화 등록</title>
</head>
<body>
	<%
		String path = request.getSession().getServletContext().getRealPath("movie_img");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		String category_idx = multi.getParameter("category_idx");
		String movie_name = multi.getParameter("movie_name");
		String movie_director = multi.getParameter("movie_director");
		String movie_rank = multi.getParameter("real_movie_rank");
		String movie_content = multi.getParameter("movie_content");
		String movie_img = multi.getFilesystemName("movie_img");
		
		movieDTO ms = new movieDTO();
		ms.setCategory_idx(category_idx);
		ms.setMovie_name(movie_name);
		ms.setMovie_director(movie_director);
		ms.setMovie_rank(movie_rank);
		ms.setMovie_content(movie_content);
		ms.setMovie_img(movie_img);
		
		movieDAO mDAO = new movieDAO();
		boolean check = mDAO.insertMovie(ms);
		if (check) {
			%>
			<script type="text/javascript">
				alert("영화 등록 완료");
				location.href="main.jsp";
			</script>
		<% } 
		else {
			%>
			<script type="text/javascript">
				alert("이미 등록된 영화입니다.");
				history.back();
			</script>
			<%
		} %>
</body>
</html>