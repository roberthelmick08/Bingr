<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user.username}'s profile</title>
</head>
<body>
	<div class="navBar">
		<h2>Hi ${user.username}!</p>
		
		<select name="group">
			<option value="" selected>Manage Group</option>

			<!-- Add iterable to loop over group -->
<%-- 			<c:forEach var="group" item="${groups}"><option value="name"><a href="manageGroup.do">${group.name}</a></option></c:forEach>
 --%>		</select>
		
	</div>

	<!-- add forEach loop to iterate over groups -->
	<div class="mainFlexBox">
		<!-- Add conditional statement: if group.name -->
		<div class="groupBox">
			<h4>${user.username}</h4>
			<br>
			<img src="${user.imgUrl}" class=/>
		<c:forEach items="${user.tvShows}" var="tvShow">
		<div class="showBox">
			<h4>${tvShow.title}</h4>
			<br>
			<c:forEach items="${tvShow.seasons}" var="season">
			
			<div class="episodeBox">
				<h5>S${season.seasonNumber}, E${episode.episodeNumber}</h5>
			</div>
			</c:forEach>
		</div>
		</c:forEach>
		</div>
	</div>
	
</body>
</html>
