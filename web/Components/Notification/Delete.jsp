<%-- 
    Document   : Delete
    Created on : Jun 14, 2022, 8:37:12 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="delNoti" class="toast" role="status" aria-live="polite" aria-atomic="true" data-bs-delay="3000">
        <div class="toast-header bg-danger">
            <strong class="me-auto text-white">ScheduGuard</strong>
            <!--<small></small>-->
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            <p class="p-0 m-0">Đã xoá <span class="text-danger fw-bold">${sessionScope.deleteName}</span>.</p> 
        </div>
    </div>
</div>    
        
<script> 
    $(document).ready(function(){
        $("#delNoti").toast("show");
    });
</script>