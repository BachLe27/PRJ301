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

                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}"> 
                    <%@include file="../Components/Location/createLocation.jsp" %>
                    <%@include file="../Components/Notification/AllNotification.jsp" %>
                    <div class="border-bottom pb-2 mb-3">
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createLocation"><i
                                class="bi bi-plus-circle"></i> Thêm điểm gác</button>
                        <button class="btn btn-danger"><i class="bi bi-trash"></i> Xoá điểm gác đã chọn</button>
                    </div>
                </c:if>
                <c:if test="${sessionScope.userStatus != true}">
                    <p>Tài khoản của bạn chưa được active. Hãy <a href="">active</a> để sử dụng thêm các chức năng khác.</p>
                </c:if>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Điểm gác</th>
                            <th scope="col">Số người gác</th>
                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">
                                <th scope="col">Sửa/Xoá</th>
                                <th scope="col">Chọn</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${locationDAO.locations}" var="location">
                            <tr>
                                <td>${location.value.name}</td>
                                <td>${location.value.numOfGuard}</td>
                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}"> 
                                    <td>
                                        <button data-bs-toggle="modal" data-bs-target="#updateLocationModal${location.key}" class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                                        <button data-bs-toggle="modal" data-bs-target="#confirmDelete${location.key}" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                                        <!--Delete Modal-->
                                        <%@include file="../Components/Location/deleteLocation.jsp" %>

                                        <!--Update Modal-->
                                        <%@include file="../Components/Location/updateLocation.jsp" %>
                                    </td>
                                    <td>
                                        <input type="checkbox">
                                    </td>
                                </c:if>
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
