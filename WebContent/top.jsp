<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String student_id = (String) session.getAttribute("student");
	String admin_id = (String) session.getAttribute("admin");
	String session_id =null;
	String log;
	
	if (student_id == null && admin_id == null)
		log = "<a href=login.jsp>로그인</a>";
	else log = "<a href=logout.jsp>로그아웃</a>";%>
<%	
	if(admin_id == null){
		session_id = student_id;
	%>	
		<table width="75%" align="center" bgcolor="#FFFF99" border>
		<tr>
		<td align="center"><b><%=log%></b></td>
		<td align="center"><b><a href="update.jsp">사용자 정보 수정</b></td>
		<td align="center"><b><a href="insert.jsp">수강신청 입력</b></td>
		<td align="center"><b><a href="check.jsp">수강신청 조회</b></td>
		</tr>
		</table>
	<%}
	else{
		session_id = admin_id;
%>
		<table width="75%" align="center" bgcolor="#FFFF99" border>
		<tr>
		<td align="center"><b><%=log%></b></td>
		<td align="center"><b><a href="admin_insert.jsp">수업 등록</b></td>
		<td align="center"><b><a href="admin_check.jsp">등록한 수업 조회</b></td>
		</tr>
		</table>
	<%}
%>
</body>
</html>