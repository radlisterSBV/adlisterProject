<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <c:if test="${param.errorUsernameEmpty != null}">
                    <div class="card w-75">
                        <div class="card-body text-danger">
                            Please enter a username
                        </div>
                    </div>
                </c:if>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <c:if test="${param.errorEmailEmpty != null}">
                    <div class="card w-75">
                        <div class="card-body text-danger">
                            Please enter an email
                        </div>
                    </div>
                </c:if>
                <input id="email" name="email" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <c:if test="${param.errorPasswordIssue != null}">
                    <div class="card w-75">
                        <div class="card-body text-danger">
                            There was an issue with your password. Please try again.
                        </div>
                    </div>
                </c:if>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</body>
</html>
