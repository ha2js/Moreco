<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moreco.movie.reviewDTO" %>
<%@ page import="com.moreco.movie.reviewDAO" %>
<%@ page import="com.moreco.movie.movieDAO" %>
<%@ page import="com.moreco.movie.movieDTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/movieInfo.css" rel="stylesheet">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : Movie recommend</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/headers/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
	function review_check() {
		if (document.review_fr.review_point.value == "") {
			alert("별점을 선택해 주세요");
			return false;
		}
		if (document.review_fr.review_str.value == "") {
			alert("감상평을 작성해 주세요");
			return false;
		}
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int sideIdx = 0;
		String user_id = (String)session.getAttribute("user_id");
		String pageNum = request.getParameter("pageNum");
		String review_pageNum = request.getParameter("review_pageNum");
		if (review_pageNum == null) 
			review_pageNum = "1";
		
		String movie_name = request.getParameter("movie_name");
		
		if (request.getParameter("sideIdx") != null)
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		
		movieDAO mDAO = new movieDAO();
		reviewDAO rDAO = new reviewDAO();
		movieDTO ms = mDAO.getMovieInfo(movie_name);
		
		String img_path = request.getContextPath()+"/movie_img/"+ms.getMovie_img();
		
		int review_cnt = rDAO.getReviewCnt(ms.getMovie_name());
		
		int review_pageSize = 5;
		int review_currentPage = Integer.parseInt(review_pageNum);
		int review_startRow = (review_currentPage - 1 ) * review_pageSize + 1;
		int review_endRow = review_currentPage * review_pageSize;
		
			
		ArrayList reviewList = null;
		if (review_cnt > 0) {
			reviewList = rDAO.getReview(ms.getMovie_name(), review_startRow, review_pageSize);
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
			<div class="infoTitle">영화정보</div>
			<div class="movieInfo_table" style="display: inline-block;">
		        <table class="table" style="width:800px; float:left;">
		            <tr>
		                <td class="table-active" style="width:120px;">제목</td>
		                <td class="movie_info_td"><%=ms.getMovie_name() %></td>
		            </tr>
		            <tr>
		                <td class="table-active">장르</td>
		                <td class="movie_info_td"><%=ms.getCategory_name() %></td>
		            </tr>
		            <tr>
		                <td class="table-active">감독이름</td>
		                <td class="movie_info_td"><%=ms.getMovie_director() %></td>
		            </tr>
		            <tr>
		                <td class="table-active">등급</td>
		                <%
		                if (ms.getMovie_rank().equals("전체")) {%>
		                <td class="movie_info_td"><%=ms.getMovie_rank() %>관람가</td>
		                <% }
		                else { %>
		                <td class="movie_info_td"><%=ms.getMovie_rank() %>세관람가</td>
		                <% } %>
		            </tr>
		            <tr>
		            	<td class="table-active">평점</td>
		                <td class="movie_info_td"><%=ms.getReview_point() %>점</td>
		            </tr>
		            <tr>
		                <td class="movie_content" colspan="3"><%=ms.getMovie_content() %></td>
		            </tr>
		            <img class="movieImg" src="<%=img_path %>" />
		        </table>
    		</div>
    		<div class="review"> <!-- review -->
    			<form method="post" name="review_fr" action="movieInfoPro.jsp" onsubmit="return review_check();">
    				<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="review_point" id="inlineRadio1" value="1">
						<label class="form-check-label" for="inlineRadio1" style="color:rgb(255,212,0);">★</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="review_point" id="inlineRadio2" value="2">
						<label class="form-check-label" for="inlineRadio2" style="color:rgb(255,212,0);">★★</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="review_point" id="inlineRadio3" value="3">
						<label class="form-check-label" for="inlineRadio3" style="color:rgb(255,212,0);">★★★</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="review_point" id="inlineRadio4" value="4">
						<label class="form-check-label" for="inlineRadio4" style="color:rgb(255,212,0);">★★★★</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="review_point" id="inlineRadio5" value="5">
						<label class="form-check-label" for="inlineRadio5" style="color:rgb(255,212,0);">★★★★★</label>
					</div>
					<input type="hidden" name="sideIdx" value="<%=sideIdx %>"/>
					<input type="hidden" name="movie_name" value="<%=ms.getMovie_name()%>"/>
    				 <table>
    				 	<tr>
    				 		<td>
								<div class="form-floating">
                					<textarea class="form-control" name="review_str" id="floatingTextarea2" style="width:800px; height: 70px;"></textarea>
                					<label for="floatingTextarea2">감상평</label>
            					</div>
            				</td>
            				<td style="text-align:center; vertical-align:bottom; width:80px;">
            					<button type="submit" class="btn btn-secondary">등록</button>
		            		</td>
        	    		</tr>
            		</table>
    			</form>
    		</div>
    		<div class="test"> <!-- review_content -->
    			<table class="comment">
    			<% if (review_cnt <= 0)  { %>
    				<tr>
    					<td class="none_info" colspan="3">등록된 평가가 없습니다.</td>
    				</tr>
    			<%} else {
    					for (int i=0; i<reviewList.size(); i++) {
    						String delete_visibility = "visibility:hidden";
    						reviewDTO rDTO = (reviewDTO)reviewList.get(i);
    						if ((rDTO.getUser_id().equals(user_id)) || user_id.equals("admin") ) {
    							delete_visibility = "visibility:visible";
    						}
    						%>
		    				<tr class="tr_first_child">
		    					<th><%=rDTO.getUser_id() %></th>
		    					<td class="review_point">
		    						<%
		    						for (int j=1; j<6; j++) {
		    							if (j <= rDTO.getReview_point()) {
		    								%>★<%
		    							} else {
		    								%>☆<%
		    							}
		    						}
		    						%>
		    					</td>
		    					<td class="delete_btn"><button type="button" class="btn btn-danger" style="font-size:12px; <%=delete_visibility%>" onclick="location.href='deleteReviewCheck.jsp?tmp=<%=rDTO.getReview_date()%>&sideIdx=<%=sideIdx%>&movie_name=<%=ms.getMovie_name()%>'">X</button></td>
		    				</tr>
		    				<tr>
		    					<td class="review_str" colspan="3"><%=rDTO.getReview_str() %></td>
		    				</tr>
		    				<tr class="tr_last_child">
		    					<td colspan="3"><%=rDTO.getReview_date() %></td>
		    				</tr>
		    				
    				<%} } %>

    			</table>
    		</div>
    		
 
    		<div class="paging"> <!-- paging -->
    		
    		<% if (review_cnt > 0) { 
    			
    			int review_pageBlock =  5;
    			
    			int review_pageCount = (review_cnt / review_pageSize) + (review_cnt % review_pageBlock == 0 ? 0:1);
    			int review_startPage = ((review_currentPage - 1)/review_pageBlock) * review_pageBlock + 1;
    			int review_endPage = review_startPage + review_pageBlock - 1;
    			
    			if (review_endPage > review_pageCount) {
    				review_endPage = review_pageCount;
    			}
    		%>
    			<nav aria-label="Page navigation example">
  					<ul class="pagination" style="display: inline-block">
  						<% 
  						if (review_startPage > review_pageBlock) { %>
    						<li class="page-item"><a style="color:rgb(0,0,0);" class="page-link" href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=ms.getMovie_name()%>&review_pageNum=<%=review_startPage - review_pageBlock%>">&laquo;</a></li>
    					<% } 
  						for (int i=review_startPage; i<=review_endPage; i++) { %>
    						<li class="page-item"><a style="color:rgb(0,0,0);" class="page-link" href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=ms.getMovie_name()%>&review_pageNum=<%=i%>"><%=i %></a></li>
    					<%} 
    					if (review_endPage < review_pageCount) { %>
    						<li class="page-item"><a style="color:rgb(0,0,0);" class="page-link" href="movieInfo.jsp?sideIdx=<%=sideIdx%>&movie_name=<%=ms.getMovie_name()%>&review_pageNum=<%=review_startPage + review_pageBlock%>">&raquo;</a></li>
    					<%} %>
  					</ul>
				</nav>
			<%}%>	
    		</div>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.html" flush="true"></jsp:include>
	</footer>
</body>
</html>