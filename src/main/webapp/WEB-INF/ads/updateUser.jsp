<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/loggedInNavbar.jsp"/>

<div class="container">
    <h1>Update Your Ad:</h1>
    <form action="/updateUser" method="POST">
        <%--            <label>Categories</label><br>--%>
        <%--            <input type="checkbox" name="category" value="cat1"> Category 1--%>
        <%--            <input type="checkbox" name="category" value="cat2"> Category 2--%>
        <%--            <input type="checkbox" name="category" value="cat3"> Category 3--%>
        <div class="form-group">
            <input id="username" name="username" class="form-control" type="hidden" value="${user.username}">
        </div>
        <div class="form-group">
            <label for="email">Update Email</label>
            <input id="email" name="email" class="form-control" type="text" value="${user.email}" required>
        </div>
        <div class="form-group">
            <label for="password">New Password</label>
            <c:if test="${param.errorPasswordIssue != null}">
                <div class="card w-100">
                    <div class="card-body text-danger">
                        There was an issue with your password. Please try again.
                    </div>
                </div>
            </c:if>
            <input id="password" name="password" class="form-control" type="password">
            <label for="passwordConfirmation">Confirm Password</label>
            <input id="passwordConfirmation" name="passwordConfirmation" class="form-control" type="password">
        </div>
        <div class="form-group">
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
