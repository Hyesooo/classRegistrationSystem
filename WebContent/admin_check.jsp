Skip to content
 
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@siyeons 
0
0 0 Hyesooo/classRegistrationSystem
 Code  Issues 0  Pull requests 0  Projects 0  Wiki  Security  Insights
classRegistrationSystem/WebContent/admin_check.jsp
@siyeons siyeons firstCommit
b46f0e0 3 days ago
79 lines (75 sloc)  2.11 KB
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수업 조회</title>
</head>
<body>
<%
   if (session_id == null)
      response.sendRedirect("login.jsp");
%>
	<h1>
		<span>수업 시간표</span>
	</h1>
	<center>
	<table width="80%" align="center" border>
		<br />
		<tr bgcolor="#F361A6">
			<th>과목번호</th>
			<th>분반</th>
			<th>과목명</th>
			<th>학점</th>
			<th>요일</th>
			<th>교시</th>
			<th>장소</th>
			<th>정원</th>
			<th>수업 삭제</th>
		</tr>
<%
		Statement stmt= null;
		ResultSet myResultSet= null; 
		String mySQL= "";
		
		stmt = myConn.createStatement();
		//mySQL 수정하기
		mySQL= "select c_id,c_no, c_div, c_name,c_credit, c_hour, c_day, c_maxppl, c_where from class where a_id ='" + session_id+ "'";
		myResultSet= stmt.executeQuery(mySQL);
				
        if (myResultSet != null) {
           while (myResultSet.next()) {
              String c_id = myResultSet.getString("c_id");
              int c_no = myResultSet.getInt("c_no");
              String c_name = myResultSet.getString("c_name");
              int c_div = myResultSet.getInt("c_div");
              int c_credit = myResultSet.getInt("c_credit");
              String c_day = myResultSet.getString("c_day");
              int c_hour = myResultSet.getInt("c_hour");
              String c_where = myResultSet.getString("c_where");
              int c_maxppl = myResultSet.getInt("c_maxppl");
 %>
				<tr>
					<td align="center"><%=c_no%></td>
					<td align="center"><%=c_div%></td>
					<td align="center"><%=c_name%></td>
					<td align="center"><%=c_credit%></td>
					<td align="center"><%=c_day%>요일</td>
					<td align="center"><%=c_hour%></td>
					<td align="center"><%=c_where %></td>
					<td align="center"><%=c_maxppl%></td>
					<td align="center"><a
						href="admin_delete.jsp?c_id=<%=c_id%>">삭제</a></td>
				</tr>
<%
              }
	 }
	 stmt.close();
	 myConn.close();
%>
	</table>
	</center>
</body>
</html>

