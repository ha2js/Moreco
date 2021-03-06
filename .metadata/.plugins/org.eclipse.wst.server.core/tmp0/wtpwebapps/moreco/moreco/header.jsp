<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">
<title>header</title>
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
		request.setCharacterEncoding("UTF-8");

		String user_id = (String)session.getAttribute("user_id");
		String display_none = "display:none";
		int sideIdx = 0;
		String qna_focus = "";
		
		if (user_id.equals("admin"))
			display_none = "display:block";
		
		if (request.getParameter("sideIdx") != null) {
			sideIdx = Integer.parseInt(request.getParameter("sideIdx"));
		}
		if (sideIdx == 8) {
			qna_focus = "../moreco/";
		}
	%>
	 <header class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="<%=qna_focus %>main.jsp?sideIdx=0"><img src="../images/moreco_logo.png" class="logoimg"
					style="width: 220px; height: 50px; margin:5px; margin-left:-40px;"></a>
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"></ul>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="search" class="form-control form-control-dark"
						placeholder="Search" aria-label="Search">
				</form>

				<div class="text-end">
					<div class="btn-group">
					<button type="button" class="btn btn-danger" style="<%=display_none%>" onClick="location.href='<%=qna_focus %>addmovie.jsp?sideIdx=9'">Add</button>
						<button type="button" class="btn btn-danger dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">
							<img src="../images/svg/user_white.svg"
								style="width: 30px; height: 20px;" />
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"><%=user_id %>???</a></li>
							<li><a class="dropdown-item" href="changeInfo.jsp?sideIdx=<%=sideIdx%>">?????? ?????? ??????</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="../member/logout.jsp">????????????</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header> 
</body>
</html>
