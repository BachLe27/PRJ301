<%-- 
    Document   : deleteStudent
    Created on : Jun 18, 2022, 11:06:55 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="confirmDelete${student.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDelete${student.id}Label">Xác nhận việc xoá sinh viên ${student.name}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Nếu <span class="fw-bold text-danger">${student.name}</span>, tất cả các lịch gác có sinh viên bị xoá sẽ bị ảnh hưởng.</p>
                
                <form id="deleteStudent${student.id}" action="HandleStudent" method="post">
                    <input type="text" name="id" value="${student.id}" hidden>
                    <input type="text" name="name" value="${student.name}" hidden>
                    <!-- Status: 3 - Delete -->
                    <input type="text" name="status" value="3" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="deleteStudent${student.id}" class="btn btn-danger">Xác nhận xoá</button>
            </div>
        </div>
    </div>
</div>