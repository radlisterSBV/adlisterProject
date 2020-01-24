<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
    <style>
        body {
            background-image: url("../../img/hiking_bg.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container text-center form-bg create-form">
    <form action="/ads/create" method="post">
    <h1>Create a new Ad</h1>
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" type="text">
                <label for="image">Image</label>
                <input id="image" type="text" name="url">
        <button type="submit" class="btn btn-block btn-primary">Create Ad</button>
    </form>

</div>
</body>
<jsp:include page="/WEB-INF/partials/scripts.jsp"/>

</html>
