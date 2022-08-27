<%-- 
    Document   : deleteSchedule
    Created on : Jul 11, 2022, 5:27:04 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="confirmDelete${schedule.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDelete${schedule.id}Label">Xác nhận việc xoá lịch gác</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Bạn chắn chắn muốn xoá lịch gác vừa chọn?</p>
                
                <form id="deleteStudent${schedule.id}" action="HandleSchedule" method="post">
                    <input type="text" name="id" value="${schedule.id}" hidden>
                    <!-- Status: 3 - Delete -->
                    <input type="text" name="status" value="3" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="deleteStudent${schedule.id}" class="btn btn-danger">Xác nhận xoá</button>
            </div>
        </div>
    </div>
</div>
