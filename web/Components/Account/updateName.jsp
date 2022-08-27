<%-- 
    Document   : updateLocation
    Created on : Jun 15, 2022, 11:12:42 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="updateName${sessionScope.profile.username}" tabindex="-1" aria-labelledby="updateNameLabel"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="updateNameLabel">Thay đổi Họ và tên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="ChangeInfo" method="post" id="updateName">
                    <div class="form-group">
                        <label class="form-label fw-bold" for="">Họ và tên</label>
                        <input class="form-control" name="name" type="text" value="${profile.name}" required >
                    </div>
                    
                    <input type="text" name="username" value="${profile.username}" hidden>
                    
                    <input type="text" name="info" value="2" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="updateName" class="btn btn-warning">Cập nhật</button>
            </div>
        </div>
    </div>
</div>

