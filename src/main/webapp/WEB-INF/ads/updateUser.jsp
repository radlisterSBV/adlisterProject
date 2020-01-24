<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container mt-5">
    <h1>Update Your Profile:</h1>
    <form action="/updateUser" method="POST">
        <input id="username" name="username" class="form-control" type="hidden" value="${user.username}">
        <label for="email">Update Email</label>
        <input id="email" name="email" class="form-control" type="text" value="${user.email}" required>
        <label for="password">New Password</label>
        <c:if test="${param.errorPasswordIssue != null}">
            <div class="card w-100 error">
                <div class="card-body text-danger">
                    There was an issue with your password. Please try again.
                </div>
            </div>
        </c:if>
        <input id="password" name="password" class="form-control" type="password">
        <label for="passwordConfirmation">Confirm Password</label>
        <input id="passwordConfirmation" name="passwordConfirmation" class="form-control" type="password">
        <label for="image">Image</label>
        <input id="image" type="text" class="form-control" name="avatar_img_url">
        <input type="hidden" value="${user.id}" name="userId">
        <button type="submit" class="btn btn-block btn-primary">Submit</button>
    </form>
</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>
