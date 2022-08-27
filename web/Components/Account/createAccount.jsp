<%-- 
    Document   : CreateAccount
    Created on : Jul 8, 2022, 7:24:48 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade mt-5" id="createAccount" tabindex="-1" aria-labelledby="createAccountLabel"
     aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="createAccountLabel">Tạo tài khoản</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="CreateAccount" method="post" id="accountForm">
                    
                    <span class="py-2" id="noti"></span>
                    
                    <div class="form-group">
                        <label class="form-label fw-bold" for="">Tên tài khoản</label>
                        <input class="form-control" id="username" name="username" oninput="CheckValid()" type="text" required>
                    </div>
                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="">Email</label>
                        <input class="form-control" id="email" name="email" oninput="CheckValid()" type="text" required>
                    </div>
                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="">Họ và tên</label>
                        <input class="form-control" id="name" name="name" type="text" required>
                    </div>
                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="" required>Mật khẩu</label>
                        <input class="form-control" type="password" name="password">
                    </div>
                    <div class="form-group mt-2">
                        <label class="form-label fw-bold" for="" required>Số điện thoại</label>
                        <input class="form-control" type="tel" pattern="[0]{1}[0-9]{9}" name="phone" placeholder="0xxxxxxxxx">
                    </div>

                    <input type="text" name="role" value="1" hidden/>
                    <input type="text" name="status" value="0" hidden/>
                    <input type="text" name="sources" value="1" hidden/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="submit-btn" type="submit" form="accountForm" class="btn btn-success">Thêm</button>
            </div>
        </div>
    </div>
</div>

<script>

    function CheckValid() {
        var email = $('#email').val();
        var username = $('#username').val();
        if (email != '' || username != '') {
            $.ajax({
                url: 'CheckExist',
                type: 'get',
                data: {
                    email: email,
                    username: username
                },
                success: function (data) {
                    check(data);
                }
            });
        }
    }



    function check(data) {
        if (data.includes("danger")) {
            $("#submit-btn").prop("disabled", true);
            $("#noti").html(data);
        } else {
            $("#submit-btn").prop("disabled", false);
            $("#noti").html("");
        }
    }
</script>