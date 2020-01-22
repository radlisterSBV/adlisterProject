<%--
  Created by IntelliJ IDEA.
  User: nicolavirgino
  Date: 1/17/20
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}"/>
    </jsp:include>
    <script src="https://kit.fontawesome.com/927b51fa66.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/partials/loggedInNavbar.jsp"/>

<div class="container">
    <h1>Here is one ad: </h1>

    <%--    <img src="img/lawn_mower.png"  alt="">--%>
    <div class="card-body">
        <h4><c:out value="${ad.title}"/></h4>
        <p class="card-text"><c:out value="${ad.description}"/></p>
        <%--        <p class="card-text"><c:out value="<img src='" + ${ad.url} + "'>"/></p>--%>
    </div>

<%--    <img src="<c:url value="${ad.im}"/>"/>--%>
    <div class="card-body">
        <h4><c:out value="${ad.title}"/></h4>
        <p class="card-text"><c:out value="${ad.getUrl()}"/></p>


    </div>
    <c:if test="${ad.getUserId() == user.id}">

        <form action="/update" method="GET">
            <input type="hidden" name="ad_id" value="${ad.id}">
            <button type="submit"><i class="far fa-edit"></i></button>
        </form>
        <form action="/delete" method="POST">
            <input type="hidden" name="ad_id" value="${ad.id}">
            <button type="submit"><i class="fas fa-trash-alt"></i></button>
        </form>
    </c:if>
</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>
