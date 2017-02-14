<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user.username}'s&nbspProfile</title>
</head>
<body>
	<div class="navBar">
		<div class="companyName"><h1>BingerSync</h1></div>
		<div class="welcomeHeader"><h2>Welcome, ${user.username}!</h2></div>
		
		<select class="dropdown" name="manageGroup">
			<option value="" selected>Manage Group</option>
			<option value="addGroup.do">Add Group</option>
			<option value="editGroup.do">Edit Group</option>
			<!-- Add iterable to loop over group -->
<%-- <c:forEach var="group" item="${groups}"><option value="name"><a href="manageGroup.do">${group.name}</a></option></c:forEach>--%>
		</select>

	</div>

	<!-- add forEach loop to iterate over groups -->
	<div class="mainFlexBox">
		<!-- Add conditional statement: if group.name -->
		<div class="groupBox">
			<div class="groupNameBox">
				<h1>${user.username}</h1>
			</div>
<!--<img src="${user.imgUrl}" class= /> -->
		</div>

		<c:forEach items="${user.tvShows}" var="tvShow">
			<div class="showBox">
				<h1>${tvShow.title}</h1>

				<c:forEach items="${tvShow.seasons}" var="season">
					<div class="seasonTitle">
						<h2 id="seasonTitle">${season.title}</h2>
					</div>
					<div class="episodeBox">
						<form action="watchEpisode.do">
							<c:forEach items="${season.episodes}" var="episode">
								<div class="checkbox-wrapper">

									<div class="checkbox">
										<label class="checkbox-inline no_indent"> 
						<c:choose>
						    <c:when test="${UserEpisode.watched=='1'}">
						        <input type='checkbox' name='${episode.episodeNumber}' value='${episode.id}' checked> 
						        <label for="episode">${episode.title}</label>
						    </c:when>    
						    <c:otherwise>
						               <input type='checkbox' name='${episode.episodeNumber}' value='${episode.id}'> 
						        <label for="episode">${episode.title}</label> 
						    </c:otherwise>
						</c:choose>										
										<input type="hidden" value="${season.seasonNumber}">
									</div>
								</div>
							</c:forEach>
							<input type="submit" value="Mark as 'Watched'">
						</form>
					</div>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
</body>
</html>
