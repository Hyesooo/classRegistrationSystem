<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/common_style.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
</head>
<body>
<%@include file="top.jsp"%>
	
<br>
	<div class="s_section1">
		<div class="row">
			<div class="col s12 l5"> 
	    		<div class="s_container1">     	   	 
	    			<p class="light">Welcome! This is a Class Registration System of Sookmyung Women's University</p>    
				    
				    	<% if (session_id != null) { %>
        					<a href="insert.jsp" id="button" class="btn-large waves-effect waves-light orange">Registration</a>
				     	<% } else { %>
				      	    <a href="login.jsp" id="button" class="btn-large waves-effect waves-light orange">Login</a>
				    	<% } %>
				</div>		
			</div>
			<br>
			<br>
			<div class="col s12 l7">
				<div class="s-container2">
					<img src="http://www.sookmyung.ac.kr/dext5editordata/2017/08/20170811_150636093_97714.jpg" class="img-fluid" width="550" height="370"></a>
				</div>
			</div>
		</div>
	</div>
	

<script>
 

 
</script>


</body>
</html>


