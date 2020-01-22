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
<h1>Here Are all the ads!</h1>
<div class="container">
   <c:forEach var="ad" items="${searchResults}">
           <form action="/ad" method="GET">
               <div class="card">
                   <img src="<c:url value="${ad.getUrl()}"/>" class="card-img-top" alt="...">
                   <div class="card-body">
                       <p><c:out value="${ad.title}"/></p>
                       <input type="hidden" name="ad_id" value="${ad.id}">
                       <button type="submit">View Ad</button>
                   </div>
               </div>
           </form>
   </c:forEach>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
