<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : Location
    Created on : Jun 8, 2022, 10:44:49 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../Components/headComponent.jsp" %>
    <body>
        <%@include file="../Components/Navbar.jsp" %>
        <div class="d-flex">
            <%@include file="../Components/VerticalNavbar.jsp" %>

            <div class="container mt-5 ms-5">

                <c:if test="${sessionScope.user != '3.guest'}"> 
                    <%@include file="../Components/Notification/AllNotification.jsp" %>
                    <div class="border-bottom pb-2 mb-3">
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createAccount"><i
                                class="bi bi-plus-circle"></i> Tạo tài khoản</button>
                        <!--<button class="btn btn-danger"><i class="bi bi-trash"></i> Xoá tài khoản đã chọn</button>-->
                    </div>
                    <%@include file="../Components/Account/createAccount.jsp" %>
                </c:if>

                <table class="table">
                    <thead>
                    <th>Tài khoản</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Sửa/Xoá</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${DAO.accounts}" var="account">
                            <tr>
                                <td>${account.username}</td>
                                <td>${account.name}</td>
                                <td>${account.email}</td>
                                <td>${account.phone}</td>
                                <td title="${(account.role == 0? "admin" : "normal")}">${(account.role == 0? "Admin" : "Normal")}</td>
                                <td>
                                    <c:if test="${account.status == true}">
                                        <span class="text-success" title="Active"><i class="bi bi-check-circle"></i></span>
                                    </c:if>
                                    <c:if test="${account.status == false}">
                                        <span class="text-danger" title="Not active"><i class="bi bi-x-circle"></i></span>
                                    </c:if>
                                </td>

                                <td>
                                    <button data-bs-toggle="modal" data-bs-target="#updateAccount${account.username}" class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                                    <%@include file="../Components/Account/updateAccount.jsp" %>
                                    
                                    <c:if test="${profile.username != account.username}">
                                        <button data-bs-toggle="modal" data-bs-target="#confirmDelete${account.username}" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                                        <%@include file="../Components/Account/deleteAccount.jsp" %>
                                    </c:if>
                                    
                                    
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>  
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    </body>
</html>
