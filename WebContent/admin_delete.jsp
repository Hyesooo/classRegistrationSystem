<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수업 삭제</title>
</head>
<body>
<%
	String c_id = request.getParameter("c_id");
	Statement stmt = null;
	stmt = myConn.createStatement();
	try {
	String mySQL = null;
	mySQL = "delete from class where c_id='" + c_id +"'";
	int result = stmt.executeUpdate(mySQL);
	if (result != 0) { %>
	<script>
		alert("선택한 과목이 삭제되었습니다.");
		location.href = "admin_check.jsp";
	</script>
<%  }
	} catch (SQLException ex) {
%>
	<script>
		alert("수강중인 학생이 있으므로 삭제 할 수 없습니다.");
		history.back();
	</script>
<%
	} finally {
		stmt.close();
		myConn.close();
	}
%>
</body>
</html>