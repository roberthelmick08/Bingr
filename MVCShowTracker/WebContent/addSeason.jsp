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
<h2>Add a season to ${tvShow.title} ...</h2>
	<div class="inputForm">
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
		
		<form action="addMoreSeasons.do" method="POST">
			<input type="submit" value="Add More Shows"/>
		</form>
	</div>
	<div>
		<ul>
			<c:forEach var="season" items="${seasons}">
				<li><form action="deleteSeason.do?id=${season.id}" method="POST">
				<h4><a href="editSeason.do?id=${season.id}"><c:out value="${season.seasonNumber} - ${season.title}"/></a>
				<button type="submit">Delete</button></h4>
				</form></li>
			</c:forEach>
		</ul>
	</div>
	
</body>
</html>