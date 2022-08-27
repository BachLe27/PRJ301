<%-- 
    Document   : Profile
    Created on : Jul 11, 2022, 6:02:20 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../Components/headComponent.jsp" %>
    <body>
        <%@include file="../Components/Navbar.jsp" %>

        <div class="container d-flex flex-column justify-content-center align-items-center mt-3">

            <h2 class="fw-bold text-success">Thông tin cá nhân</h2>

            <table class="table mt-3 col-lg-5 col-8">
                <tr>
                    <td>Tài khoản</td>
                    <td class="fw-bold">${sessionScope.profile.username}</td>
                </tr>

                <tr>
                    <td>Họ và tên</td>
                    <td class="fw-bold">${sessionScope.profile.name}
                        <button data-bs-toggle="modal" data-bs-target="#updateName${sessionScope.profile.username}" class="ms-2 btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                        <%@include file="../Components/Account/updateName.jsp" %>
                    </td>

                </tr>
                <tr>
                    <td>Email</td>
                    <td class="fw-bold">${sessionScope.profile.email}</td>
                </tr>

                <tr>
                    <td>Số điện thoại</td>
                    <td class="fw-bold">
                        ${sessionScope.profile.phone}
                        <button data-bs-toggle="modal" data-bs-target="#updatePhone${sessionScope.profile.username}" class="ms-2 btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                        <%@include file="../Components/Account/updatePhone.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td>Role</td>
                    <td class="fw-bold">${(sessionScope.profile.role == 0? "Admin Account": "Normal Account")}</td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td class="fw-bold">${(sessionScope.profile.status == true? "Active": "Not Active")}</td>
                </tr>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" 
        crossorigin="anonymous"></script>
    </body>
</html>
