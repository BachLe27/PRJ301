<%-- 
    Document   : deleteClass
    Created on : Jun 9, 2022, 5:02:40 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="confirmDelete${cl.key}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDelete${cl.key}Label">Xác nhận việc xoá lớp ${cl.value.name}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p> Nếu xoá lớp <span style="color:red; font-weight: bold">${cl.value.name}</span>, tất cả sinh viên và lịch gác thuộc lớp bị xoá sẽ bị ảnh hưởng.</p>

                <form id="deleteClass${cl.key}" action="HandleClass" method="post">
                    <input type="text" name="id" value="${cl.key}" hidden>
                    <input type="text" name="name" value="${cl.value.name}" hidden>
                    <!-- Status: 3 - Delete Class -->
                    <input type="text" name="status" value="3" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="deleteClass${cl.key}" class="btn btn-danger">Xác nhận xoá</button>
            </div>
        </div>
    </div>
</div>
