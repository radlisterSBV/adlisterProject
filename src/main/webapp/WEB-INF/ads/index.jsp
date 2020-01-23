<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--<img src="../../img/lawn_mower.png" alt="">--%>
<h1 class="text-center">Here Are all the ads!</h1>
<div class="card-container">
<jsp:include page="/WEB-INF/partials/searchBar.jsp"/>
</div>
<div class="card-container">

    <c:forEach var="ad" items="${ads}">

     <div class="card">
        <form action="/ad" method="GET">
                <img src="<c:url value="${ad.getUrl()}"/>" class="card-img-top" alt="...">
                <div class="card-body">
                        <p><c:out value="${ad.title}"/></p>
                    <input type="hidden" name="ad_id" value="${ad.id}">
                    <button class="btn btn-block btn-primary" type="submit">View Ad</button>
                </div>
        </form>
     </div>
    </c:forEach>

    <jsp:include page="/WEB-INF/partials/scripts.jsp"/>

</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>
