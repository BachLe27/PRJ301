<%-- 
    Document   : updateLocation
    Created on : Jun 15, 2022, 11:12:42 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="updateLocationModal${location.key}" tabindex="-1" aria-labelledby="updateLocationLabel"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="updateLocationLabel">Sửa thông tin điểm gác</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="HandleLocation" method="post" id="udpateLocation${location.key}">
                    <div class="form-group">
                        <label class="form-label fw-bold" for="">Tên điểm gác</label>
                        <input class="form-control" name="name" type="text" value="${location.value.name}" required >
                    </div>

                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="" required>Số người gác một ca</label>
                        <input class="form-control" type="number" name="numOfGuard" min="1" max="10" value="${location.value.numOfGuard}" required>
                    </div>
                    
                    <input type="text" name="id" value="${location.key}" hidden>
                    
                    <input type="text" name="status" value="2" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="udpateLocation${location.key}" class="btn btn-warning">Cập nhật</button>
            </div>
        </div>
    </div>
</div>

