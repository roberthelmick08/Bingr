<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Show: Admin</title>
</head>
<body>

	<h2>Edit or Select another Show...</h2>

	<div class="inputForm">
		<form action="updateShow.do" method="POST">
			<input type="text" name="title" value="${tvShow.title}" required>
			<br>
			<input type="text" name="description" value="${tvShow.description}" required> 
			<br> 
			<input type="text" name="imgUrl" value="${tvShow.imgUrl}"> 
			<br>
			<input type="hidden" value="${tvShow.id}">
			<input type="submit" value="Update Show">
		</form>
	</div>
	<div>
		<ul>
			<c:forEach var="tvShow" items="${tvShows}">
				<li>
				<a href="editShow.do?id=${tvShow.id}"><c:out value="${tvShow.title}"/></a>
				<form action="editShow.do?id=${tvShow.id}" method="POST">
				<button type="submit">Edit Info</button>
				</form>
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