<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/loggedInNavbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>

    <c:forEach var="ad" items="${ads}">
        <form action="/ad" method="POST">


<%--        <c:if test="${ad.user_id} == ${sessionScope.user.id}">--%>
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h4><c:out value="${ad.title}"/></h4>

                        <p class="card-text"><c:out value="${ad.description}"/></p>
                    </div>
                    <input type="hidden" name="ad_id" value="${ad.id}">
                    <button type="submit">View Ad</button>
                </div>
<%--        </c:if>--%>
        </form>
    </c:forEach>
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
