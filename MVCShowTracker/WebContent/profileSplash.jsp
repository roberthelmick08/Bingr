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
<h2>Add a season to ${show.title} ...</h2>
	<div class="navBar">
		<div class="profileThumbnail">
		<img src="${user.imgUrl}"/>
		<p>Hi ${user.username}!</p>
		</div>

		<select name="group">
			<option value="" selected>Manage Group</option>
			
			<!-- Add iterable to loop over group -->
			<c:forEach var="group" item="${groups}"><option value="name"><a href="manageGroup.do">${group.name}</a></option></c:forEach>
		</select>
		<select>
			<option value="">Manage Stores</option>
		</select>
	</div>

	<div class="mainFlexBox">
		
	</div>
</body>
</html>