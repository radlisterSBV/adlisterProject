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
    <form action="/update" method="POST">
        <%--            <label>Categories</label><br>--%>
        <%--            <input type="checkbox" name="category" value="cat1"> Category 1--%>
        <%--            <input type="checkbox" name="category" value="cat2"> Category 2--%>
        <%--            <input type="checkbox" name="category" value="cat3"> Category 3--%>
        <div class="form-group">
            <label for="title">Title</label>
<%--            each of the attributes are pulling corrrectly--%>
            <input id="title" name="title" class="form-control" type="text" value="${ad.getTitle()}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control">${ad.getDescription()}</textarea>
        </div>
        <div class="form-group">
            <label for="image">Image</label>
            <input id="image" name="url" class="form-control" type="text" value="${ad.getUrl()}">
        </div>
            <div class="form-group">
            </div>
            <input type="hidden" value="${ad.getId()}" name="ad_id">
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
