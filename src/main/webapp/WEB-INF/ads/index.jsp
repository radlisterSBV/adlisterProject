<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <style>
        body {
            background-image: url("../../img/kayak2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--<img src="../../img/lawn_mower.png" alt="">--%>
<div class="search-div-container mb-3 mt-3">
<div class="search-results">
<h1 class="display-4 text-center">Find what you're seeking:</h1>
<jsp:include page="/WEB-INF/partials/searchBar.jsp"/>



<h2 class="display-4 mb-n3">Or, browse all ads:</h2>
<div class="search-mid">
    <c:forEach var="ad" items="${ads}">
     <div class="card">
        <form action="/ad" method="GET">
                <img src="<c:url value="${ad.getUrl()}"/>" class="card-img-top" alt="...">
                <div class="card-body">
                        <p><c:out value="${ad.title}"/></p>
                    <div class="button-container">
                    <input type="hidden" name="ad_id" value="${ad.id}">
                    <button class="btn btn-block btn-primary text-light" type="submit">View Ad</button>
                    </div>
                </div>
        </form>
     </div>
    </c:forEach>
    <jsp:include page="/WEB-INF/partials/scripts.jsp"/>
    </div>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>
