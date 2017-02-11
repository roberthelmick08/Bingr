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
			<c:forEach var="group" item="${groups}"><option value="name"><a href="manageGroup.do">${group.name}</a></option></c:forEach>
		</select>
		
		<select>
			<option value="">Manage Stores</option>
		</select>
	</div>

<h2>Add a season to ${tvshow.title} ...</h2>


	<!-- add forEach loop to iterate over groups -->
	<div class="mainFlexBox">
		
		<div class="groupBox">
			<h4>${user.username}</h4>
			<br>
			<img src="${user.imgUrl}" class=/>
		</div>
		<!-- add forEach loop to iterate through favorited shows -->
		<div class="showBox">
			<h4>${tvshow.title}</h4>
			<br>
			<!-- add forEach loop to iterate through watched/unwatched episodes -->
			<div>
				
			</div>
		</div>
	</div>
	
</body>
</html>