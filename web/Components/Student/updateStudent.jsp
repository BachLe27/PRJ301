<%-- 
    Document   : updateStudent
    Created on : Jun 18, 2022, 11:48:04 PM
    Author     : bachl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" data-bs-backdrop="static" id="updateStudentModal${student.id}" tabindex="-1" aria-labelledby="updateStudentLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fw-bold text-warning" id="updateStudentLabel">Sửa thông tin sinh viên ${student.name}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>   
            <div class="modal-body">

                <form action="HandleStudent" method="post" id="updateStudentForm${student.id}">
                    
                    <div class="form-group">
                        <label class="col-form-label fw-bold" for="">Lớp</label>
                        
                        <select class="form-select" name="classId"> 
                            <c:forEach items="${classDAO.classes}" var="cl">
                                <option ${(cl.key == student.classId?"selected":"")} value="${cl.key}">${cl.value.name}</option>
                            </c:forEach>
                        </select>
                        <!--<input type="text" name="className" id="" class="form-control">-->
                    </div>
                    
                    <div class="form-group mt-2">
                        <label class="fw-bold col-form-label" for="">Mã số sinh viên</label>
                        <input type="text" name="idStatic" id="" value="${student.id}" disabled="" class="form-control">
                    </div>

                    <div class="form-group mt-2">
                        <label class="fw-bold col-form-label" for="">Họ và tên</label>
                        <input type="text" name="name" id="" value="${student.name}" class="form-control">
                    </div>

                    <div class="form-group mt-2">
                        <label class="fw-bold col-form-label" for="" class="form-label">Ngày sinh</label>
                        <input type="date" name="birthday" id="" value="${student.birthday}" min="1890-01-01" max="2022-01-01" class="form-control">
                    </div>

                    <div class="form-group mt-2">
                        <label for="" class="col-form-label fw-bold">Giới tính</label><br>
                        <label class="form-check-label" for="">Nam</label> 
                        <input class="form-check-input" type="radio" name="gender" value="1" id="" ${(student.gender?"checked":"")}>
                        <label class="form-check-label" for="">Nữ</label> 
                        <input class="form-check-input" type="radio" name="gender" value="0" id="" ${(!student.gender?"checked":"")}>
                    </div>
                    <div class="form-group mt-2">
                        <label class="col-form-label fw-bold" for="">Số điện thoại</label>
                        <input type="tel" name="phone" id="" value="${student.phone}" pattern="[0-9]{10}" class="form-control">
                    </div>
                    
                    <input type="text" name="status" value="2" hidden>
                    <input type="text" name="id" value="${student.id}" hidden>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="updateStudentForm${student.id}" class="btn btn-warning">Cập nhật thông tin</button>
            </div>
        </div>
    </div>
</div>
