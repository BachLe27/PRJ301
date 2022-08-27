<%-- 
    Document   : Create
    Created on : Jun 14, 2022, 8:13:27 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="create" class="toast" role="status" aria-live="polite" aria-atomic="true" data-bs-delay="3000">
        <div class="toast-header bg-success">
            <strong class="me-auto text-white">ScheduGuard</strong>
            <!--<small></small>-->
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            <p class="p-0 m-0">Thêm <span class="text-success fw-bold">${sessionScope.createName}</span> thành công</p> 
        </div>
    </div>
</div>    
        
<script> 
    $(document).ready(function(){
        $("#create").toast("show");
    });
</script>
