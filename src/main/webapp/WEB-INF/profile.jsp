<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<h1>Welcome, ${user.username}!</h1>


<img src="<c:url value="${user.getUrl()}" />"/>


<div class="card-container">
    <c:forEach var="ad" items="${ads}">

        <c:if test="${ad.getUserId() == user.id}">
            <div class="card">
                <form action="/ad" method="GET">
                    <img src="<c:url value="${ad.getUrl()}"/>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p><c:out value="${ad.title}"/></p>
                        <input type="hidden" name="ad_id" value="${ad.id}">
                        <button type="submit">View Ad</button>
                    </div>
                </form>
            </div>
        </c:if>
    </c:forEach>
</div>

<div>
    <form action="/updateUser" method="GET">
        <input type="hidden" name="userId" value="${user.id}">
        <button type="submit"><i class="far fa-edit"></i>UPDATE PROFILE</button>
    </form>
    <form action="/deleteUser" method="POST">

        <input type="hidden" name="userId" value="${user.id}">
        <button type="button" class="button" data-toggle="modal" data-target="#exampleModal">
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
                        <button type="submit" class="btn btn-danger">DELETE ACCOUNT</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp"/>

</body>
</html>
