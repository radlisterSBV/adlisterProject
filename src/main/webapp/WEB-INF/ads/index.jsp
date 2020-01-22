<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <%--    <link href="<c:url value='/WEB-INF/css/main.css' />" rel="stylesheet"/>--%>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<jsp:include page="/WEB-INF/partials/searchBar.jsp"/>

<%--<img src="../../img/lawn_mower.png" alt="">--%>
<h1>Here Are all the ads!</h1>
<div class="container">

    <c:forEach var="ad" items="${ads}">

        <form action="/ad" method="GET">

            <a href="#" class="">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h4><c:out value="${ad.title}"/></h4>
                        <p class="card-text"><c:out value="${ad.description}"/></p>
                        <img src="<c:url value="${ad.getUrl()}"/>"/>

                    </div>


                    <input type="hidden" name="ad_id" value="${ad.id}">
                    <button type="submit">View Ad</button>
                </div>
            </a>
        </form>
    </c:forEach>

    <jsp:include page="/WEB-INF/partials/scripts.jsp"/>

</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>
