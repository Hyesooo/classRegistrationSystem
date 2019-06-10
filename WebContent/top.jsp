<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Comfortaa|Lobster&display=swap" rel="stylesheet">
  <script type = "text/javascript" src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>           
</head>
<body>

<% 
	String student_id = (String) session.getAttribute("student");
	String admin_id = (String) session.getAttribute("admin");
	String session_id =null;
	String log;
	
	if (student_id == null && admin_id == null)
		log = "<a href=login.jsp>Login</a>";
	else log = "<a href=logout.jsp>Logout</a>";%>
<%	
	if(admin_id == null){
		session_id = student_id;
	%>	
  <nav class="navbar-transition cool-navbar z-depth-0">
    <div class="nav-wrapper">
      <a href="main.jsp" class="brand-logo center ">Sookmyung Class Registration System</a>
      <ul id="nav-mobile" class="left hide-on-med-and-down">
      	<li><b><%=log %></b></li>
        <li><a href="update.jsp">Edit Profile</a></li>
	  </ul>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="insert.jsp">Enroll</a></li>
        <li><a href="check.jsp">Check</a></li>
      </ul>
    </div>
 </nav>
	<%}
	else{
		session_id = admin_id;
%>
		

		
		<nav class="navbar-transition cool-navbar z-depth-0">
    		<div class="nav-wrapper">
      		<a href="main.jsp" class="brand-logo center ">Sookmyung Class Registration System</a>
      		<ul id="nav-mobile" class="left hide-on-med-and-down">
      	<li><b><%=log %></b></li>
        <li><a href="admin_insert.jsp">Insert class</a></li>
	  </ul>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="admin_check.jsp">Class Check</a></li>
      </ul>
    </div>
 </nav>
	<%}
%>



<style>
 nav{
  background-color: transparent !important;
  border: none;
  box-shadow: none;
}
 


nav ul a {
    -webkit-transition: background-color .3s;
    transition: background-color .3s;
    font-size: 1rem;
    color: #bdbdbd;
    display: block;
    padding: 0 15px;
    cursor: pointer;
}

</style>
 
  
  
</body>
</html>