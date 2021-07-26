<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : Movie recommend</title>
<script type="text/javascript">
	window.onload = function(){
		if (!confirm("삭제 하시겠습니까?")) {
	        history.back();
	    } else {
			document.delete_qna_fr.submit();	        
	    }
	}
</script>
</head>
<body>
	<%
		int sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		int qna_grpno = Integer.parseInt(request.getParameter("qna_grpno"));
		int qna_ident = Integer.parseInt(request.getParameter("qna_ident"));
		int qna_ansnum = Integer.parseInt(request.getParameter("qna_ansnum"));
	%>
	<form method="post" name="delete_qna_fr" action="deleteQnA_Pro.jsp">
		<input type="hidden" name="sideIdx" value="<%=sideIdx %>"/>
		<input type="hidden" name="qna_idx" value="<%=qna_idx %>"/>
		<input type="hidden" name="qna_grpno" value="<%=qna_grpno %>"/>
		<input type="hidden" name="qna_ident" value="<%=qna_ident %>"/>
		<input type="hidden" name="qna_ansnum" value="<%=qna_ansnum %>"/>
	</form>
</body>
</html>