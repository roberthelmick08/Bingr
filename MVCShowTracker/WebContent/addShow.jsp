<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Show: Admin</title>
</head>
<body>

	<h2>Add or Select a Show...</h2>

	<div class="inputForm">
		<h3>Add Show:</h3>
		<form action="addShow.do" method="POST">
			<input type="text" name="title" placeholder="Show Title..." required>
			<br> 
			<input type="text" name="description" placeholder="Description..." required> 
			<br> 
			<input type="text" name="imgUrl" placeholder="Image url..."> <br>
			<input type="submit" value="Add Show">
		</form>
	</div>
	<div>
	<h3>Current Shows:</h3>
		<ul>
			<c:forEach var="tvShow" items="${tvShows}">
				<li>
				<a href="editShow.do?id=${tvShow.id}">
				<c:out value="${tvShow.title}"/>
				</a>
				<form action="deleteShow.do?id=${tvShow.id}" method="POST">
				<button type="submit">Delete</button>
				</form>
				<br>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>