<%-- 
    Document   : Student
    Created on : Jun 8, 2022, 4:22:56 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <%@include file="../Components/headComponent.jsp" %>
    <body>
        <%@include file="../Components/Navbar.jsp" %>
        <div class="d-flex">
            <%@include file="../Components/VerticalNavbar.jsp" %>
            
            <div class="container mt-5 ms-5">

                <div class="d-flex mb-3 border-bottom pb-2">

                    <form action="Student" method="post" class="me-2 mt-2">
                        <label for="">Lớp</label>
                        <select name="currentClass" id="currentClass" onchange="this.form.submit()">
                            <c:forEach items="${classDAO.classes}" var="cl">
                                <option ${(currentClass == cl.key? "selected":"")} value="${cl.key}">${cl.value.name}</option>
                            </c:forEach>
                        </select>
                    </form>

                    <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">
                        <%@include file="../Components/Student/createStudent.jsp" %>
                        <%@include file="../Components/Notification/AllNotification.jsp" %>
                        <button class="btn btn-success mx-2" data-bs-toggle="modal" data-bs-target="#createStudent"> <i class="bi bi-plus-circle"></i> Thêm sinh viên</button>
                        <button class="btn btn-success mx-2"> <i class="bi bi-filetype-xls"></i> Import From Excel </button>
                        <button class="btn btn-danger mx-2" data-bs-toggle="modal" data-bs-target="#confirmDelete"> <i class="bi bi-trash"></i> Xoá sinh viên đã chọn</button>
                    </c:if>

                </div>
                
                <c:if test="${sessionScope.userStatus != true}">
                    <p>Tài khoản của bạn chưa được active. Hãy <a href="">active</a> để sử dụng thêm các chức năng khác.</p>
                </c:if>
                
                <table class="table">
                    <thead>
                        <tr>
                            <th>Mã sinh viên</th>
                            <th>Họ và tên</th>
                            <th>Ngày sinh</th>
                            <th>Giới tính</th>
                            <th>Lớp</th>
                            <th>Số điện thoại</th>
                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">
                                <th>Sửa/Xoá</th>
                                <th>Chọn</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${studentDAO.students}" var="student">

                            <c:if test="${student.classId == currentClass}">
                                <tr>
                                    <td>${student.id}</td>
                                    <td>${student.name}</td>
                                    <td>${student.birthday}</td>
                                    <td>${(student.gender == true? "Nam": "Nữ")}</td>
                                    <td>${classDAO.classes.get(student.classId).name}</td>
                                    
                                    <td>${student.phone}</td>
                                    <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">
                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#updateStudentModal${student.id}" class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                                            <button data-bs-toggle="modal" data-bs-target="#confirmDelete${student.id}" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                                            <!--Delete Modal-->
                                            <%@include file="../Components/Student/deleteStudent.jsp" %>
                                            <!--Update Modal-->
                                            <%@include file="../Components/Student/updateStudent.jsp" %>
                                        </td>
                                        <td>
                                            <input type="checkbox">
                                        </td>
                                    </c:if>

                                </tr>
                            </c:if>

                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" 
        crossorigin="anonymous"></script>
    </div>
</body>
</html>
