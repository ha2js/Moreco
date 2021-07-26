<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moreco.qna.qnaDTO" %>
<%@ page import="com.moreco.qna.qnaDAO" %>
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
		int sideIdx = 0;
		if (request.getParameter("sideIdx") != null) {
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		}
		int qna_idx = Integer.parseInt(request.getParameter("idx"));
		int qna_grpno = Integer.parseInt(request.getParameter("grpno"));
		int qna_ident = Integer.parseInt(request.getParameter("ident"));
		int qna_ansnum = Integer.parseInt(request.getParameter("ansnum"));
		
		String pageNum = request.getParameter("pageNum");
		String user_id = (String)session.getAttribute("user_id");
		
		qnaDAO qDAO = new qnaDAO();
		
		qDAO.updateReadcnt(qna_idx, qna_grpno, qna_ident, qna_ansnum);
		qnaDTO qd = qDAO.getBoard(qna_idx,qna_grpno, qna_ident, qna_ansnum);
	%>
	<nav id="top">
		<jsp:include page="../moreco/header.jsp?sideIdx=<%=sideIdx %>" flush="true"></jsp:include>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="../moreco/sidebar.jsp?sideIdx=<%=sideIdx %>" flush="true"></jsp:include>
		</aside>
		<section>
		<button type="button" onclick="location.href='morecoQnA.jsp?pageNum=<%=pageNum %>&sideIdx=<%=sideIdx %>'" class="btn btn-secondary" style="margin-top:15px; font-size:12px;">목록으로</button>
		<% if (qd.getUser_id().equals(user_id)) { %>
			<button type="button" onclick="location.href='updateQnA.jsp?qna_idx=<%=qd.getQna_idx()%>&pageNum=<%=pageNum %>&sideIdx=<%=sideIdx %>&qna_grpno=<%=qd.getQna_grpno() %>&qna_ident=<%=qd.getQna_ident() %>&qna_ansnum=<%=qd.getQna_ansnum() %>'" class="btn btn-secondary" style="margin-top:15px; font-size:12px;">수정하기</button>
			<button type="button" onclick="location.href='deleteQnA.jsp?qna_idx=<%=qd.getQna_idx()%>&sideIdx=<%=sideIdx %>&qna_grpno=<%=qd.getQna_grpno() %>&qna_ident=<%=qd.getQna_ident() %>&qna_ansnum=<%=qd.getQna_ansnum() %>'" class="btn btn-secondary" style="margin-top:15px; font-size:12px;">삭제하기</button>
		<%} if (user_id.equals("admin")) { %>
			<button type="button" onclick="location.href='RewriteQnA.jsp?sideIdx=<%=sideIdx%>&qna_idx=<%=qd.getQna_idx() %>&qna_grpno=<%=qd.getQna_grpno() %>&qna_ident=<%=qd.getQna_ident() %>&qna_ansnum=<%=qd.getQna_ansnum() %>&title=<%=qd.getQna_title() %>'" class="btn btn-secondary" style="margin-top:15px; font-size:12px;">답글쓰기</button><br><br>
		<%} else { %> <br><br> <% } %>
			<div class="movieInfo_table" style="display: inline-block;">
		        <table class="table" style="width:800px; float:left;">
		            <tr>
		                <td class="table-active" style="width:120px;">제목</td>
		                <td class="movie_info_td"><%=qd.getQna_title() %></td>
		            </tr>
		            <tr>
		                <td class="table-active">아이디</td>
		                <td class="movie_info_td"><%=qd.getUser_id() %></td>
		            </tr>
		            <tr>
		                <td class="table-active">작성날짜</td>
		                <td class="movie_info_td"><%=qd.getQna_date() %></td>
		            </tr>
		            <tr>
		            	<td class="table-active">조회수</td>
		                <td class="movie_info_td"><%=qd.getQna_readcnt() %></td>
		            </tr>
		            <tr>
		                <td class="movie_content" colspan="3"><%=qd.getQna_content() %></td>
		            </tr>
		        </table>
    		</div>
		</section>
	</div>
	<footer>
		<jsp:include page="../moreco/footer.html" flush="true"></jsp:include>
	</footer>
</body>
</html>