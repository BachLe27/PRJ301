<%-- 
    Document   : updateLocation
    Created on : Jun 15, 2022, 11:12:42 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="updatePhone${sessionScope.profile.username}" tabindex="-1" aria-labelledby="updateLocationLabel"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="updateLocationLabel">Thay đổi số điện thoại</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="ChangeInfo" method="post" id="updatePhone">
                    <div class="form-group">
                        <label class="form-label fw-bold" for="">Số điện thoại</label>
                        <input class="form-control" pattern="[0]{1}[0-9]{9}" name="phone" placeholder="0xxxxxxxxx" type="tel" value="${profile.phone}" required >
                    </div>
                    
                    <input type="text" name="username" value="${profile.username}" hidden>
                    
                    <input type="text" name="info" value="1" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="updatePhone" class="btn btn-warning">Cập nhật</button>
            </div>
        </div>
    </div>
</div>

