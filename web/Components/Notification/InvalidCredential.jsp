<%-- 
    Document   : InvalidCredential
    Created on : Jun 25, 2022, 5:33:51 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <span> Mật khẩu hoặc tài khoản không đúng! <a class="alert-link" href="Forget">Quên mật khẩu?</a>  </span> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
        
<script> 
    $('.alert').alert('dispose');
</script>
