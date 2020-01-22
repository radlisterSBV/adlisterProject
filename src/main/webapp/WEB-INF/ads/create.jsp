<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <%--            <label>Categories</label><br>--%>
        <%--            <input type="checkbox" name="category" value="cat1"> Category 1--%>
        <%--            <input type="checkbox" name="category" value="cat2"> Category 2--%>
        <%--            <input type="checkbox" name="category" value="cat3"> Category 3--%>
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
            <a href="/ads/img">Upload Image</a>
        <%--            <div class="form-group">--%>
        <%--                <label for="image">Image</label>--%>
        <%--                <input id="image" name="url" class="form-control" type="text">--%>
        <%--            </div>--%>



        <input type="submit" class="btn btn-block btn-primary">
    </form>

</div>
</body>
<jsp:include page="/WEB-INF/partials/scripts.jsp"/>

</html>
