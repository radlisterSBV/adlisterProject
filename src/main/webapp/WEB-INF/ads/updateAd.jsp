<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Update Your Ad:</h1>
    <form action="/update" method="POST">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" value="${ad.description}">
            <label for="image">Image</label>
            <input id="image" name="url" class="form-control" type="text" value="${ad.url}">
            <input type="hidden" value="${ad.id}" name="ad_id">
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
