<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>新增车辆</title>

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
            <div class="row page-header">
                <div class="col-md-12" style="margin-top: 10px">

                    <h4 class="col-md-4">
                        新增车辆信息
                    </h4>
                    <div class="col-md-1 col-md-offset-7">
                        <a class="btn btn-info btn-sm" >批量导入</a>
                    </div>

                </div>

            </div>
        </div>
        <form id="car-infor-form">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
                        <div class="input-group">
                            <span class="input-group-addon" id="CarNo">车牌号</span>
                            <input type="text" required="required" name="carNo" maxlength="18" class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon" id="CarColor">车辆颜色</span>
                            <input type="text" required="required" name="carColor" maxlength="18" class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2" >
                        <div class="input-group">
                            <span class="input-group-addon" id="CarPurchaseD">购买日期</span>
                            <input type="date" required="required" name="carPurchaseD" class="form-control"
                                   placeholder="必填"
                                   aria-describedby="basic-addon1">
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 10px">
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon" id="ModelType">车辆类型</span>
                            <input type="text" required="required" name="modelType" maxlength="18" class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon" id="ModelName">车辆名称</span>
                            <input type="text" required="required" name="modelName" maxlength="18" class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon" id="ModelRetailer">销售商</span>
                            <input type="text" required="required" name="modelRetailer" maxlength="18"
                                   class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon" id="ModelSeatNum">座位数</span>
                            <select class="form-control">
                                <option name="modelSeatNum">1</option>
                                <option name="modelSeatNum">2</option>
                                <option name="modelSeatNum">3</option>
                                <option name="modelSeatNum">4</option>
                                <option name="modelSeatNum">5</option>
                                <option name="modelSeatNum">6</option>
                                <option name="modelSeatNum">7</option>
                                <option name="modelSeatNum">8</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon" id="ModelFuelTank">油箱容量</span>
                            <input type="number" required="required" name="modelFuelTank" maxlength="18"
                                   class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                            <span class="input-group-addon">L</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 10px">
                    <div class="col-md-4">
                        <div class="input-group">
                            <span class="input-group-addon" id="CarEngineN">发动机号</span>
                            <input type="text" required="required" name="carEngineN" maxlength="18" class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group">
                            <span class="input-group-addon" id="CarFrameN">车架编号</span>
                            <input type="text" required="required" name="carFrameN" maxlength="18" class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon" id="CarFuelN">燃油编号</span>
                            <input type="text" required="required" name="carFuelN" maxlength="18" class="form-control"
                                   placeholder="必填" aria-describedby="basic-addon1">
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-1 col-md-offset-5" style="margin-top: 20px">
                <a class="btn btn-info" id="form-submit">提交</a>
            </div>
        </form>

    </div>
</div>
<script src="./vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="./dist/js/sb-admin-2.js"></script>

<script>
    $("#form-submit").click(function () {
        $.ajax({
            type: "POST",
            url: "./Customer/Register",
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            data: $('#car-infor-form').serializeArray(),
            success: function (dataVal) {
                if (dataVal == 1) {
                    alert("添加成功")
                    window.location.href = './add_car.jsp'
                } else {
                    alert("操作失败")
                }
            },
            error: function () {
                alert("操作失败")
//                window.location.href = './add_car.jsp'
            }
        })
    })
</script>
</body>

</html>