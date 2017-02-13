<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Show</title>
</head>
<body>
	<form action="shows.do" method="POST">
		<button type="submit">Back to Shows</button>
	</form>
	<div class="inputForm">
		<h2>Edit Show Info: ${tvShow.title}</h2>
		<form action="updateShow.do?id=${tvShow.id}" method="POST">
			Title: <input type="text" name="title" value="${tvShow.title}" required>
			<br>
			Description: <input type="text" name="description" value="${tvShow.description}" required> 
			<br> 
			Image Url: <input type="text" name="imgUrl" value="${tvShow.imgUrl}"> 
			<br>
			<input type="hidden" value="${tvShow.id}">
			<input type="submit" value="Update Show">
		</form>
	</div>
	<hr>
	<div class="inputForm">
		<h2>Add Season to: ${tvShow.title}</h2>
		<form action="addSeason.do" method="POST">
			<input type="text" name="seasonNumber" placeholder="Season Number..." required>
			<br>
			<input type="text" name="title" placeholder="Season Title..." required>
			<br>
			<input type="text" name="description" placeholder="Description..." required>
			<br>
			<input type="text" name="imgUrl" placeholder="Image url...">
			<br>
			<input type="hidden" name="tvShowId" value="${tvShow.id}">
			<input type="submit" value="Add Season">
		</form>
	</div>
	<hr><hr>
	<div>
	<h3>Edit Show Seasons: ${tvShow.title}</h3>
		<ul>
			<c:forEach var="season" items="${seasons}">
				<li>
				<a href="editSeason.do?id=${season.id}">
				<c:out value="${season.seasonNumber} - ${season.title}"/>
				</a>
				<form action="deleteSeason.do?id=${season.id}" method="POST">
				<input type="hidden" name="tvShowId" value="${tvShow.id}">
				<button type="submit">Delete</button>
				</form>
				</li>
			</c:forEach>
		</ul>
	</div>
	
</body>
</html>