<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@ include file="/dbconfig.jsp"%>
<%
String userID=request.getParameter("userID");
String userPassword=request.getParameter("userPassword");
int userStatus = Integer.parseInt(request.getParameter("status"));
Statement stmt;
stmt = myConn.createStatement();
String mySQL="select s_id from students where s_id='" + userID + "'and s_pwd='" + userPassword + "'";
String mySQL_admin="select a_id from administer where a_id='" + userID + "'and a_pwd='" + userPassword + "'";
String session_id = null;
ResultSet rs = null;
if(userStatus == 2){ rs = stmt.executeQuery(mySQL_admin);}
else{ rs = stmt.executeQuery(mySQL); }
if(rs.next()){
	if(userStatus == 2){session.setAttribute("admin", rs.getString("a_id")); }
	else{ session.setAttribute("student", rs.getString("s_id"));}
	response.sendRedirect("main.jsp");
}else{
	response.sendRedirect("login.jsp");
}
stmt.close();
myConn.close();
%>
</body>
</html>