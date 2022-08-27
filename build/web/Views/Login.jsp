<%-- 
    Document   : Login
    Created on : Jun 20, 2022, 11:04:32 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <%@include file="../Components/headComponent.jsp" %>
    <body>
        <div class="login-container container d-flex flex-column justify-content-center align-items-center mt-5">

            <%@include file="../Components/Notification/AllNotification.jsp" %>

            <h1 class='py-4 fw-bold'><a data-bs-toggle="tooltip" data-bs-placement="bottom" title="Trang chủ" class="text-warning text-decoration-none" href="Home">ScheduGuard</a></h1>
            <form action="Auth" method="post" class='d-flex flex-column col-lg-4 col-8'>
                <div class="form-floating mb-3">
                    <input name="username" type="username" class="form-control" id="floatingInput" 
                           value="${sessionScope.preUsername}" placeholder="name@example.com" required>
                    <label for="floatingInput">Tài khoản</label>
                </div>
                <div class="form-floating">
                    <input name="password" type="password" class="form-control" id="floatingPassword" 
                           value="${sessionScope.prePassword}" placeholder="Password" required>
                    <label for="floatingPassword">Mật khẩu</label>
                </div>
                <button type="submit" class="btn btn-success mt-3 fw-bold"> Đăng nhập </button>
                <a class="mt-2 mb-0 text-center" href="Forget">Quên mật khẩu?</a>
                <p class='mt-2 text-center'>Chưa có tài khoản? <a href="Register">Đăng ký</a></p>
            </form>

            <!--            <input type="text" class='form-control' name="username" placeholder="Tài khoản"/>
                        <input type="password" class="form-control mt-2" name="password" placeholder="Mật khẩu"/>-->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" 
        crossorigin="anonymous"></script>
        <script>
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
        </script>
    </body>
</html>

