<nav class="navbar navbar-inverse">
	  <a class="navbar-brand" href="main.jsp">
	  	<img src="../assets/images/pagelogo.png" width="50%" height="50%">
	  </a>
	  <% String userName=(String)session.getAttribute("Name"); 
	  	if(userName==null){
	  	%> 		
	  		<ul class="nav navbar-nav navbar-right">
		      <li><a href="#" class="loginLink">Login</a></li>
    		</ul>
	  	<%
	  	}
	  	else{
	  	%>
	  		<span class='navbar-text float-right'><%=userName%>님, 환영합니다.</span>
	  		<ul class="nav navbar-nav navbar-right">
		      <li><a href="#" class="logoutLink">Logout</a></li>
    		</ul>
	  	<%
	  	}
	  	%>
	  	
</nav>