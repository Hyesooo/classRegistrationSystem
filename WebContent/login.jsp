<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 시스템 로그인 </title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="User Register Form Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //for-mobile-apps -->
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300italic,300,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Amaranth:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href="css/login.css" rel="stylesheet" type="text/css" media="all" />


</head>
<body>

<table width="75%" align="center" bgcolor="#FFFF99" border>
<tr> <td><div align="center">아이디와 패스워드를 입력하세요 </div></td></table>
<table width="75%" align="center" border>
<form method="post" action="login_verify.jsp">
<tr>
	<td><div align="center">신분</div></td>
	<td><input type="radio" name="status" value=1>학생<input type="radio" name="status" value=2>관리자</td>
</tr>
<tr>
<td><div align="center">아이디</div></td>
<td><div align="center">
<input type="text" name="userID">
</div></td>
</tr>
<tr>
<td><div align="center">패스워드</div></td>
<td><div align="center">
<input type="password" name="userPassword">
</div></td></tr>
<tr>
<td colspan=2><div align="center">
<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인"> <INPUT
TYPE="RESET" VALUE="취소">
</div></td></tr>
</form>
</table>


   <div class="content">
		
		<div class="main">
			<h2>Please Sign in!</h2>
			
			<form>
			     
			        <input class="with-gap" name="group1" type="radio"  />
			        <span>학생</span>
			      
			        <input class="with-gap" name="group1" type="radio"  />
			        <span>관리자</span>
			      <br>
			      <br>
				<h5>Username</h5>
				<input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
				<h5>Password</h5>
				<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
				<input type="submit" value="Create Account">
			</form>
		</div>
		
	</div>


</body>
</html>