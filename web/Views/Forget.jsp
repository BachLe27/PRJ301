<%-- 
    Document   : Forget
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

            <h1 class='py-4'><a data-bs-toggle="tooltip" data-bs-placement="bottom" title="Trang chủ" class="text-danger text-decoration-none fw-bold" href="Home">Quên mật khẩu</a></h1>
            <form action="Forget" method="post" class='d-flex flex-column col-lg-4 col-8'>

                <div class="form-floating mb-3">
                    <input id="email" name="email" type="email" class="form-control" id="floatingInput" 
                           placeholder="name@example.com" required oninput="checkValid()">
                    <label for="floatingInput">Email</label>
                </div>

                <div class="form-floating">
                    <input id="username" name="user" type="text" class="form-control" id="floatingPassword" 
                           placeholder="Password" required oninput="checkValid()">
                    <label for="floatingPassword">Tài khoản</label>
                </div>
                <span id="noti">

                </span>
                <button id="submit" type="submit" class="btn btn-success mt-3 fw-bold" disabled> Tạo mới mật khẩu </button>
                <p class='mt-2 text-center'>Chưa có tài khoản? <a href="Register">Đăng ký</a></p>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" 
        crossorigin="anonymous"></script>

    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>

        function checkValid() {
            var username = $('#username').val();
            var email = $('#email').val();

            $.ajax({
                url: 'CheckValid',
                type: 'get',
                data: {
                    username: username,
                    email: email
                },
                success: function (data) {
                    check(data);
                }
            });
        }

        function check(data) {
            var username = $('#username').val();
            if (data.includes("success") && username != "") {
                $("#submit").prop("disabled", false);
                $("#noti").html(data);
            }
            
            if (!data.includes("success") || username == "") {
                $("#submit").prop("disabled", true);
                $("#noti").html(data);
            }
            
            if (username == "") {
                $("#noti").html("");
            }
        }
    </script>
</html>

