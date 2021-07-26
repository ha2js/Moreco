<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : Movie recommend</title>
<link href="../css/qna.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function checkWriteQna() {
		if (document.qna_fr.qna_title.value == "") {
			alert("제목을 입력하세요");
			document.qna_fr.qna_title.focus();
			return false;
		}
		if (document.qna_fr.qna_content.value == "") {
			alert("내용을 입력하세요");
			document.qna_fr.qna_content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%
		int sideIdx = 0;
		if (request.getParameter("sideIdx") != null) {
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		}
	%>
	<nav id="top">
		<jsp:include page="../moreco/header.jsp" flush="true"></jsp:include>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="../moreco/sidebar.jsp?sideIdx=<%=sideIdx %>" flush="true"></jsp:include>
		</aside>
		<section>
			<span class="title">문의하기</span><br>
			<form method="post" name="qna_fr" action="writeQnA_Pro.jsp" onsubmit="return checkWriteQna();">
				<div class="qnaWrite">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="qna_title" id="floatingInput" style="width:559px;">
						<label for="floatingInput">제목</label>
					</div>
					
				    <div class="form-floating">
				        <textarea class="form-control" name="qna_content" placeholder="Leave a comment here" id="floatingTextarea2" style="width:659px; height: 200px;"></textarea>
				        <label for="floatingTextarea2">내용</label>
				    </div>
				    <br>
					<div class="add_btn">
						<button type="submit" class="btn btn-secondary">저장</button>
					</div>
				</div>
				<input type="hidden" name="sideIdx" value="<%=sideIdx%>"/>
			</form>
		</section>
	</div>
	<footer>
		<jsp:include page="../moreco/footer.html" flush="true"></jsp:include>
	</footer>
</body>
</html>