<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
</head>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<body>
<%
String sMessage = null;
try {
   PreparedStatement p_stmt = null; 
   String newPass = request.getParameter("s_pwd");
   String s_id = request.getParameter("s_id");
   
   String sql = "UPDATE students set s_pwd=? where s_id =?";
   p_stmt = myConn.prepareStatement(sql);
   p_stmt.setString(1, newPass);
   p_stmt.setString(2, s_id);
   p_stmt.executeUpdate();
} catch(SQLException ex) {
	if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
	else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	else sMessage = Integer.toString(ex.getErrorCode());
	%>
	<script>
    alert("<%= sMessage %>");
 	</script>
 	<%
 	pageContext.forward("update.jsp");
	}
pageContext.forward("main.jsp");
%>
</body>
</html>