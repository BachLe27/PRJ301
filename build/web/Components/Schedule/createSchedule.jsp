<%-- 
    Document   : addSchedule
    Created on : Jun 8, 2022, 11:10:36 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm lịch gác</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="createSchedule" action="HandleSchedule" method="post">

                    <div class="form-group">
                        <label for="">Điểm gác</label>
                        <select name="locationId" id="" class="form-select" required>
                            <c:forEach items="${locationDAO.locations}" var="location">
                                <option value="${location.key}">${location.value.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group mt-2">
                        <label for="" class="form-label">Ngày gác</label>
                        <input type="date" name="date" id="" class="form-control" min="2022-01-01" max="2024-12-31" required>
                    </div>
                    
                    <div class="form-group mt-2">
                        <label for="" class="form-label">Ca gác (giờ)</label>
                        <select name="shiftId" id="" class="form-select" required>
                            <c:forEach items="${scheduleDAO.shifts}" var="shift">
                                <option value="${shift.key}">${shift.value.startTime} - ${shift.value.endTime}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <input type="text" name="active" value="0" hidden>
                    
                    <input type="text" name="status" value="1" hidden/>
<!--                <div class="form-group mt-2">
                        <label for="" class="form-label">Số người gác</label>
                        <input type="number"  id="" class="form-control" value="" disabled>
                    </div>-->

<!--                    <div class="form-group mt-2 row">
                        <label for="">Người gác</label>

                        <div class="col-4">
                            <label for="">Lớp</label>
                            <select name="class" id="" class="form-select">
                                <option value="">SE1630</option>
                                <option value="">SE1631</option>
                                <option value="">SE1632</option>
                            </select>
                        </div>

                        <div class="col-8">
                            <label for="">Sinh viên</label>
                            <select name="class" id="" class="form-select">
                                <option value="">HE163411 - Nguyễn Văn A</option>
                                <option value="">Lớp 2</option>
                                <option value="">Lớp 3</option>
                            </select>
                        </div>

                        <div class="col-4 mt-2">
                            <select name="class" id="" class="form-select">
                                <option value="">SE1630</option>
                                <option value="">SE1631</option>
                                <option value="">SE1632</option>
                            </select>
                        </div>

                        <div class="col-8 mt-2">
                            <select name="class" id="" class="form-select">
                                <option value="">HE163411 - Nguyễn Văn A</option>
                                <option value="">HE163412 - Nguyễn Thị B</option>
                                <option value="">Lớp 3</option>
                            </select>
                        </div>
                    </div>-->
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="createSchedule" class="btn btn-success">Thêm lịch</button>
            </div>
        </div>
    </div>
</div>
