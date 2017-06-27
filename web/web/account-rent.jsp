<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>已有账户租车</title>

    <link href="./vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
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
    <%@include file="navbar.jsp" %>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <h4 class="page-header">用户信息</h4>
            </div>
        </div>
        <div class="col-md-12" id="alertArea" style="padding: 0px">

        </div>


        <form method="post" id="subForm">
            <div class="row">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="client-phone">手机号</span>
                        <input type="number" required="true" name="customerTel" class="form-control"
                               value="<c:out value="${customerNo}"/>"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-1 ">
                    <a class="btn btn-info" id="verify">验证</a>

                </div>
            </div>

            <h4 style="margin-top: 30px"> 驾驶证信息</h4>
            <hr/>
            <div class="row">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="driver-license">驾驶证号</span>
                        <input type="text" required="true" class="form-control" name="licenseNo" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon" id="license-type">驾照类型</span>
                        <select class="form-control">
                            <option name="licenseType">A1</option>
                            <option name="licenseType">A2</option>
                            <option name="licenseType">A3</option>
                            <option name="licenseType">B1</option>
                            <option name="licenseType">B2</option>
                            <option name="licenseType">C1</option>
                            <option name="licenseType">C2</option>
                            <option name="licenseType">C3</option>
                        </select>

                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon" id="driver-time">驾龄</span>
                        <input type="text" name="licenseAges" required="true" class="form-control" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px">
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="date-of-issue">发证日期</span>
                        <input type="date" name="licenseStartDate" required="true" class="form-control" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="data-of-invalid">失效日期</span>
                        <input type="date" name="licenseInvalidDate" required="true" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <h4 style="margin-top: 30px"> 车辆信息</h4>
            <hr/>
            <div class="row" style="margin-top: 30px">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">车牌号</span>
                        <input type="text" required="true" class="form-control" placeholder="必填"
                               value="<c:out value="${param.carNo}" />"
                               name="carNo"
                               aria-describedby="basic-addon1">

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="start_mile">开始里程</span>
                        <input type="number" required="true" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1"
                               name="orderStartM"
                        >
                        <span class="input-group-addon" id="basic-addon">公里</span>
                    </div>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-md-2 col-md-offset-10">
                    <button type="button" id="postData" class="btn btn-primary" style="margin: 10px">出车</button>

                    <a type="button" class="btn btn-danger" href="booking.jsp">取消</a>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
<script src="./vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="./dist/js/sb-admin-2.js"></script>
<script>
    $('#verify').click(function () {
        var phone = $('#client-phone').val()
        var $elem = $('#alertArea')
        $.ajax({
            type: "POST",
            url: "./VerifyPhone",
            data: {
                Tel: phone
            },
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            success: function (dataVal) {
                if (dataVal[status] == 'success') {
                    $elem.append(
                        '<div class="alert alert-success alert-dismissible" role="alert">' +
                        '<a type="button" class="close clostb" data-dismiss="alert" ><span aria-hidden="true">&times;</span></a>'
                        + '该手机号被<strong>' + dataVal[user] + '</strong>使用'
                        + '</div>'
                    )
                } else {
                    elem.append(
                        '<div class="alert alert-info alert-dismissible" role="alert">'
                        + '<a type="button" class="close clostb" data-dismiss="alert" ><span aria-hidden="true">&times;</span></a>'
                        + '<strong>该手机号未注册</strong>,请重试'
                        + '</div>'
                    )
                }
            },
            error: function () {
                $elem.append(
                    '<div class="alert alert-danger alert-dismissible" role="alert">'
                    + '<a type="button" class="close clostb" data-dismiss="alert" ><span aria-hidden="true">&times;</span></a>'
                    + '<strong>操作失败</strong>,请重试'
                    + '</div>'
                )
            }
        })
    })
</script>

<script>
    $('#postData').click(function () {
            var data = $('#subForm').serializeArray();
            $.ajax({
                type: "POST",
                url: "./VerifyPhone",
                data: {
                    Tel: data
                },
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                success: function (dataVal) {
                    alert('出车成功')
                },
                error: function (dataVal) {
                    alert('失败,请重试')
                }
            })
        }
    )
</script>

<script>
    $(".clostb").click(function () {
        console.log('press')
        $(".alert").alert('close');
    });
</script>
</html>
