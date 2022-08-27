<%-- 
    Document   : createClass
    Created on : Jun 8, 2022, 4:41:36 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="createClass" tabindex="-1" aria-labelledby="createClassLabel"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="createClassLabel">Thêm lớp</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="HandleClass" method="post" id="classForm">
                    <div>
                        <label class="form-label fw-bold" for="name">Tên lớp</label>
                        <input class="form-control" type="text" name="name" id="name" required>
                    </div>

                    <div class="mt-2">
                        <label class="form-label fw-bold" for="major">Ngành học</label>
                        <input class="form-control" type="text" name="major" id="major" required>
                    </div>
                    
                    <div class="mt-2">
                        <label class="form-label fw-bold" for="session">Khoá</label>
                        <input class="form-control" type="number" id="session" min="1" max="100" name="session" required>
                    </div>
                    
                    <!-- Status: 1 - Create Class -->
                    <input name="status" type="text" value="1" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button id="createClassBtn" type="submit" form="classForm" class="btn btn-success">Thêm</button>
            </div>
        </div>
    </div>
</div>

