<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="logo-container"><a href="/home"><img src="../../img/logo.png" class="small_icon"></a></div>

    <button class="navbar-toggler mt-3" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav navbarLinks">
            <c:if test="${user == null}">
            <li class="nav-item active">
                <a class="nav-link" href="/ads">Ads</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/register">Register</a>
            </li>
            </c:if>
            <c:if test="${user != null}">
                <li class="nav-item active">
                    <a class="nav-link" href="/ads">Ads</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads/create">Create Ad</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/profile">My Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
