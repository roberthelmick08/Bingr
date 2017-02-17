<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Season</title>
</head>
<body>
	<form action="shows.do" method="POST">
		<button type="submit">Back to Shows</button>
	</form>
	<form action="editShow.do?id=${tvShow.id}" method="POST">
		<button type="submit">Back to Seasons</button>
	</form>
	<hr><hr>
	<div class="inputForm">
		<h2><c:out value="Edit season ${season.seasonNumber} - ${season.title} from ${tvShow.title}:"/></h2>
		<form action="updateSeason.do?id=${season.id}" method="POST">
			Season Number: <input type="text" name="seasonNumber" value="${season.seasonNumber}" required>
			<br>
			Season Title: <input type="text" name="title" value="${season.title}" required>
			<br>
			Description: <textarea rows="3" cols="75" name="description" required>${season.description}</textarea>
			<br>
			Img Url: <input type="text" name="imgUrl" value="${season.imgUrl}">
			<br>
			<input type="hidden" name="seasonId" value="${season.id}">
			<input type="submit" value="Update Season">
		</form>
	</div>
	<hr><hr>
	<div class="inputForm">
		<h2>Add an Episode to ${season.seasonNumber} - ${season.title} from ${tvShow.title}:</h2>
		<form action="addEpisode.do" method="POST">
			<input type="text" name="episodeNumber" placeholder="Episode Number..." required>
			<br>
			<input type="text" name="title" placeholder="Episode Title..." required>
			<br>
			<textarea rows="3" cols="75" name="description" placeholder="Description..." required></textarea>
			<br>
			<input type="text" name="imgUrl" placeholder="Image url...">
			<br>
			<input type="hidden" name="seasonId" value="${season.id}">
			<input type="submit" value="Add Episode">
		</form>
	</div>
	<hr><hr>
	<div>
		<h3>Edit Episodes from ${tvShow.title} - Season ${season.seasonNumber} - ${season.title}:</h3>
		<ul>
			<c:forEach var="episode" items="${episodes}">
				<li>
				<a href="editEpisode.do?id=${episode.id}">
				<c:out value="${episode.episodeNumber} - ${episode.title}"/>
				</a>
				<form action="deleteEpisode.do?id=${episode.id}" method="POST">
				<button type="submit">Delete</button>
				<input type="hidden" name="seasonId" value="${season.id}">
				</form>
				</li>
				<hr>
			</c:forEach>
		</ul>
	</div>
</body>
</html>