<%-- 
    Document   : SendedMail
    Created on : Jul 12, 2022, 5:37:36 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="alert alert-success alert-dismissible fade show" role="alert">
    <span> Đã gửi mail đến <span class="fw-bold"> ${sessionScope.sendedEmail}</span> hãy <a class="alert-link" target="_blank" href="https://mail.google.com/">kiểm tra</a>  </span> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
        
<script> 
    $('.alert').alert('dispose');
</script>

