<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../images/svg/moreco_favicon.gif" rel="shortcut icon" type="image/x-icon">
<title>Moreco : 영화 등록</title>
<link href="../css/add.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    function inp_check() {
    	
    	if (document.forms[1].category_idx.value == 0) {
    		alert("장르를 선택하세요");
    		return false;
    	}
        if (document.forms[1].movie_name.value == "") {
            alert("영화명을 작성하세요");
            document.forms[1].movie_name.focus();
            return false;
        }
        if (document.forms[1].movie_director.value == "") {
            alert("감독명을 작성하세요");
            document.forms[1].movie_director.focus();
            return false;
        }
        if (document.forms[1].movie_rank.value == "") {
            alert("등급을 작성하세요");
            document.forms[1].movie_rank.focus();
            return false;
        }
        else {
        	var movie_rank_check = document.forms[1].movie_rank.value.substring(0,2);
        	if (movie_rank_check != '전체' && movie_rank_check != '12' && movie_rank_check != '15' && movie_rank_check != '18') {
        		alert("전체/12세/15세/18세 관람가 중에 선택해 주세요");
                document.forms[1].movie_rank.focus();
                return false;
        	}
        	else {
        		document.forms[1].real_movie_rank.value = movie_rank_check;
        	}
        }
        if (document.forms[1].movie_content.value == "") {
            alert("줄거리를 작성하세요");
            document.forms[1].movie_content.focus();
            return false;
        }
        if (document.forms[1].movie_img.value == "") {
            alert("이미지를 등록하세요");
            document.forms[1].movie_img.focus();
            return false;
        }
        var fileVal = $("#inputGroupFile01").val(); 
        fileVal = fileVal.slice(fileVal.indexOf(".")+1).toLowerCase(); 
        
        
        if(fileVal != "jpg" && fileVal != "png" && fileVal != "jpeg" && fileVal != "gif" && fileVal != "bmp" && fileVal != "jfif"){ 
    		alert("이미지 파일만 가능합니다");
    		return false;
        } 
        
    	var maxSize = 10 * 1024 * 1024;
    	var fileSize = 0;
    	var browser = navigator.appName;
    	
    	if (browser == "Microsoft Internet Explorer") {
    		var oas = new ActiveXObject("Scripting.FileSystemObject");
    		fileSize = oas.getFile( file.value ).size;
    	}
    	else {
    		fileSize = file.files[0].size;
    	}
    	if(fileSize > maxSize) {
            alert("10MB 이하인 이미지만 등록 가능합니다");
            return false;
        }
    }
</script>
</head>
<body>
	<nav id="top">
		<jsp:include page="header.jsp" flush="true"></jsp:include>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="sidebar.jsp" flush="true"></jsp:include>
		</aside>
		<section>
			<h2>영화 등록</h2>
    		<div class="add_movies">
        		<form method="post" action="addmoviePro.jsp" enctype="multipart/form-data" onsubmit="return inp_check();" >
        		    <select class="form-select form-select-lg mb-3" name="category_idx" aria-label=".form-select-lg example" style="width:559px; height:58px; font-size:16px;">
  						<option selected value="0">장르</option>
  						<option value="1">액션</option>
  						<option value="2">코미디</option>
  						<option value="3">드라마</option>
  						<option value="4">멜로</option>
  						<option value="5">공포</option>
  						<option value="6">SF/판타지</option>
  						<option value="7">애니메이션</option>
					</select>
            		<div class="form-floating mb-3">
                		<input type="text" class="form-control" name="movie_name" id="floatingInput" style="width:559px;" placeholder="영화명">
                		<label for="floatingInput">영화명</label>
            		</div>
            		<div class="form-floating mb-3">
                		<input type="text" class="form-control" name="movie_director" id="floatingInput" style="width:559px;" placeholder="감독명">
                		<label for="floatingInput">감독명</label>
            		</div>
            		<div class="form-floating mb-3">
                		<input type="text" class="form-control" name="movie_rank" id="floatingInput" style="width:259px;" placeholder="등급">
                		<label for="floatingInput">등급</label>
                		<input type="hidden" name="real_movie_rank"/>
            		</div>
            		<div class="form-floating">
                		<textarea class="form-control" name="movie_content" placeholder="Leave a comment here" id="floatingTextarea2" style="width:659px; height: 200px;"></textarea>
                		<label for="floatingTextarea2">줄거리</label>
            		</div>
            		<br>
            		<div class="input-group mb-3" style="width:659px;">
                		<input type="file" accept="image/*" name="movie_img" class="form-control" id="inputGroupFile01" >
            		</div>
            		<div class="add_btn">
            			<button type="submit" class="btn btn-danger">등록하기</button>
            		</div>
        		</form>
    		</div>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.html" flush="true"></jsp:include>
	</footer>
</body>
</html>