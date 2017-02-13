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

<h2><c:out value="Edit Episode ${episode.title} from ${show.title} ${season.title}..."/></h2>

	<div class="inputForm">
		<form action="updateEpisode.do" method="POST">
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
			<input type="submit" value="Add Episode">
		</form>
	</div>
	<div>
		<ul>
			<c:forEach var="episode" items="${episodes}">
				<li><form action="deleteEpisode.do?id=${episode.id}" method="POST">
				<h4><a href="editEpisode.do?id=${episode.id}"><c:out value="${episode.episodeNumber} - ${episode.title}"/></a>
				<button type="submit">Delete</button></h4>
				<input type="hidden" name="seasonId" value="${season.id}">
				</form></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>