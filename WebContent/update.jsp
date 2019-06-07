<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
</head>
	<%@ include file="dbconfig.jsp"%>
	<%@ include file="top.jsp"%>
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
	</form>
</body>
</html>