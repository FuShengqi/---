<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <!-- All the files that are required -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='./dist/css/login.css' rel='stylesheet' type='text/css'>
    <script src='./vendor/jquery/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <!-- LOGIN FORM -->
            <div> <!--style="padding:50px 0"-->
                <div class="logo">登录</div>
                <!-- Main Form -->
                <div class="login-form-1">
                    <form id="login-form" class="text-left" action="/Stuff/Login" method="post">
                        <div class="login-form-main-message"></div>
                        <div class="main-login-form">
                            <div class="login-group">
                                <div class="form-group">
                                    <label>用户名</label>
                                    <input type="text" class="form-control" id="lg_username" name="userName"
                                           placeholder="">
                                </div>
                                <div class="form-group">
                                    <label>密码</label>
                                    <input type="password" class="form-control" id="lg_password" name="passWord"
                                           placeholder="">
                                </div>
                                <div class="form-group login-group-checkbox">
                                    <input type="checkbox" id="lg_remember" name="lg_remember">
                                    <label for="lg_remember">记住</label>
                                </div>
                            </div>
                            <button type="submit" class="login-button" style="out-line:none"><i
                                    class="fa fa-chevron-right"></i></button>
                        </div>
                        <div class="etc-login-form">


                            <p>新用户? <a href="./register.jsp">创建账户</a></p>
                        </div>
                    </form>
                </div>
                <!-- end:Main Form -->
            </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</div>
</body>
</html>


