<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.qna.qnaDTO" %>
<%@ page import = "com.moreco.qna.qnaDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String pageNum = request.getParameter("pageNum");
		String user_id = (String)session.getAttribute("user_id");
		
		int sideIdx = 0;
		if (request.getParameter("sideIdx") != null) {
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		}
		%>
		<jsp:useBean id="qd" class="com.moreco.qna.qnaDTO"/>
		<jsp:setProperty property="*" name="qd" />
		<%
		
		qd.setUser_id(user_id);
		qnaDAO qDAO = new qnaDAO();
		
		qDAO.updateBoard(qd);
	%>
	<script type="text/javascript">
		alert("수정 완료");
		location.href="morecoQnA.jsp?pageNum=<%=pageNum%>&sideIdx=<%=sideIdx%>";
	</script>
</body>
</html>