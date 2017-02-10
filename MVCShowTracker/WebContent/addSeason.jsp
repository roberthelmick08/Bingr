<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Season</title>
</head>
<body>
<h2>Add a season to ${show.title} ...</h2>
	<div class="inputForm">
		<form action="addSeason.do" method="POST">
			<input type="text" name="title" placeholder="Show Title..." required>
			<br>
			<input type="text" name="description" placeholder="Description..." required>
			<br>
			<input type="text" name="img" placeholder="Image url...">
			<br>
			<input type="hidden" name="id" value="${season.id}">
			<input type="submit" value="Add Show">
		</form>
		
		<form action="addMoreSeasons.do" method="POST">
			<input type="submit" value="Add More Shows"/>
		</form>
	</div>
	
	
</body>
</html>