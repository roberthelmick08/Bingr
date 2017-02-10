<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BinjR: Create Account</title>
</head>
<body>
	<h2>Create Account</h2>
	
	<div class="inputForm">
		<form action="addUser.do" method="POST">
			<input type="text" name="username" placeholder="Username..." required>
			<br>
			<input type="text" name="displayName" placeholder="Display name..." required>
			<br>
			<input type="password" name="password" placeholder="Password..." required>
			<br>
			<input type="password" name="passwordConfirm" placeholder="Confirm password..." required>
			<br>
			<input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>