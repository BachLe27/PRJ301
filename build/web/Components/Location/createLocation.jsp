<%-- 
    Document   : createLocation
    Created on : Jun 14, 2022, 8:51:22 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="createLocation" tabindex="-1" aria-labelledby="createLocationLabel"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="createLocationLabel">Thêm điểm gác</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="HandleLocation" method="post" id="locationForm">
                    <div class="form-group">
                        <label class="form-label fw-bold" for="">Tên điểm gác</label>
                        <input class="form-control" name="name" type="text" required>
                    </div>

                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="" required>Số người gác một ca</label>
                        <input class="form-control" type="number" min="1" max="10" name="numOfGuard" id="">
                    </div>
                    
                    <input type="text" name="status" value="1" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="locationForm" class="btn btn-success">Thêm</button>
            </div>
        </div>
    </div>
</div>

