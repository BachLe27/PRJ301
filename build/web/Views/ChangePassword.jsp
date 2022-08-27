<%-- 
    Document   : ChangePassword
    Created on : Jul 12, 2022, 6:30:25 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../Components/headComponent.jsp" %>
    <body>
        <%@include file="../Components/Navbar.jsp" %>

        <div class="container d-flex flex-column justify-content-center align-items-center mt-3">
            <h2 class="fw-bold text-warning my-3">Đổi mật khẩu</h2>

            <form action="ChangePassword" method="post" class="col-lg-5 col-8">
                <div class="form-group">
                    <label class="form-label fw-bold">Tài khoản</label>
                    <input class="form-control" type="text" id="username" value="${sessionScope.profile.username}" disabled>
                </div>
                
                <input class="form-control" type="text" name="username" required value="${sessionScope.profile.username}" hidden>
                
                <div class="form-group mt-3">
                    <label class="form-label fw-bold">Mật khẩu cũ</label>
                    <input type="password" id="oldPassword" class="form-control" name="oldPassword">
                </div>

                <div class="form-group mt-2">
                    <label class="form-label fw-bold">Mật khẩu mới</label>
                    <input type="password" class="form-control" name="newPassword" id="newPassword" required oninput="checkNewPass()">
                </div>

                <div class="form-group mt-2">
                    <label class="form-label fw-bold">Nhập lại mật khẩu mới</label>
                    <input type="password" class="form-control" name="newPassword2" id="newPassword2" required oninput="checkNewPass()" onblur="checkNewPass()">
                </div>

                <p id="noti" class="form-text text-danger d-none mb-0">Mật khẩu không khớp</p>
                <button id="submit" class="w-100 mt-3 btn btn-warning" type="submit">Đổi mật khẩu</button>
            </form>
        </div>

        <c:if test="${!empty requestScope.wrongPass}">
            <script>
                alert("Sai mật khẩu, cập nhật mật khẩu thất bại!");
            </script>
            <c:remove var="wrongPass" scope="request" ></c:remove>
        </c:if>
        
        <c:if test="${!empty requestScope.updated}">
            <script>
                alert("Cập nhật mật khẩu mới thành công");
            </script>
            <c:remove var="udpated" scope="request" ></c:remove>
        </c:if>
            
            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" 
        crossorigin="anonymous"></script>
    </body>

    <script>

        function checkNewPass() {
            var firstPass = $("#newPassword").val();
            var secondPass = $("#newPassword2").val();

            console.log(firstPass, secondPass);

            if (firstPass != secondPass && secondPass != "") {
                $("#noti").removeClass("d-none");
                $("#submit").prop("disabled", true);
            } else {
                $("#noti").addClass("d-none");
                $("#submit").prop("disabled", false);
            }
        }
    </script>
</html>
