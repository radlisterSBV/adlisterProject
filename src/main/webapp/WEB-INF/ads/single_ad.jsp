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
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1><c:out value="${ad.title}"/></h1>
    <div class="singleAd-container">
        <img src="<c:url value="${ad.getUrl()}"/>" alt="plz"/>
        <p class="card-text"><c:out value="${ad.description}"/></p>
    </div>
    <c:if test="${ad.getUserId() == user.id}">
        <form action="/update" method="GET">
            <input type="hidden" name="ad_id" value="${ad.id}">
            <button type="submit"><i class="far fa-edit"></i></button>
        </form>
        <form action="/delete" method="POST">
            <input type="hidden" name="ad_id" value="${ad.id}">

            <!-- Modal -->

            <button type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#deleteSingleAd">
                <i class="fas fa-trash-alt"></i>
            </button>


            <div class="modal fade" tabindex="-1" role="dialog" id="deleteSingleAd" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Ad</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h4>Are you sure you want to delete this ad?</h4>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-danger">DELETE AD</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </c:if>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>