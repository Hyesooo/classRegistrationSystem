<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<meta charset="UTF-8">
<title>수강 조회</title>
</head>
<body>
<%
	if(session_id == null){%>
	<script>
		alert("로그인이 필요합니다.");
		location.href = "login.jsp";
	</script>
	<% } 
%>
	<h1>신청한 강의 조회</h1>
	<table class="centered highlight">
	<br />
	<thead>
		<tr style="background: #c9c9ff">
			<th>과목번호</th>
			<th>과목이름</th>
			<th>학점</th>
			<th>교시</th>
			<th>요일</th>
			<th>장소</th>
			<th>수강삭제</th>
		</tr>
	</thead>
<%
	CallableStatement stmt = null;
	ResultSet myResultSet = null;
	String mySQL = "{call StudentEnrollTimetable(?,?,?,?)}";
	stmt = myConn.prepareCall(mySQL);
	stmt.setString(1, session_id); //원래는 setInt였음
	stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
	stmt.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER);
	stmt.registerOutParameter(4, oracle.jdbc.OracleTypes.NUMBER);
	stmt.execute();
	
	myResultSet = (ResultSet) stmt.getObject(2);
	
	int sumCourse = stmt.getInt(3);
	int sumUnit = stmt.getInt(4);
	
	while (myResultSet.next()) {
		String c_id = myResultSet.getString("c_id");
		int c_no = myResultSet.getInt("c_no");
		String c_name = myResultSet.getString("c_name");
		int c_credit = myResultSet.getInt("c_credit");
		int c_hour = myResultSet.getInt("c_hour");
		String c_day = myResultSet.getString("c_day");
		String c_where = myResultSet.getString("c_where");
%>
	<tbody>
		<tr>
			<td align="center"><%=c_no%></td>
			<td align="center"><%=c_name%></td>
			<td align="center"><%=c_credit%></td>
			<td align="center"><%=c_day %>요일
			<td align="center"><%=c_hour%>
			<td align="center"><%=c_where%>
			<td align="center"><a href="delete.jsp?c_id=<%=c_id%>">삭제</a></td>
			<!-- 넘겨주는 값 sql에 따라 조정 -->
		</tr>
	</tbody>
<%
}
%>	
</table>
		<h3 align="center" style="margin: 3em;">
			신청 학점 수:
			<%=sumUnit%>
			과목 수:
			<%=sumCourse%>
		</h3>
<%
	stmt.close();
	myConn.close();
%>		
			
</body>
</html>