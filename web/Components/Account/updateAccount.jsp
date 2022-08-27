<%-- 
    Document   : updateAccount
    Created on : Jul 11, 2022, 8:21:19 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="updateAccount${account.username}" tabindex="-1" aria-labelledby="updateAccountLabel"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-warning" id="updateAccountLabel">Sửa thông tin tài khoản</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="Account" method="post" id="accountForm${account.username}">
                    
                    <div class="form-group">
                        <label class="form-label fw-bold" for="">Tài khoản</label>
                        <input class="form-control" type="text" value="${account.username}" disabled>
                    </div>
                    <input class="form-control" name="username" type="text" value="${account.username}" hidden>
                    
                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="">Email</label>
                        <input class="form-control" type="text" value="${account.email}" disabled>
                    </div>
                    
                    <input class="form-control" name="email" type="text" value="${account.email}" hidden>
                    
                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="">Tên</label>
                        <input class="form-control" name="name" type="text" value="${account.name}" required>
                    </div>
                    
                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="">Số điện thoại</label>
                        <input class="form-control" name="phone" type="text" value="${account.phone}" required>
                    </div>

                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="">Role</label>
                        <select class="form-select" name="role">
                            <option value="0" ${(account.role == 0? "selected": "")}>Admin</option>
                            <option value="1" ${(account.role == 1? "selected": "")}>Normal</option>
                        </select>
                    </div>

                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="">Status</label>
                        <div class="form-check">
                            <label class="form-check-label" for="activeStatus${account.username}">Active</label>
                            <input name="status" value="1" class="form-check-input" type="radio" id="activeStatus${account.username}" ${(account.status == true? "checked" : "")}>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="deactiveStatus${account.username}">Deactive</label>
                            <input name="status" value="0" class="form-check-input" type="radio" id="deactiveStatus${account.username}" ${(account.status == false? "checked":"")}>
                        </div>
                    </div>

                    <input type="text" name="status" value="2" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="accountForm${account.username}" class="btn btn-warning">Cập nhật</button>
            </div>
        </div>
    </div>
</div>
