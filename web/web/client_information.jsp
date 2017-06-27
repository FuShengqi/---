<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>租车信息</title>

    <!-- Bootstrap Core CSS -->
    <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div id="wrapper">

    <!-- Navigation -->
    <%@include file="navbar.jsp"%>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h4 class="page-header">订单号:<b>XXXX</b></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <h4 class="page-header">用户信息</h4>
            </div>
        </div>
        <form action="/action_page.php">
            <div class="row" >
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="client-series">客户编号</span>
                        <input type="text" required="true" class="form-control" value="S19357840" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="client-name">姓名</span>
                        <input type="text" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon" id="client-gender">性别</span>
                        <select class="form-control">
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </div>
                </div>

            </div>
            <div class="row" style="margin-top:20px;">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="ID-card">身份证号</span>
                        <input type="text" required="true" maxlength="18" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="phone-number">手机号</span>
                        <input type="text" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="workplace">工作单位</span>
                        <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
                    </div>
                </div>

            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="address">地址</span>
                        <input type="text" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="post-code">邮编</span>
                        <input type="number" required="true" min="100000" max="999999" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="email">Email</span>
                        <input type="email" class="form-control" placeholder="" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>

            <h4 style="margin-top: 30px"> 驾驶证信息</h4>
            <hr />
            <div class="row" >
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="driver-license">驾驶证号</span>
                        <input type="text" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-2" >
                    <div class="input-group">
                        <span class="input-group-addon" id="license-type">驾照类型</span>
                        <select class="form-control">
                            <option>A1</option>
                            <option>A2</option>
                            <option>A3</option>
                            <option>B1</option>
                            <option>B2</option>
                            <option>C1</option>
                            <option>C2</option>
                            <option>C3</option>
                        </select>

                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon" id="driver-time">驾龄</span>
                        <input type="text" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px">
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="date-of-issue">发证日期</span>
                        <input type="date" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="data-of-invalid">失效日期</span>
                        <input type="date" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <h4 style="margin-top: 30px"> 车辆信息</h4>
            <hr />
            <div class="row" style="margin-top: 30px">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">车牌号</span>
                        <input type="text" required="true" class="form-control" placeholder="必填"
                               value="<c:out value="${carNo}" />"
                               aria-describedby="basic-addon1">

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="start_mile">开始里程</span>
                        <input type="number" required="true" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                        <span class="input-group-addon" id="basic-addon">公里</span>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4 col-md-offset-9">
                    <button type="button submit" class="btn btn-primary" style="margin: 10px">出车</button>

                    <a type="button" class="btn btn-danger" href="booking.html">取消</a>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
<!-- jQuery -->
<script src="./vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="./dist/js/sb-admin-2.js"></script>
</html>