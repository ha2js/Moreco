<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.moreco.user.userDTO" %>
<%@ page import = "com.moreco.user.userDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : 회원정보변경</title>
<link href="../css/changeInfo.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function change_func() {
	
		var now = new Date();
		var year = now.getFullYear();
		
		var ssn_check = change_fr.user_back_ssn.value.charAt(0);
		var age_tmp = change_fr.user_front_ssn.value.substring(0,2);
		
		if (ssn_check == 1 || ssn_check == 3) change_fr.user_gender.value = "남자";
		else if (ssn_check == 2 || ssn_check == 4) change_fr.user_gender.value = "여자";
		else change_fr.user_gender.value = "외국인";
		
	    if (change_fr.user_pw.value=="") {
	        alert("비밀번호를 입력해 주세요");
	        change_fr.user_pw.focus();
	        return false;
	    }
	    else if ((change_fr.user_pw.value.length < 6) || (change_fr.user_pw.value.length > 13)) {
	        alert("비밀번호를 6~13자로 입력해 주세요");
	        change_fr.user_pw.focus();
	        return false;
	    }
	    if (change_fr.user_pw.value != change_fr.user_pw_check.value) {
	        alert("비밀번호를 확인해 주세요");
	        change_fr.user_pw.focus();
	        return false;
	    }
	    if (change_fr.user_name.value=="") {
	        alert("이름을 입력해 주세요");
	        change_fr.user_name.focus();
	        return false;
	    }
	    if ((change_fr.user_front_ssn.value.length != 6) || (change_fr.user_back_ssn.value.length != 7)) {
	        alert("주민등록번호를 확인해 주세요");
	        change_fr.user_front_ssn.focus();
	        return false;
	    }
	    else if (ssn_check != '1' && ssn_check != '2' && ssn_check != '3' && ssn_check != '4') {
	    	alert("주민등록번호를 확인해 주세요");
	    	change_fr.user_front_ssn.focus();
	    	return false;
	    }
		if (ssn_check == '1' || ssn_check == '2') {
			var age = year-(1900 + parseInt(age_tmp))+1;       		
			if (age < 0) {
				alert("주민등록번호를 확인해 주세요");
	            change_fr.user_front_ssn.focus();
	            return false;
			}
			else
				change_fr.user_age.value = age;
		}
		else if (ssn_check == 3 || ssn_check == 4) {
			var age = year-(2000+ parseInt(age_tmp))+1;
			if (age < 0) {
				alert("주민등록번호를 확인해 주세요");
	            change_fr.user_front_ssn.focus();
	            return false;
			}
			else
				change_fr.user_age.value = age;
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
		String user_id = (String)session.getAttribute("user_id");
		
		userDAO ud = new userDAO();
		userDTO us = ud.selectUser(user_id);
	%>
	<nav id="top">
		<jsp:include page="header.jsp" flush="true"></jsp:include>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="sidebar.jsp?sideIdx=<%=sideIdx %>" flush="true"></jsp:include>
		</aside>
		<section>
			<span class="title">회원정보변경</span> <button type="button" class="btn btn-danger" style="margin-left:33px;" onclick="location.href='deleteUser_check.jsp'">회원탈퇴</button>
			<form method="post" name="change_fr" action="changeInfoPro.jsp" onsubmit="return change_func();">
				<div class="changeInfo">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="user_id" id="floatingInput" style="width:559px;" value="<%=user_id %>" readonly="readonly" >
						<label for="floatingInput">아이디</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="user_name" id="floatingInput" style="width:559px;" value="<%=us.getUser_name() %>">
						<label for="floatingInput">이름</label>
					</div>						
					<div class="form-floating mb-3">
						<input type="password" class="form-control" name="user_pw" id="floatingInput" style="width:559px;" >
						<label for="floatingInput">비밀번호</label>
					</div>	
					<div class="form-floating mb-3">
						<input type="password" class="form-control" name="user_pw_check" id="floatingInput" style="width:559px;" >
						<label for="floatingInput">비밀번호 확인</label>
					</div>	
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="user_front_ssn" id="floatingInput" style="width:279px; float:left;" value="<%=us.getUser_front_ssn() %>">
						<label for="floatingInput">주민등록번호</label>
						<input type="password" class="form-control" name="user_back_ssn" id="floatingInput" style="width:279px;" value="<%=us.getUser_back_ssn() %>">
					</div>
					<input type="hidden" name="user_gender"/>
                	<input type="hidden" name="user_age"/>
					<br>
					<button type="submit" class="btn btn-secondary">수정</button>
				</div>	
			</form>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.html" flush="true"></jsp:include>
	</footer>
</body>
</html>