<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">
<title>sidebar</title>
<link rel="stylesheet" href="../css/sidebar.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
	<style type="text/css">
		li:hover {background-color:rgb(233,236,239);}
	</style>
</head>
<body>
	<%
		String active_background = "background-color:rgba(33,37,41,0.7)";
		String active = "nav-link active";
		String passive = "nav-link link-dark";
		
		String qna_focus = "";
		String qna_class = "nav-link link-dark";
		String qna_style = "";
		String[] str = {"전체","액션","코미디","드라마","멜로","공포","SF/판타지","애니메이션"};
		
		int sideIdx = 0;
		
		if (request.getParameter("sideIdx") != null) {
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		}
		if (sideIdx == 8) {
			qna_focus = "../moreco/";
			qna_class = "nav-link active";
			qna_style = "background-color:rgba(33,37,41,0.7)";
		}
		
	%>
	<main style="height:100%;">
	
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
		<% for (int i=0; i<8; i++) {
			if (sideIdx == i) {
			%>
			<li><a href="<%=qna_focus %>main.jsp?sideIdx=<%=i %>" class="<%=active %>" style="<%=active_background%>"><%=str[i] %></a></li>
			<%	
				if (i==0) { %><hr><% }
			} 
			else {
			%>
			<li><a href="<%=qna_focus %>main.jsp?sideIdx=<%=i %>" class="<%=passive %>"><%=str[i] %></a></li>
			<%
				if (i==0) { %><hr><% }
			}
		}
		%>
			<hr>
			<li><a href="../qna/morecoQnA.jsp?sideIdx=8" class="<%=qna_class %>" style="<%=qna_style%>">문의하기</a></li>
		</ul>
		<hr>
	</div>
	<div class="b-example-divider"></div>
	</main>
</body>
</html>