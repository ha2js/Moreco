<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.qna.qnaDTO" %>
<%@ page import = "com.moreco.qna.qnaDAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/qna.css" rel="stylesheet">
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
</head>
<body>
	<%
		int sideIdx = 8;
	
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) pageNum = "1";
		
		qnaDAO qDAO = new qnaDAO();
		
		int cnt = qDAO.getCount();
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		ArrayList qnaList = null;
		if (cnt > 0) {
			qnaList = qDAO.getQnA(startRow, pageSize);
		}
	%>
	<nav id="top">
		<jsp:include page="../moreco/header.jsp?sideIdx=<%=sideIdx %>" flush="true"></jsp:include>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="../moreco/sidebar.jsp?sideIdx=<%=sideIdx %>" flush="true"></jsp:include>
		</aside>
		<section> 
			<button type="button" onclick="location.href='writeQnA.jsp?sideIdx=<%=sideIdx %>'" class="btn btn-secondary" style="margin-top:15px;">질문하기</button>
			<div class="qna_table">
				<table class="table table-hover" style="width:730px;">
					<thead>
						<tr>
							<th scope="col" style="width:55px;">번호</th>
							<th scope="col" style="width:150px;">아이디</th>
							<th scope="col" style="width:400px;">제목</th>
							<th scope="col" style="width:120px;">작성날짜</th>
							<th scope="col" style="width:65px;">조회수</th>
						</tr>
					</thead>
					<tbody>
					<%if (cnt > 0)  {
						for (int i=0; i<qnaList.size(); i++) {
							qnaDTO qd = (qnaDTO)qnaList.get(i);
							
						%>
						<tr>
							<%if (qd.getQna_idx() < 0)  { %>
								<th scope="row">&nbsp;</th>
								<td>
								<% 
								int width = 0;
								if (qd.getQna_ident() > 0) {
									width = 10 * qd.getQna_ident();
									%>
									<img src="../images/qna_level.gif" height="15" width="<%=width %>"/>
									<img src="../images/re.gif">
									<%
								}%>
								</td>
							<%} 
							else { %>
								<th scope="row"><%=qd.getQna_idx() %></th>
								<td> <%=qd.getUser_id() %></td>
							<%}%>
							<td>
								<a class="contents" href="contentQnA.jsp?idx=<%=qd.getQna_idx()%>&pageNum=<%=pageNum%>&sideIdx=<%=sideIdx%>&grpno=<%=qd.getQna_grpno()%>&ident=<%=qd.getQna_ident()%>&ansnum=<%=qd.getQna_ansnum()%>"><%=qd.getQna_title() %></a>
							</td>
							<td><%=qd.getQna_date() %></td>
							<td><%=qd.getQna_readcnt() %></td>
						</tr>
					<%
						}
					} else {
					%>
						<tr>
							<td colspan="5">등록된 게시글이 없습니다.</td>
						</tr>
					<%	
					}%>
					</tbody>
				</table>
			</div>
			<div class="qnaPaging">
				<nav aria-label="Page navigation example">
				<% if (cnt > 0) { // paging
				
					int pageBlock = 5;
					int pageCount = cnt / pageSize + (cnt % pageSize == 0 ? 0 : 1);
					int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
					int endPage = startPage + pageBlock -1;
					
					if (endPage > pageCount) {
						endPage = pageCount;
					}
				%>
					<ul class="pagination" style="display: inline-block">
					<%if (startPage > pageBlock) { %>
						<li class="page-item"><a style="color:rgb(0,0,0);" class="page-link" href="morecoQnA.jsp?sideIdx=<%=sideIdx%>&pageNum=<%=startPage - pageBlock%>">&laquo;</a></li>
					<%} 
					for (int i=startPage; i<=endPage; i++) {%>
	    				<li class="page-item"><a style="color:rgb(0,0,0);" class="page-link" href="morecoQnA.jsp?sideIdx=<%=sideIdx%>&pageNum=<%=i%>"><%=i %></a></li>
	    			<%}
					if (endPage < pageCount) {%>
	    				<li class="page-item"><a style="color:rgb(0,0,0);" class="page-link" href="morecoQnA.jsp?sideIdx=<%=sideIdx%>&pageNum=<%=startPage + pageBlock%>">&raquo;</a></li>
	    			<%} %>
	  				</ul>
	  			<%} %>
				</nav>
			</div>
		</section>
	</div>
	<footer>
		<jsp:include page="../moreco/footer.html" flush="true"></jsp:include>
	</footer>
</body>
</html>