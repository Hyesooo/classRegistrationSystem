<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="dbconfig.jsp"%>
<%@ include file="top.jsp" %>
<title>Insert_verify</title>
</head>
<body>
<%
	String s_id = session_id;
	int c_id = Integer.parseInt(request.getParameter("c_id"));
	int c_no = Integer.parseInt(request.getParameter("c_no"));
	int c_div = Integer.parseInt(request.getParameter("c_div"));
%>
<%
	String result = null;
	CallableStatement cstmt = myConn.prepareCall("{call InsertEnroll(?,?,?,?,?)}");
	cstmt.setString(1, s_id);
	cstmt.setInt(2, c_id);
	cstmt.setInt(3, c_no);
	cstmt.setInt(4, c_div);
	cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
	try {
	cstmt.execute();
	result = cstmt.getString(5);
%>
	<script>
		alert("<%= result %>");
		location.href = "insert.jsp";
	</script>
<%
	} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
	} finally {
		if (cstmt != null){
			try{
				myConn.commit();
				cstmt.close();
				myConn.close();
			}catch (SQLException ex) {}
		}
	}
%>
</body>
</html>