<%-- 
    Document   : Navbar
    Created on : Jun 8, 2022, 10:16:14 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container justify-content-between align-items-center">
        <h1 class="navbar-brand fs-3"> <a title="Trang chủ" class="text-warning text-decoration-none" href="Home">ScheduGuard</a> </h1>

        <c:if test="${sessionScope.user != '3.guest'}"> 
            <c:set var="user" value="${sessionScope.user}" /> 
            <c:set var="username" value="${fn:substring(user, 2, user.length())}"/>

            <div class="mt-3 d-flex align-items-center justify-content-center">
                <span class="me-2">Xin chào</span>

                <div class="nav-item dropdown me-1">
                    <a title="Xem thông tin tài khoản" 
                       class="badge text-bg-success nav-link dropdown-toggle" 
                       id="navbarDropdown" role="button" 
                       data-bs-toggle="dropdown" 
                       aria-expanded="false"
                       >
                        <i class="bi bi-person-circle"></i> ${username}
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="Profile"><i class="bi bi-person-circle me-1"></i> Thông tin tài khoản</a></li>
                        <li><a class="dropdown-item" href="ChangePassword"><i class="bi bi-shield-lock me-1"></i> Đổi mật khẩu</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item fw-bold text-danger" href="Logout"> <i class="bi bi-backspace-reverse me-1"></i> Đăng xuất</a></li>
                    </ul>
                </div>

<!--                |
                <a class="badge text-bg-danger ms-1" href="Logout">Đăng xuất</a>-->
            </div>

        </c:if>

        <c:if test="${sessionScope.user == '3.guest'}"> 
            <a class="btn btn-success text-bg-success" href="Login">Đăng nhập</a>
        </c:if>
    </div>
</nav>
