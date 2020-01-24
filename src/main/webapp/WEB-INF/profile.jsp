<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <style>
        body {
            background-image: url("../img/mountains2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="body-div">
    <div class="w-55 d-flex justify-content-center">
    <div class="profile-container card d-flex justify-content-around flex-column align-items-center">
        <img class="mb-4" src="<c:url value="${user.getUrl()}" />" alt="profile image"/>
        <div>
            <p><i class="fas fa-at"></i>: <c:out value="${user.username}"/></p>
            <p class="mt-n3 mb-4"><i class="fas fa-envelope"></i>: <c:out value="${user.getEmail()}" /></p>
            <form action="/updateUser" method="GET" class="mt-n3">
                <input type="hidden" name="userId" value="${user.id}">
                <button type="submit" class="btn btn-primary mb-n2"><i class="far fa-edit"></i>UPDATE PROFILE</button>
            </form>
            <form action="/deleteUser" method="POST">
                <input type="hidden" name="userId" value="${user.id}">
                <button type="button" class="btn btn-primary button mb-n2 red-button" data-toggle="modal" data-target="#exampleModal">
                    <i class="fas fa-trash-alt"></i> DELETE PROFILE
                </button>
                <div class="modal" tabindex="-1" role="dialog" id="exampleModal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Are you sure you want to delete your account?</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h6>This will also delete all of your ads.</h6>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn btn-primary">Cancel</button>
                                <button type="submit" class="btn btn-danger red-button">DELETE ACCOUNT</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>

    <div class="container-card-container card-container mt-2 mb-2 w-66">
        <c:choose>
        <c:when test="${newAd == null}">
        <h1 class="display-4">Welcome, <c:out value="${user.username}"/>.</h1>
            <h2>You haven't created any ads yet!</h2>
            <h2>Click "Create Ad" above to begin!</h2>
        </c:when>
        <c:otherwise>
            <h1 class="display-3">Welcome, <c:out value="${user.username}"/>.</h1>
            <h4 class="display-4">Here are your ads:</h4>
        <div class="card-container">
            <c:forEach var="ad" items="${ads}">
                <c:if test="${ad.getUserId() == user.id}">
                    <div class="card small-card">
                        <form action="/ad" method="GET">
                            <img src="<c:url value="${ad.getUrl()}"/>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p><c:out value="${ad.title}"/></p>
                                <div class="button-container d-flex justify-content-center">
                                <input type="hidden" name="ad_id" value="${ad.id}">
                                <button type="submit" class="btn btn-primary">View Ad</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        </c:otherwise>
        </c:choose>

    </div>
</div>




<jsp:include page="/WEB-INF/partials/scripts.jsp"/>

</body>
</html>
