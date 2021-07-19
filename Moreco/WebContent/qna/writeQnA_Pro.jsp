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
		
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String user_id = (String)session.getAttribute("user_id");
		int sideIdx = 0;
		if (request.getParameter("sideIdx") != null) {
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		}
		
		qnaDTO qDTO = new qnaDTO();
		qnaDAO qDAO = new qnaDAO();
		
		qDTO.setQna_title(qna_title);
		qDTO.setQna_content(qna_content);
		qDTO.setUser_id(user_id);
		
		qDAO.insertQnA(qDTO);
	%>
	<script type="text/javascript">
		alert("저장 완료");
		location.href="morecoQnA.jsp?sideIdx=<%=sideIdx%>";
	</script>
	
</body>
</html>