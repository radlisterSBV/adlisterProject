<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        body {
            background-image: url("../../img/boat.jpeg");
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="search-div-container">
<div class="search-results">
<h1 class="display-4">Search results:</h1>
    <div class="search-mid">
   <c:forEach var="ad" items="${searchResults}">
    <div class="card">
           <form action="/ad" method="GET">
               <img src="<c:url value="${ad.getUrl()}"/>" class="card-img-top" alt="...">
               <div class="card-body">
                   <p><c:out value="${ad.title}"/></p>
                   <div class="button-container w-100 d-flex justify-content-center">
                   <input type="hidden" name="ad_id" value="${ad.id}">
                   <button type="submit" class="btn btn-primary">View Ad</button>
                   </div>
               </div>
            </form>
   </div>
   </c:forEach>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
