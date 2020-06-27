<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp"%>
    <link rel="stylesheet" href="../assets/css/main.css"/>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	
	<div class="img_wrapper">
		<div id="img1">
			<img id="main_img1" src="../assets/images/main_img1.jpg" alt="main_img1"/>
			<div id="txt_container" class="img1_pos img1_container">
				<h1 id="img1_text" class="img1_pos">KNU Info</h1>
			</div>
		</div>
	</div>
	
	<div class="img_wrapper">
		<div id="img3">
			<img id="main_img3" src="../assets/images/main_img3.png" alt="main_img3"/>
			<div id="txt_container" class="img3_pos img3_container">
				<h2 id="img3_text" class="img3_pos">학교 홈페이지에 공지글이 너무 많은가요?</h2>
			</div>
		</div>
	</div>
	
	<div class="img_wrapper">
		<div id="bottom_text">
			<div id="txt_container" class="bottom_pos bottom_container">
				<h1>여러분에게 필요한 공지만<br>저희가 찾아드릴게요!</h1>
			</div>
			<input type="button" id="loginbtn" class="btn btn-outline-secondary btn-lg" value="Log In" onclick="location.href='login.jsp'"/>
		</div>
	</div>
	
	<%@ include file="../include/footer.jsp"%>
	<script src="../assets/js/main.js"></script>
</body>
</html>