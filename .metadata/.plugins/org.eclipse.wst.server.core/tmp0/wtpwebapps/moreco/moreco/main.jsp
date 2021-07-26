<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.movie.movieDAO" %>
<%@ page import = "com.moreco.movie.movieDTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/main.css" rel="stylesheet">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : Movie recommend</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int sideIdx = 0;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) pageNum = "1";
		
		int pageSize = 8;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = ((currentPage - 1) * pageSize) + 1;
		int endRow = currentPage * pageSize;
		
		if (request.getParameter("sideIdx") != null)
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		
		movieDAO mDAO = new movieDAO();
		String category_name = mDAO.getCategory_name(sideIdx);
		int movieList_cnt = mDAO.getMovieListCnt(sideIdx);
		
		ArrayList movieList = null;
		int first_row = 0,second_row = 0;
		if (movieList_cnt > 0) {
			movieList = mDAO.getMovieList(sideIdx, startRow, pageSize);
			if (movieList.size() >= 5) 
				first_row = 4;
			else
				first_row = movieList.size();
		}
	%>
	<nav id="top">
		<jsp:include page="header.jsp" flush="true"></jsp:include>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="sidebar.jsp?sideIdx=<%=sideIdx %>" flush="true"></jsp:include>
		</aside>
		<section>
			영화 목록 - <%=category_name %>
			<table>
				<% if (movieList_cnt == 0)  {
				%>
				<tr>
					<td width="1280" height="555"><img style="width:333px; height:189px;" src="../images/movieInfo_none.jpg"/></td>
				</tr>
				<%
				} // cnt==0 close
				
				else {%>
				<tr><% // movie_img
					if (currentPage >= 2) {
						%><td class="btn_td" rowspan="7"><button type="button" class="btn btn-secondary" onclick="location.href='main.jsp?sideIdx=<%=sideIdx%>&pageNum=<%=currentPage-1%>'">&laquo;</button></td><%
					}
					else {
						%><td class="btn_td" rowspan="7">&nbsp;</td><%
					}
					for (int i=0; i<first_row; i++) {
						movieDTO ms = (movieDTO)movieList.get(i);
						String img_path = request.getContextPath()+"/movie_img/"+ms.getMovie_img();%>
						<td class="img_td"><a href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=ms.getMovie_name()%>"><img src="<%=img_path %>"/></a></td>
					<%}
					if (currentPage*8 < movieList_cnt) {
						%><td class="btn_td" rowspan="7"><button type="button" class="btn btn-secondary" onclick="location.href='main.jsp?sideIdx=<%=sideIdx%>&pageNum=<%=currentPage+1%>'">&raquo;</button></td><%
					} 
					else {
						%><td class="btn_td" rowspan="7">&nbsp;</td><%
					}%>
				</tr>
				
				<tr>
				<% // movie_name 
					for (int i=0; i<first_row; i++) {
						movieDTO ms = (movieDTO)movieList.get(i);
						%>
						<td><%=ms.getMovie_name() %></td>
						<%
					}
				%>	
				</tr>
				<tr>
				<% // point
					for (int i=0; i<first_row; i++) {
						movieDTO ms = (movieDTO)movieList.get(i);
						%>
						<td style="color:rgb(255,212,0)">
						<%
							for (int j=1; j<=5; j++) {
								if (j <= ms.getReview_point()) { %>★<% }
								else { %>☆<% }
							}
						%>
						</td>
						<%
					}
				%>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>	
				<% // second row
				if (movieList.size() >= 5) {%>
				<tr><%
					for(int i=first_row; i<movieList.size(); i++) {
						movieDTO ms = (movieDTO)movieList.get(i);
						String img_path = request.getContextPath()+"/movie_img/"+ms.getMovie_img();%>
						<td class="img_td"><a href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=ms.getMovie_name()%>"><img src="<%=img_path %>"/></a></td>
					<%}%>
				</tr>
				<tr>
				<% // movie_name 
					for (int i=first_row; i<movieList.size(); i++) {
						movieDTO ms = (movieDTO)movieList.get(i);
						%>
						<td><%=ms.getMovie_name() %></td>
						<%
					}
				%>	
				</tr>
				<tr>
				<% // point
					for (int i=first_row; i<movieList.size(); i++) {
						movieDTO ms = (movieDTO)movieList.get(i);
						%>
						<td style="color:rgb(255,212,0)">
						<%
							for (int j=1; j<=5; j++) {
								if (j <= ms.getReview_point()) { %>★<% }
								else { %>☆<% }
							}
						%>
						</td>
						<%
					}
				%>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<%
				} // second_row close
				else {
					%>
				<tr>
					<td class="img_td">&nbsp;</td>
					<td class="img_td">&nbsp;</td>
					<td class="img_td">&nbsp;</td>
					<td class="img_td">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<%
				} // second_row not info close
				} // cnt>0 close %>
			</table>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.html" flush="true"></jsp:include>
	</footer>
</body>
</html>