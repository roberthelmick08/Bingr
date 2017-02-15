<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Track New Show</title>
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


	<div class="mainFlexBox">
		<form action="trackNewShows.do">
			<c:forEach items="${allTVShows}" var="tvShow">
				<div class="tvShowBox">
					<div class="checkbox">
					<c:choose>
						    <c:when test="${UserEpisode.watched=='1'}">
									<label class="checkbox-inline no_indent"> <input
									type='checkbox' checked name='tvShowIds' value='${tvShow.id}'>
									<label for="tvShow">${tvShow.title}</label>				    
								</c:when>    
							    <c:otherwise>
								    <label class="checkbox-inline no_indent"> <input
									type='checkbox' name='tvShowIds' value='${tvShow.id}'>
									<label for="tvShow">${tvShow.title}</label>
						    </c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:forEach>
			<input type="hidden" name="userId" value="${user.id}">
			<input type="submit" value="Track Shows">
		</form>
	</div>
</body>
</html>