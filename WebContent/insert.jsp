<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<title>Insert</title>
</head>
<body>
<%
	if(session_id == null){ %>
	<script>
		alert("로그인 후 사용하세요.");
		location.href = "login.jsp";
	</script>
<% } %>	
<%
	Statement stmt= null;
	ResultSet myResultSet= null; 
	String mySQL= "";
	CallableStatement yearStmt = null;
	CallableStatement semStmt = null;
	
	yearStmt = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
	yearStmt.registerOutParameter(1, java.sql.Types.INTEGER);
	yearStmt.execute();
	int sem = yearStmt.getInt(1); //수강신청학기
	
	semStmt = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
	semStmt.registerOutParameter(1, java.sql.Types.INTEGER);
	semStmt.execute();
	int year = semStmt.getInt(1);//수강신청연도
%>
	<p align="center"><%=year %>년도 <%= sem%>학기 수강신청</p>

	<table width="75%" align="center" border>
	<br>
	<tr><th>과목번호</th><th>분반</th><th>과목명</th><th>학점</th>
	<th>요일</th><th>교시</th><th>장소</th><th>정원</th>
	<th>수강신청</th></tr>
		
<%
	stmt = myConn.createStatement();
	mySQL= "select * from class where c_id not in (select c_id from enroll where s_id='" + session_id+ "')";
	myResultSet= stmt.executeQuery(mySQL);
	
	if (myResultSet!= null){
		while (myResultSet.next()){
			String c_id= myResultSet.getString("c_id");
			int c_no= myResultSet.getInt("c_no");
			String c_name= myResultSet.getString("c_name");
			int c_div = myResultSet.getInt("c_div");
			int c_credit= myResultSet.getInt("c_credit");
			int c_hour = myResultSet.getInt("c_hour");
			String c_day = myResultSet.getString("c_day");
			int c_maxppl = myResultSet.getInt("c_maxppl");
			String c_where  = myResultSet.getString("c_where");
%>
	<tr>
	<td align="center"><%= c_no%></td> <td align="center"><%= c_div%></td>
	<td align="center"><%= c_name%></td><td align="center"><%= c_credit%></td>
	<td align="center"><%= c_day%></td><td align="center"><%= c_hour%></td>
	<td align="center"><%= c_where%></td><td align="center"><%= c_maxppl%></td>
	<td align="center"><a href="insert_verify.jsp?c_id=<%= c_id%>&c_no=<%= c_no%>&c_div=<%= c_div%>">신청</a></td>
	</tr>
<%
		}
	}
	yearStmt.close();
	semStmt.close();
	stmt.close();
	myConn.close();
%>
</table>
</body>
</html>