<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
String dbdriver = "oracle.jdbc.driver.OracleDriver";
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "db"; //아이디
String passwd = "ss2"; //비밀번호
Connection myConn;

Class.forName(dbdriver);
myConn=DriverManager.getConnection(dburl, user, passwd);
%>

</body>
</html>