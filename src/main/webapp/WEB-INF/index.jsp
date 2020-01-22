<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="splash-container">
        <img src="/img/logo.png" alt="company logo" class="logo-img">
        <jsp:include page="/WEB-INF/partials/searchBar.jsp"/>

    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>

</html>
