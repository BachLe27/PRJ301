<%-- 
    Document   : Home
    Created on : Jun 27, 2022, 7:26:11 PM
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
            <%@include file="../Components/Schedule/createSchedule.jsp" %>

            <div class="container mt-5 ms-5">
                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}">

                    <%@include file="../Components/Notification/AllNotification.jsp" %>

                    <div class="mb-3 border-bottom pb-2">
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal"><i
                                class="bi bi-plus-circle"></i> Thêm lịch gác</button>
                        <button class="btn btn-danger"><i class="bi bi-trash"></i> Xoá lịch gác đã chọn</button>
                    </div>
                </c:if>

                <div class="d-flex justify-content-between border-bottom pb-2">
                    <form action="" class="mb-3">

                        <label for="">Địa điểm</label>
                        <select name="" id="">
                            <option value="" selected disabled>Chọn địa điểm</option>
                            <c:forEach items="${locationDAO.locations}" var="location">
                                <option>${location.value.name}</option>
                            </c:forEach>
                        </select>

                        <label for="">Ngày gác</label>
                        <input type="date" name="" id="">
                    </form>

                    <form action="" class="me-3">
                        <label for="">Tìm theo MSSV</label>
                        <input type="text" placeholder="Nhập MSSV...">
                        <button>Tìm</button>
                    </form>
                </div>
                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus != true}">
                    <p>Tài khoản của bạn chưa được active. Hãy <a href="">active</a> để sử dụng thêm các chức năng khác.</p>
                </c:if>
                    
                <table class="table">
                    <thead>
                        <tr>
                            <th>Điểm gác</th>
                            <th>Ngày gác</th>
                            <th>Ca gác</th>
                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}"> 
                                <th>Active</th>
                                </c:if>
                            <th>Họ và tên</th>
                            <th>Mã sinh viên</th>
                            <th>Lớp</th>
                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}"> 
                                <th>Xoá</th>
                                <th>Chọn</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${scheduleDAO.schedules}" var="schedule">
                            <tr>
                                <td>${locationDAO.locations.get(schedule.locationId).name}</td>
                                <td>${schedule.date}</td>
                                <td>${scheduleDAO.shifts.get(schedule.shiftId).startTime} - ${scheduleDAO.shifts.get(schedule.shiftId).endTime}</td>

                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}"> 
                                    <c:if test="${schedule.active == true}">
                                        <td class="text-success"><i class="bi bi-check-circle ms-3"></i></td>
                                    </c:if>

                                    <c:if test="${schedule.active == false}">
                                        <td><a data-bs-toggle="modal" data-bs-target="#addGuard${schedule.id}" href="" >Thêm người gác</a></td>
                                        <%@include file="../Components/Schedule/addGuard.jsp" %>
                                    </c:if>
                                </c:if>

                                <td>
                                    <c:forEach items="${scheduleDAO.scheduleDetails}" var="detail">
                                        <c:if test="${detail.scheduleId == schedule.id}">
                                            <c:forEach items="${studentDAO.students}" var="st">
                                                <c:if test="${st.id == detail.studentId}">
                                                    <p>${st.name}</p>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>  
                                </td>
                                
                                <td>
                                    <c:forEach items="${scheduleDAO.scheduleDetails}" var="detail">
                                        <c:if test="${detail.scheduleId == schedule.id}">
                                            <c:forEach items="${studentDAO.students}" var="st">
                                                <c:if test="${st.id == detail.studentId}">
                                                    <p>${st.id}</p>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>  
                                </td>     
                                
                                <td>
                                    <c:forEach items="${scheduleDAO.scheduleDetails}" var="detail">
                                        <c:if test="${detail.scheduleId == schedule.id}">
                                            <c:forEach items="${studentDAO.students}" var="st">
                                                <c:if test="${st.id == detail.studentId}">
                                                    <p>${classDAO.classes.get(st.classId).name}</p>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>  
                                </td> 
                                <c:if test="${sessionScope.user != '3.guest' && sessionScope.userStatus == true}"> 
                                    <td>
                                        <button data-bs-toggle="modal" data-bs-target="#confirmDelete${schedule.id}" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                                        <%@include file="../Components/Schedule/deleteSchedule.jsp" %>
                                    </td>   
                                </c:if>
                            </tr>

                        </c:forEach>
                        <!-- data -->
                    </tbody>
                </table>

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" 
        crossorigin="anonymous"></script>

    </body>
</html>
