<%-- 
    Document   : deleteLocation
    Created on : Jun 15, 2022, 7:34:10 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="confirmDelete${location.key}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDelete${location.key}Label">Xác nhận việc xoá lớp ${location.value.name}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Nếu xoá điểm gác <span class="fw-bold text-danger">${location.value.name}</span>, tất cả các lịch gác thuộc tại điểm gác bị xoá sẽ bị ảnh hưởng.</p>
                
                <form id="deleteLocation${location.key}" action="HandleLocation" method="post">
                    <input type="text" name="id" value="${location.key}" hidden>
                    <input type="text" name="name" value="${location.value.name}" hidden>
                    <!-- Status: 3 - Delete -->
                    <input type="text" name="status" value="3" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="deleteLocation${location.key}" class="btn btn-danger">Xác nhận xoá</button>
            </div>
        </div>
    </div>
</div>
