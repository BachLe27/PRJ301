<%-- 
    Document   : Classes
    Created on : Jun 8, 2022, 4:36:23 PM
    Author     : bachl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <%@include file="../Components/headComponent.jsp" %>
    <body>
        <%@include file="../Components/Navbar.jsp" %>

        <div class="d-flex"> 
            <%@include file="../Components/VerticalNavbar.jsp" %>

            <div class="container mt-5 ms-5">

                <div class="d-flex border-bottom pb-2 mb-3">

                    <form action="Classes" method="post" class="me-2 mt-2">
                        <label for="session">Khoá</label>
                        <select name="session" id="session" onchange="this.form.submit()">
                            <option ${selectSession!=0?"":"selected"} value="0">Tất cả</option>
                            <c:forEach items="${classDAO.sessionSet}" var="session">
                                <option ${selectSession == session? "selected":""} value="${session}">${session}</option>
                            </c:forEach>
                        </select>
                    </form>

                    <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">
                        <%@include file="../Components/Notification/AllNotification.jsp" %>
                        <%@include file="../Components/Classes/createClass.jsp" %>
                        <button class="btn btn-success mx-2" data-bs-toggle="modal" data-bs-target="#createClass"><i
                                class="bi bi-plus-circle"></i> Thêm lớp</button>
                        <button class="btn btn-danger"><i class="bi bi-trash"></i> Xoá lớp đã chọn</button>


                    </c:if>

                </div>

                <!-- Modal -->
                <c:if test="${sessionScope.userStatus != true}">
                    <p>Tài khoản của bạn chưa được active. Hãy <a href="">active</a> để sử dụng thêm các chức năng khác.</p>
                </c:if>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Tên lớp</th>
                            <th scope="col">Ngành học</th>
                            <th scope="col">Khoá</th>
                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">
                                <th scope="col">Sửa/Xoá</th>
                                <th scope="col">Chọn</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${classDAO.classes}" var="cl">
                            <c:if test="${selectSession == 0 || selectSession == cl.value.session}">
                                <tr>
                                    <td>${cl.value.name}</td>
                                    <td>${cl.value.major}</td>
                                    <td>${cl.value.session}</td>
                                    <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">
                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#updateClassModal${cl.key}" class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                                            <button data-bs-toggle="modal" data-bs-target="#confirmDelete${cl.key}" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>

                                            <!--Delete Modal-->
                                            <%@include file="../Components/Classes/deleteClass.jsp" %>

                                            <!--Update Modal-->
                                            <%@include file="../Components/Classes/updateClass.jsp" %>

                                        </td>
                                        <td><input type="checkbox"></td>
                                        </c:if>
                                </tr>
                            </c:if>
                        </c:forEach>

                    </tbody>
                </table>

            </div>
        </div>

        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

        <script>

        </script>
    </body>
</html>
