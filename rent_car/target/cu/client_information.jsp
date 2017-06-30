<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String orderNo = "768768";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>租车信息</title>

    <!-- Bootstrap Core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                <h4 class="page-header">订单号:<b><c:out value="${orderNo}"/></b></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <h4>用户信息</h4>
            </div>
        </div>

        <form method="post" id="subForm">
            <div class="row" >
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="client-series">客户编号</span>
                        <input type="text" required="true" name="customerNo" class="form-control"
                               value="<c:out value="${customerNo}"/>"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="client-name">姓名</span>
                        <input type="text" required="true" class="form-control" name="customerNamae"
                               value="<c:out value="${customerNamae}"/>" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon" id="client-gender">性别</span>
                        <select class="form-control" name="customerSex">
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
                        <input type="text" required="required" name="customerID" value="<c:out value="${customerID}"/>"
                               maxlength="18" class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="phone-number">手机号</span>
                        <input type="text" required="required" name="customerTel" vaule="<c:out value="${customerID}"/>"
                               class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="workplace">工作单位</span>
                        <input type="text" class="form-control" name="customerWorkplace"
                               value="<c:out value="${customerWorkPlace}"/>" placeholder=""
                               aria-describedby="basic-addon1">
                    </div>
                </div>

            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="address">地址</span>
                        <input type="text" required="required" name="customerAddress"
                               value="<c:out value="${customerAddress}"/>" class="form-control" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="post-code">邮编</span>
                        <input type="number" required="required" min="100000" max="999999" name="customerPost"
                               value="<c:out value="${customerPost}"/>" class="form-control" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="email">Email</span>
                        <input type="email" class="form-control" name="customerEmail"
                               value="<c:out value="${customerEmail}"/>" placeholder="" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <h4 style="margin-top: 30px">租赁信息</h4>
            <hr/>
            <div class="row">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">租车日期</span>
                        <input type="date" required="required" id="orderStartD"
                               class="form-control" name="orderStartDate" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">还车日期</span>
                        <input type="date" required="required" id="orderPendD"
                               class="form-control" name="returnDateInPlan" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <h4 style="margin-top: 30px"> 驾驶证信息</h4>
            <hr />
            <div class="row" >
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="driver-license">驾驶证号</span>
                        <input type="text" required="required" class="form-control" name="licenseNo" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-2" >
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
                        <input type="text" name="licenseAges" required="required" class="form-control" placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px">
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="date-of-issue">发证日期</span>
                        <input type="date" name="licenseStartDate" required="required" class="form-control"
                               placeholder="必填"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="data-of-invalid">失效日期</span>
                        <input type="date" name="licenseInvalidDate" required="required" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <h4 style="margin-top: 30px"> 车辆信息</h4>
            <hr />
            <div class="row" style="margin-top: 30px">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">车牌号</span>
                        <input type="text" required="required" class="form-control" placeholder="必填"
                               value="<c:out value="${param.carNo}"/>"
                               name="carNo"
                               aria-describedby="basic-addon1">

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon" id="start_mile">开始里程</span>
                        <input type="number" required="required" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1"
                               name="orderStartMiles"
                        >
                        <span class="input-group-addon" id="basic-addon">公里</span>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4 col-md-offset-8">
                    <button type="button" id="postData" class="btn btn-primary" style="margin: 10px">出车</button>

                    <a type="button" class="btn btn-danger" href="/booking.jsp">取消</a>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
<!-- jQuery -->
<script src="/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/dist/js/sb-admin-2.js"></script>

<script>
    $('#postData').click(function () {
        var data = $('#subForm').serializeArray();
        var jsonData = {}
        for (var i = 0; i < data.length; ++i) {
            jsonData[data[i].name] = data[i].value
        }

        $.ajax({
            type: "POST",
            url: "/Order/RentCar",
            data: jsonData,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            success: function (dataVal) {
                dataVal = JSON.parse(dataVal)
                if (dataVal == 1) {
                    alert("出车成功")
                } else {
                    alert("操作失败")
                }
            },
            error: function () {
                alert("操作失败")
            }
        })
//        $.post(
//            {
//                url: '/client_infor',
//                async: false,
//                data: data,
//                success: function () {
//
//                },
//                fail: function () {
//
//                },
//                dataType: "json"
//            }
//        )
    })
</script>
<script>
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear() + "-" + (month) + "-" + (day);
    $('#orderStartD').attr('min', today);
    $('#orderStartD').val(today);
    $('#orderPendD').attr('min', today);
    $('#orderPendD').val(today);
</script>
</html>