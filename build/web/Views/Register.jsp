<%-- 
    Document   : Register
    Created on : Jun 20, 2022, 11:14:54 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="../Components/headComponent.jsp" %>

    <body>
        <div class="login-container container d-flex flex-column justify-content-center align-items-center mt-5">
            <h1 class='py-4 text-warning fw-bold'>Scheduguard Register</h1>

            <form action="CreateAccount" method="post" class='d-flex flex-column col-lg-4 col-8'>

                <span class="py-2" id="noti"></span>

                <div class="form-floating mb-3">
                    <input name="email" id="email" type="email" class="form-control" oninput="CheckValid()"
                           placeholder="name@example.com" required>
                    <label for="email">Email</label>
                </div>

                <div class="form-floating mb-3">
                    <input name="name" type="text" class="form-control" id="name" 
                           placeholder="name@example.com" required>
                    <label for="name">Họ và tên</label>
                </div>

                <div class="form-floating mb-3">
                    <input name="username" id="username" type="text" oninput="CheckValid()" class="form-control" 
                           placeholder="name@example.com" required>
                    <label for="username">Tài khoản</label>
                </div>

                <div class="form-floating mb-3">
                    <input name="password" type="password" class="form-control" id="password" 
                           placeholder="name@example.com" required>
                    <label for="password">Mật khẩu</label>
                </div>

                <div class="form-floating mb-3">
                    <input name="phone" type="tel" class="form-control" id="phone" 
                           placeholder="name@example.com" required>
                    <label for="phone">Số điện thoại</label>
                </div>

                <input name="sources" value="register" hidden/>
                <input name="role" value="1" hidden/>
                <input name="status" value="0" hidden/>

                <button id="submit-btn" type="submit" class="btn btn-primary mt-2"> Đăng ký </button>

                <button class="g-recaptcha btn" 
                        data-sitekey="reCAPTCHA_site_key" 
                        data-callback='onSubmit' 
                        data-action='submit'>Mã Captcha</button>

                <p class='mt-2 text-center'>Đã có tài khoản? <a href="Login">Đăng nhập</a></p>
            </form>
        </div>

    </body>
    <script src="https://www.google.com/recaptcha/api.js?render=reCAPTCHA_site_key"></script>
    <script>
        function onClick(e) {
            e.preventDefault();
            grecaptcha.ready(function () {
                grecaptcha.execute('reCAPTCHA_site_key', {action: 'submit'}).then(function (token) {
                    // Add your logic to submit to your backend server here.
                });
            });
        }
    </script>
    <script>
        function CheckValid() {
            var email = $('#email').val();
            var username = $('#username').val();
            console.log(username);
            if (email != '' || username != '') {
                $.ajax({
                    url: 'CheckExist',
                    type: 'get',
                    data: {
                        email: email,
                        username: username
                    },
                    success: function (data) {
                        check(data);
                    }
                });
            }
        }

        function check(data) {

            if (data.includes("danger")) {
                $("#submit-btn").prop("disabled", true);
                $("#noti").html(data);
            } else {
                $("#submit-btn").prop("disabled", false);
                $("#noti").html("");
            }
        }
    </script>
</html>