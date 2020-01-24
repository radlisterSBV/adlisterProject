<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
    <style>
        body {
            background-image: url("../img/mountainsDark.jpeg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position-y: bottom;
            height: 100%;
        }
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="form-container">
    <div class="container card mt-5 form-bg">
        <form action="/login" method="POST">
            <h1 class="display-4 login-header">Log In</h1>

            <c:if test="${param.error != null}">
                <div class="card w-100 error">
                    <div class="card-body text-danger">
                        Username or password incorrect. Please try again.
                    </div>
                </div>

            </c:if>
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
            <button type="submit" class="btn btn-primary btn-block w-25" value="Log In"> Log In</button>

        </form>

    </div>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp"/>


</body>
</html>
