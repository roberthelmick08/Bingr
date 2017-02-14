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
		<ul>
      		<a href="goHome.do"><h1>BingeSync</h1></a>
			<a href="trackShow.do"><li>Track New Show</li></a>
			<a href="addGroup.do"><li>Add Group</li></a>
			<a href="editGroup.do"><li>Edit Group</li></a>
		</ul>
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
								<c:forEach items="${season.episodes}" var="episode">
							<form action="watchEpisode.do">
									<div class="checkbox-wrapper">
										<div class="checkbox">
											<label class="checkbox-inline no_indent"> 
											<input type="hidden" name="episodeId" value="${episode.id}"> 
											<c:choose>
												<c:when test="${user.userEpisodes[episode.id].watched=='1'}">
													<input type="hidden" name="watched" value="0"> 
													<input type='checkbox' name='check' value='${episode.id}' checked>
													<label for="episode">${episode.title}</label>
												</c:when>
												<c:otherwise>
													<input type='checkbox' name='check' value='${episode.id}'>
													<label for="episode">${episode.title}</label>
													<input type="hidden" name="watched" value="1"> 
												</c:otherwise>
											</c:choose>
											<input type="hidden" value="${season.seasonNumber}">
										</div>
									</div>
								<input type="hidden" name="userId" value="${user.id}"> 
								<input type="submit" value="Mark as 'Watched'">
							</form>
								</c:forEach>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
</body>
</html>
