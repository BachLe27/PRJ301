<%-- 
    Document   : updateClass
    Created on : Jun 10, 2022, 9:27:43 AM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="updateClassModal${cl.key}" tabindex="-1" aria-labelledby="updateClass${cl.key}Label"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="updateClass${cl.key}Label">Chỉnh sửa thông tin lớp học</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="HandleClass" method="post" id="updateClass${cl.key}">
                    <div>
                        <label class="form-label fw-bold" for="name">Tên lớp</label>
                        <input class="form-control" type="text" name="name" id="name" value="${cl.value.name}" required>
                    </div>
                    <div class="mt-2">
                        <label class="form-label fw-bold" for="major">Ngành học</label>
                        <input class="form-control" type="text" name="major" id="major" value="${cl.value.major}" required>
                    </div>
                    <div class="mt-2">
                        <label class="form-label fw-bold" for="session">Khoá</label>
                        <input class="form-control" type="number" id="session" min="1" max="100" name="session" value="${cl.value.session}"  required>
                    </div>
                    <input type="text" name="id" value="${cl.key}" hidden>
                    
                    <!-- Status: 2 - Update Class -->
                    <input type="text" name="status" value="2" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" form="updateClass${cl.key}" class="btn btn-warning">Cập nhật</button>
            </div>
        </div>
    </div>
</div>

