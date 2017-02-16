<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BingeSync</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="login-clean">
        <div class="row">
            <div class="col-md-5"></div>
            <div class="col-md-7">
                <form action="login.do" method="get">
                    <h2 class="sr-only">Login Form</h2>
                    <div class="illustration"><i class="fa fa-tv"></i></div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="username" required="" placeholder="Username" autofocus="">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="password" required="" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-block" type="submit">Log In</button>
                    </div>
                    <a href="addUser.jsp" class="forgot">
                        <button class="btn btn-primary btn-block" type="button">Add User</button>
                    </a>
                    <c:if test="${noUser}"><h4>Username and password combination does not exist</h4></c:if>
                </form>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>