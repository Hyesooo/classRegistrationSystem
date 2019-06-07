<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="top.jsp"%>
<meta charset="UTF-8">
<title>관리자 수업 등록</title>
</head>
<body>
<%
   if (session_id == null)
      response.sendRedirect("login.jsp");
   else {
	   String a_id = (String)session.getAttribute("admin");
%>
	<h1>
		<span id="gg">수업 생성</span>
	</h1>
	<center>
	<form method="post" action="admin_insert_verify.jsp">
		<input type="hidden" name="a_id"  value="<%=a_id%>">
		<table width="75%" align="center" border>
			<tr>
				<td colspan="2">
					<div align="center">
						<h2>강의 추가</h2>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">강의 번호</div>
				</td>
				<td>
					<div align="center">
						<input type="text" name="c_no">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">강의 분반 번호</div>
				</td>
				<td>
					<div align="center">
						<input type="text" name="c_div">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">강의 명</div>
				</td>
				<td>
					<div align="center">
						<input type="text" name="c_name">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">학점</div>
				</td>
				<td>
					<div align="center">
						<input type="text" name="c_credit">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">최대 수강 인원</div>
				</td>
				<td>
					<div align="center">
						<input type="text" name="c_maxppl">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">수업 요일</div>
				</td>
				<td>
					<div align="center">
						<select name="c_day">
							<option value="">요일 선택</option>
							<option value="월">월</option>
							<option value="화">화</option>
							<option value="수">수</option>
							<option value="목">목</option>
							<option value="금">금</option>
						</select>
					</div>
			</tr>
			<tr>
				<td>
					<div align="center">수업 시간</div>
				</td>
				<td>
					<div align="center">
						<select name="c_hour">
							<option value="">시간 선택</option>
							<option value="1">1교시 9:00-10:30</option>
							<option value="2">2교시 10:30-12:00</option>
							<option value="3">3교시 12:00-13:30</option>
							<option value="4">4교시 13:30-15:00</option>
							<option value="5">5교시 15:00-16:30</option>
							<option value="6">6교시 16:30-18:00</option>
							<option value="7">7교시 18:00-19:30</option>
							<option value="8">8교시 19:30-21:00</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">수업 장소</div>
				</td>
				<td>
					<div align="center">
						<input type="text" name="c_where">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<div align="center">
						<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="추가"> <INPUT TYPE="RESET" VALUE="취소">
					</div>
				</td>
			</tr>
		</table>
	</form>
	</center>
<%
//학기, 연도, maxppl넘겨주기
   }
%>
</body>
</html>