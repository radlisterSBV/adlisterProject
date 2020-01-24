<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
    <style>
        body {
            background-image: url("../img/snow-capped-mountains-under-the-cloudy-skies-1054289.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<div class="d-flex justify-content-center">
<div class="container my-5 text-center container-card-container w-25">
    <form action="/register" method="post">
        <h1>Please fill in your information.</h1>
        <label for="username">Username</label>
        <c:if test="${param.errorUsernameEmpty != null}">
            <div class="card w-100 error">
                <div class="card-body text-danger">
                    Please enter a username
                </div>
            </div>
        </c:if>
        <c:if test="${param.errorUsernameExists != null}">
            <div class="card w-100 error">
                <div class="card-body text-danger">
                    Username already exists
                </div>
            </div>
        </c:if>
        <input id="username" name="username" class="form-control" type="text">
        <label for="email">Email</label>
        <c:if test="${param.errorEmailEmpty != null}">
            <div class="card w-100 error">
                <div class="card-body text-danger">
                    Please enter an email
                </div>
            </div>
        </c:if>
        <c:if test="${param.errorEmailExists != null}">
            <div class="card w-100 error">
                <div class="card-body text-danger">
                    Account already attached to email entered
                </div>
            </div>
        </c:if>
        <input id="email" name="email" class="form-control" type="text">
        <label for="password">Password</label>
        <c:if test="${param.errorPasswordIssue != null}">
            <div class="card w-100 error">
                <div class="card-body text-danger">
                    There was an issue with your password. Please try again.
                </div>
            </div>
        </c:if>
        <input id="password" name="password" class="form-control" type="password">
        <label for="confirm_password">Confirm Password</label>
        <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        <label for="image">Image</label>
        <input id="image" type="avatar_img_url" name="avatar_img_url" class="form-control" type="text">
        <button type="submit" class="btn btn-primary btn-block">Submit</button>

    </form>
</div>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>

</html>
