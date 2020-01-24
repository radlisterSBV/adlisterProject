<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="radlister.com" />
    </jsp:include>
    <link href="https://fonts.googleapis.com/css?family=Exo+2:600&display=swap" rel="stylesheet">
    <style>
        body {
            background-image: url("../img/rocksDark.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>

<body>
    <div id="splash">
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%--        <h3 class="catch-phrase">Where you go to pack your bag.</h3>--%>
        <div class="splash-container d-flex">
            <img src="/img/logo-circle.png" id="circle" alt="company logo" class="logo-img splash_img mt-5 mb-5">
            <img src="/img/inner-rings.png" id="inner" alt="inner-rings">
            <img src="/img/outer-rings.png" id="outer" alt="outer-rings">
            <jsp:include page="/WEB-INF/partials/searchBar.jsp"/>
        </div>
    </div>
        <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
