<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<meta charset="UTF-8">
<title>관리자 수업 등록 확인</title>
</head>
<body>
<%
	CallableStatement yearStmt = null;
	CallableStatement semStmt = null;
	yearStmt = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
	yearStmt.registerOutParameter(1, java.sql.Types.INTEGER);
	yearStmt.execute();
	int c_sem = yearStmt.getInt(1); //수강신청학기
	
	semStmt = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
	semStmt.registerOutParameter(1, java.sql.Types.INTEGER);
	semStmt.execute();
	int c_year = semStmt.getInt(1);//수강신청연도

	//int c_id
	int c_no = Integer.parseInt(request.getParameter("c_no"));
	String c_name = request.getParameter("c_name");
	int c_div = Integer.parseInt(request.getParameter("c_div"));
	int c_credit = Integer.parseInt(request.getParameter("c_credit"));
	int c_hour = Integer.parseInt(request.getParameter("c_hour"));
	String c_day = request.getParameter("c_day");
	int c_maxppl = Integer.parseInt(request.getParameter("c_max"));
	String c_where = request.getParameter("c_where");
	String a_id = request.getParameter("a_id");
	
	String result = null;
	CallableStatement stmt = null;
	try {
	stmt = myConn.prepareCall("call InsertClass(?,?,?,?,?,?,?,?,?,?,?,?)");
	//stmt.setInt(1,c_id);
	stmt.setInt(2, c_no);
	stmt.setString(3, c_name);
	stmt.setInt(4, c_div);
	stmt.setInt(5, c_credit);
	stmt.setInt(6, c_hour);
	stmt.setString(7, c_day);
	stmt.setInt(8, c_year);
	stmt.setInt(9, c_sem);
	stmt.setInt(10, c_maxppl);
	stmt.setString(11, c_where);
	stmt.setString(12, a_id);
	stmt.registerOutParameter(13, oracle.jdbc.OracleTypes.VARCHAR);
	stmt.execute();
	result = stmt.getString(13);
%>
	<script>
	alert("<%= result %>");
	history.back();
	</script>
<%
	} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
	} finally {
		if (stmt != null)
		try {
			myConn.commit();
			stmt.close();
			myConn.close();
			yearStmt.close();
			semStmt.close();
		} catch (SQLException ex) {}
	}
%>
</body>
</html>