<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<jsp:include page="/WEB-INF/partials/searchBar.jsp"/>
    <h1>Here Are all the ads!</h1>
<div class="container">

    <c:forEach var="ad" items="${ads}">
    <form action="/ad" method="GET">
        <%--form was looping with data that was not there yet--%>

            <a href="#" class="">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h4><c:out value="${ad.title}"/></h4>

                        <p class="card-text"><c:out value="${ad.description}"/></p>
<%--                        IT'S NOT WORKING YET, BUT I WANT TO DISPLAY EACH CATEGORY WITHIN CARD--%>
                        <c:forEach var="cat" items="${categories}">
                            <p class="card-text"><c:out value="${cat}"/></p>
                        </c:forEach>
                    </div>

                    <input type="hidden" name="ad_id" value="${ad.id}">
                    <button type="submit">Click me</button>
                </div>
            </a>

    </form>
    </c:forEach>

</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
