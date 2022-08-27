<%-- 
    Document   : deleteAccount
    Created on : Jul 17, 2022, 8:50:09 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="confirmDelete${account.username}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDelete${account.username}Label">Xác nhận việc xoá tài khoản ${account.username}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xoá tài khoản<span class="fw-bold text-danger"> ${account.username} </span>không?</p>
                
                <form id="deleteAccount${account.username}" action="DeleteAccount" method="post">
                    <input type="text" name="username" value="${account.username}" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="deleteAccount${account.username}" class="btn btn-danger">Xác nhận xoá</button>
            </div>
        </div>
    </div>
</div>
