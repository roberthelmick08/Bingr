<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BinjR login</title>
</head>
<body>
	<h1>BinjR</h1>
	<h2>Login</h2>
	
	<div class="inputForm">
		<form action="login.do" method="POST">
		<input type="text" name="username" placeholder="Username..." required>
		<br>
		<input type="password" name="password" placeholder="Password..." required>
		<input type="submit" value="Login">
		</form>
		
		<form action="addUser.jsp">
		<input type="submit" value="Add New User">
		</form>
	</div>
	
	<c:if test="${noUser}"><h4>Username and password combination does not exist</h4></c:if>
	
</body>
</html>