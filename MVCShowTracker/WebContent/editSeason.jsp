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
<h2>Edit season ${season.seasonNumber} - ${season.title} from ${tvShow.title} ...</h2>
	<div class="inputForm">
		<form action="updateSeason.do" method="POST">
			<input type="text" name="seasonNumber" value="${season.seasonNumber}" required>
			<br>
			<input type="text" name="title" value="${season.title}" required>
			<br>
			<input type="text" name="description" value="${season.description}" required>
			<br>
			<input type="text" name="imgUrl" value="${season.imgUrl}">
			<br>
			<input type="hidden" name="seasonId" value="${season.id}">
			<input type="submit" value="Update Season">
		</form>
	</div>
	<div>
		<ul>
			<c:forEach var="season" items="${seasons}">
				<li>
				<a href="editSeason.do?id=${season.id}"><c:out value="${season.seasonNumber} - ${season.title}"/></a>
				<form action="editSeason.do?id=${season.id}" method="POST">
				<button type="submit">Edit Info</button>
				</form>
				<form action="deleteSeason.do?id=${season.id}" method="POST">
				<button type="submit">Delete</button>
				</form>
				</li>
			</c:forEach>
		</ul>
	</div>
	
</body>
</html>