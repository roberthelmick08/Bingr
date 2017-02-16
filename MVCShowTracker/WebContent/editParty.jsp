<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage&nbsp${user.displayName}'s&nbspGroups</title>
</head>
<body>
<div class="navBar">
		<ul>
      		<a href="goHome.do"><h1>BingeSync</h1></a>
			<a href="logOut.do"><li>Log Out</li></a>
			<a href="trackShow.do"><li>Track New Show</li></a>
			<a href="addParty.jsp"><li>Add Group</li></a>
		</ul>
	</div>
		<!-- add forEach loop to iterate over groups -->
		<div class="mainFlexBox">
			<!-- Add conditional statement: if group.name -->
			<div class="groupBox">
				<div class="groupNameBox">
					<a href="profileSplash.jsp"><h1>${user.username}'s</a> Current Groups</h1>
				</div>
				<!--<img src="${user.imgUrl}" class= /> -->

			
			<c:forEach items="${user.parties}" var="party">
				<div class="showBox">
					<h3>${party.name}</h3>
					<c:forEach items="${party.tvShows}" var="tvShow">
						<h5>${tvShow.title}</h5>
						<form action="leaveParty.do">
							<input type="hidden" name="partyId" value="${party.id}"/>
							<input type="submit" value="Leave"/>
						</form>
					</c:forEach>
				</div>
			</c:forEach>
			</div>
			<div class="groupBox">
				<div class="groupTitleBox">
					<h1>Groups to join</h1>
				</div>
				<c:forEach items="${nonUserParties}" var="party">
				<div class="showBox">
					<h3>${party.name}</h3>
						<form action="addUsersToParty.do">
							<input type="hidden" name="partyId" value="${party.id}"/>
							<input type="hidden" name="userId" value="${user.id}"/>
							<input type="submit" value="Join"/>
						</form>
					<c:forEach items="${party.users}" var="user">
						<h5>${user.displayName}</h5>
					</c:forEach>
					<c:forEach items="${party.tvShows}" var="tvShow">
						<h5>${tvShow.title}</h5>
					</c:forEach>
				</div>
			</c:forEach>
			</div>
		</div>
</body>
</html>
