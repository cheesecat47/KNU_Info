<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<% 
	/*session.setAttribute("UserId", "2017110115");
	session.setAttribute("Name", "홍길동"); 
	if (session.getAttribute("keyword") == null){
		session.setAttribute("keyword", "대회,졸업,설명회");
	}*/
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp"%>
    <link rel="stylesheet" href="../assets/css/customizePage.css"/>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<%@ include file="../include/isLogIn.jsp"%>
	
	<div style="height: 50px;"></div>
	
	<div class="container backgroundColor">
		<form method="post" class="form-horizontal" enctype="multipart/form-data" action="../views/customizePageProcess.jsp">
			<div class="form-group">
				<label class="col-sm-2 control-label">키워드 : </label>
				<div class="col-sm-10">
					<input type="text" id="kwd_input" class="form-control input-lg" name="keyword" placeholder="ex) 대회, 졸업, 설명회 - 콤마(,)로 구분해서 최대 10개까지 입력 가능합니다."/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">배경 사진 : </label>
				<div class="col-sm-10">
					<input type="file" class="form-control input-lg" name="bgimage" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-secondary" value="저장"/>
				</div>
			</div>
		</form>
	</div>
	
	<%@ include file="../include/footer.jsp"%>

	<!-- to Process keywords -->
	<% 
		Enumeration<String> en_kwd = session.getAttributeNames();
		
		while (en_kwd.hasMoreElements()) {
			String name = en_kwd.nextElement().toString();
			String value = session.getAttribute(name).toString();
			
			//out.println(name + " " + value);
			if (name.equals("keyword")) {
				// 만약 이미 설정된 키워드가 있으면
	%>
	<script>	
		function showCurrentKeywords(kwd) {
			var kwd_input = document.getElementById("kwd_input")
			//console.log(kwd_input);
			kwd_input.value = kwd;
		}
		showCurrentKeywords("<%=value%>");
	</script>
	<%
			}
		}
	%>
	
	<!-- to Process Background Image -->
	<%@ include file="../include/bgImgProcess.jsp"%>
</body>
</html>