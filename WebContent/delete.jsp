<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 삭제</title>
</head>
<body>
<%
	Statement stmt = null;
	String mySQL = null;	

	String c_id = request.getParameter("c_id");

	stmt = myConn.createStatement();
	mySQL = "delete from enroll where c_id='" + c_id + "' and s_id= '" + session_id + "'";
	
	int result = stmt.executeUpdate(mySQL);
	if (result != 0) {
	%>
	<script>
		alert("삭제되었습니다..");
		location.href = "check.jsp";
	</script>
	<% } else { %>
	<script>
		alert("오류..");
		location.href = "select.jsp";
	</script>
	<%
	}
	stmt.close();
	myConn.close();
%>
</body>
</html>