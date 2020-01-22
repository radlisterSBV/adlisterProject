<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container mt-5">
        <form action="/login" method="POST">
        <h1>Please Log In</h1>
                <c:if test="${param.error != null}">
                    <div class="card w-100">
                        <div class="card-body text-danger">
                            Username or password incorrect. Please try again.
                        </div>
                    </div>
                </c:if>
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
