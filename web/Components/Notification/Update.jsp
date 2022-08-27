<%-- 
    Document   : Update.jsp
    Created on : Jun 14, 2022, 8:29:14 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="update" class="toast" role="status" aria-live="polite" aria-atomic="true" data-bs-delay="3000">
        <div class="toast-header bg-warning">
            <strong class="me-auto text-dark">ScheduGuard</strong>
            <!--<small></small>-->
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            <a href="../Location/updateLocation.jsp"></a>
        </div>
        <div class="toast-body">
            <p class="p-0 m-0">Sửa thông tin của <span class="text-warning fw-bold">${sessionScope.updateName}</span> thành công</p> 
        </div>
    </div>
</div>    
        
<script> 
    $(document).ready(function(){
        $("#update").toast("show");
    });
</script>

