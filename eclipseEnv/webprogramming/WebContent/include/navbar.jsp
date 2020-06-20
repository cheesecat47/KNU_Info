<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
	<a class="navbar-brand" href="main.jsp">
		<img src="../assets/images/pagelogo.png" width="50%" height="50%">
	</a>
	<% 
		request.setCharacterEncoding("UTF-8");
	
		String userName=(String)session.getAttribute("UserName"); 
		if(userName==null){
	%> 		
	<ul class="nav navbar-nav navbar-right">
		<li><a href="../views/login.jsp" class="loginLink">Login</a></li>
	</ul>
	<%
	} else {
	%>
	
	<ul class="nav navbar-nav navbar-right">
		<li><span class='navbar-text float-right'><%=userName%>님, 환영합니다!</span></li>
		<li><a href="../views/logoutProcess.jsp" class="logoutLink  float-right">Logout</a></li>
	</ul>
	<%
	}
	%>  	
</nav>