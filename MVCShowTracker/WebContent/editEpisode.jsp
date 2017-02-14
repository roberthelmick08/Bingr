<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Episode</title>
</head>
<body>
	<form action="shows.do" method="POST">
		<button type="submit">Back to Shows</button>
	</form>
	<form action="editShow.do?id=${tvShow.id}" method="POST">
		<button type="submit">Back to Seasons</button>
	</form>
	<form action="editSeason.do?id=${season.id}" method="POST">
		<button type="submit">Back to Episodes</button>
	</form>
	<div class="inputForm">
		<h2><c:out value="Edit Episode ${episode.title} from ${tvShow.title} ${season.title} :"/></h2>
		<form action="updateEpisode.do?id=${episode.id}" method="POST">
			<input type="text" name="episodeNumber" value="${episode.episodeNumber}" required>
			<br>
			<input type="text" name="title" value="${episode.title}" required>
			<br>
			<input type="text" name="description" value="${episode.description}" required>
			<br>
			<input type="text" name="imgUrl" value="${episode.imgUrl}">
			<br>
			<input type="hidden" name="episodeId" value="${episode.id}">
			<input type="hidden" name="seasonId" value="${season.id}">
			<input type="submit" value="Update Episode">
		</form>
	</div>
</body>
</html>