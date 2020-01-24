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
<div class="d-flex justify-content-center">
<div class="card card-container-container mt-4 mb-4">
    <div class="d-flex flex-column align-items-center single-ad-container">
    <h1 class="display-4"><c:out value="${ad.title}"/></h1>
        <img src="<c:url value="${ad.getUrl()}"/>" alt="plz"/>
        <p class="card-text mt-3"><c:out value="${ad.description}"/></p>
<%--        <p class="card-text"></p>--%>
    </div>
    <c:if test="${ad.getUserId() == user.id}">
        <div class="d-flex justify-content-center align-items-center flex-column w-100">
            <div class="w-50">
        <form action="/update" method="GET">
            <input type="hidden" name="ad_id" value="${ad.id}">
            <button type="submit" class="btn btn-primary mt-3 w-25"><i class="far fa-edit"></i> EDIT</button>
        </form>
        <form action="/delete" method="POST">
            <input type="hidden" name="ad_id" value="${ad.id}">
            <button type="button" class="btn btn-primary mt-n4 w-25 red-button" data-toggle="modal" data-target="#deleteSingleAd">
                <i class="fas fa-trash-alt"></i> DELETE
            </button>










            <!-- Modal -->



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
        </div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>