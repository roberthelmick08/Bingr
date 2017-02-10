<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Episode</title>
</head>
<body>

<h2>Add an Episode to ${show.title} ${season.title}...</h2>

	<div class="inputForm">
		<form action="addEpisode.do" method="POST">
			<input type="text" name="title" placeholder="Show Title..." required>
			<br>
			<input type="text" name="description" placeholder="Description..." required>
			<br>
			<input type="text" name="img" placeholder="Image url...">
			<br>
			<input type="hidden" name="id" value="${season.id}">
			<input type="submit" value="Add Episode">
		</form>
		<!-- Need to pass in show id and season id -->
		<form action="addMoreEpisodes.do" method="POST">
			<input type="submit" value="Add More Episodes">
		</form>
	</div>
</body>
</html>