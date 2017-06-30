<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <link href='/dist/css/login.css' rel='stylesheet' type='text/css'>
    <script src='/vendor/jquery/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
</head>
<body>
<!-- REGISTRATION FORM -->
<div class="text-center" style="padding:50px 0">
    <div style="margin-left: 40%">
        <div class="logo">注册</div>
        <!-- Main Form -->
        <div class="login-form-1">
            <form id="register-form" class="text-left">
                <div class="login-form-main-message"></div>
                <div class="main-login-form">
                    <div class="login-group">
                        <div class="form-group">
                            <label for="reg_username" class="sr-only">用户ID</label>
                            <input type="text" class="form-control" id=""
                                   name="stuffId"
                                   placeholder="用户名">
                        </div>
                        <div class="form-group">
                            <label for="reg_username" class="sr-only">用户名</label>
                            <input type="text" class="form-control" id="reg_username"
                                   name="stuffName"
                                   placeholder="用户名">
                        </div>
                        <div class="form-group">
                            <label for="reg_password" class="sr-only">密码</label>
                            <input type="password" class="form-control" id="reg_password"
                                   name="stuffPassword"
                                   placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="reg_password_confirm" class="sr-only">确认密码</label>
                            <input type="password" class="form-control" id="reg_password_confirm"
                                   name="reg_password_confirm" placeholder="确认密码">
                        </div>

                        <div class="form-group">
                            <label for="" class="sr-only">电话</label>
                            <input type="text" class="form-control"
                                   name="stuffTel" placeholder="电话">
                        </div>
                        <div class="form-group">
                            <label for="" class="sr-only">邮箱</label>
                            <input type="text" class="form-control" id=""
                                   name="email" placeholder="邮箱">
                        </div>

                    </div>
                    <button id="formSub" class="login-button"><i class="fa fa-chevron-right"></i></button>
                </div>
                <div class="etc-login-form">
                    <p>已有账户? <a href="/login.jsp">登录</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- end:Main Form -->
</div>

</body>
<script src="/vendor/jquery/jquery.min.js"></script>
<script>
    $('#formSub').click(function () {
        var data = $('#register-form').serializeArray();
        var jsonData = {}
        for (var i = 0; i < data.length; ++i) {
            jsonData[data[i].name] = data[i].value
        }

        $.ajax({
            type: "POST",
            url: "/Stuff/Register",
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            data: JSON.stringify(jsonData),
            success: function (dataVal) {
                dataVal = JSON.parse(dataVal)
                if (dataVal.RESULT_KEY == 1) {
                    alert("添加成功");
                } else {
                    alert("操作失败")
                }
            },
            error: function () {
                alert("操作失败")
//                window.location.href = '/add_car.jsp'
            }
        })
    })
</script>
</html>