<%-- 
    Document   : createStudent
    Created on : Jun 8, 2022, 4:32:17 PM
    Author     : bachl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" data-bs-backdrop="static" id="createStudent" tabindex="-1" aria-labelledby="createStudentLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fw-bold text-success" id="createStudentLabel">Thêm sinh viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>   
            <div class="modal-body">

                <form action="HandleStudent" method="post" id="createStudentForm">
                    
                    <div class="form-group">
                        <label class="col-form-label fw-bold" for="">Lớp</label>
                        
                        <select class="form-select" name="classId"> 
                            <c:forEach items="${classDAO.classes}" var="cl">
                                <option value="${cl.key}" ${(currentClass == cl.key?"selected": "")}>${cl.value.name}</option>
                            </c:forEach>
                        </select>
                        <!--<input type="text" name="className" id="" class="form-control">-->
                    </div>
                    
                    <div class="form-group mt-2">
                        <label class="fw-bold col-form-label" for="">Mã số sinh viên</label>
                        <input type="text" name="id" id="" class="form-control" required>
                    </div>

                    <div class="form-group mt-2">
                        <label class="fw-bold col-form-label" for="">Họ và tên</label>
                        <input type="text" name="name" id="" class="form-control" required>
                    </div>

                    <div class="form-group mt-2">
                        <label class="fw-bold col-form-label" for="" class="form-label">Ngày sinh</label>
                        <input type="date" name="birthday" id="" class="form-control" min="1890-01-01" max="2022-01-01" required>
                    </div>

                    <div class="form-group mt-2">
                        <label for="" class="col-form-label fw-bold">Giới tính</label><br>
                        <label class="form-check-label" for="">Nam</label> 
                        <input class="form-check-input" type="radio" name="gender" value="1" id="" required>
                        <label class="form-check-label" for="">Nữ</label> 
                        <input class="form-check-input" type="radio" name="gender" value="0" id="">
                    </div>
                    <div class="form-group mt-2">
                        <label class="col-form-label fw-bold" for="">Số điện thoại</label>
                        <input type="tel" name="phone" id="" class="form-control" pattern="[0-9]{10}" required>
                    </div>
                    
                    <input type="text" name="status" value="1" hidden>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="createStudentForm" class="btn btn-success">Thêm sinh viên</button>
            </div>
        </div>
    </div>
</div>