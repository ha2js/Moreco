<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.qna.qnaDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : Movie recommend</title>
</head>
<body>
	<%
		int sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		int qna_grpno = Integer.parseInt(request.getParameter("qna_grpno"));
		int qna_ident = Integer.parseInt(request.getParameter("qna_ident"));
		int qna_ansnum = Integer.parseInt(request.getParameter("qna_ansnum"));
		
		qnaDAO qDAO = new qnaDAO();
		
		qDAO.deleteBoard(qna_idx, qna_grpno, qna_ident, qna_ansnum);
	%>
	
	<script type="text/javascript">
		alert("삭제 완료");
		location.href="morecoQnA.jsp?sideIdx=<%=sideIdx%>";
	</script> 
</body>
</html>