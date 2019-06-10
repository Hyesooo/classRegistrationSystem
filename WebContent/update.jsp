<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/student.css" rel="stylesheet" type="text/css">
<title>사용자 정보 수정</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="User Register Form Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //for-mobile-apps -->
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300italic,300,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Amaranth:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href="css/login.css" rel="stylesheet" type="text/css" media="all" />

</head>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<body>
<form method="post" action="update_verify.jsp">
<% 
String s_id = null, s_major=null, s_pwd = null;
if (session_id==null) response.sendRedirect("login.jsp");
else{
	Statement stmt;
	stmt = myConn.createStatement();
	String mySQL = "select s_major,s_pwd from students where s_id='" + session_id + "'" ;
	ResultSet rs = stmt.executeQuery(mySQL);
	
	if(rs.next()){
		s_id = session_id;
		s_major = rs.getString("s_major");
		s_pwd = rs.getString("s_pwd");
	}
}
%>



<input type="hidden" name = "s_id" value = <%= s_id %> >
<p>아이디 : <%= s_id %></p>
<p>비밀번호 : <input type="text" name= "s_pwd" value=<%= s_pwd %>></p>
<p>전공 : <%= s_major %></p>
<p><input type = "submit"></p>


 

   <div class="content">
		
		<div class="main">
			<h2>Edit Password</h2>
			
			<form>
			     
				<h5>Username</h5>
				<input type="text" disabled value="<%= s_id %>" {this.value = 'Type here';}">
				<h5>Password</h5>
				<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
				<h5>Major</h5>
				<input type="text" disabled value="<%= s_major %>" {this.value = 'Type here';}">
				<button class="btn waves-effect waves-light orange" type="submit" name="action">Submit</button>
			</form>
		</div>
		
	</div>



</form>
</body>
</html>