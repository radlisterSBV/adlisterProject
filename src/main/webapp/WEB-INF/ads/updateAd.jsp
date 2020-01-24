<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad" />
    </jsp:include>
    <style>
        body {
            background-image: url("../../img/sunset.jpeg");
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div>
<div class="container mt-5 container-card-container update-class">
    <h1>Update Your Ad:</h1>
    <form action="/update" method="POST" class="w-50">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" value="${ad.description}">
            <label for="image">Image</label>
            <input id="image" name="url" class="form-control" type="text" value="${ad.url}">
            <input type="hidden" value="${ad.id}" name="ad_id">
        <button type="submit" class="btn btn-block btn-primary">Update</button>
    </form>
</div>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
