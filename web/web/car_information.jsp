<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>车辆详情</title>

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
        <div class="row" >
            <div class="col-md-12">
                <h4 class="page-header">
                    <c:out value="${modelName}"/>
                    /
                    <c:out value="${modelFuelTank}"/>
                </h4>
            </div>
        </div>

        <h4>基本信息</h4>
        <hr/>
        <div class="row" style="margin-bottom: 20px">
            <div class="col-md-3">
                <i class="fa fa-ravelry" aria-hidden="true">品牌:
                    <c:out value="${modelName}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-meetup" aria-hidden="true">车系:
                    <c:out value="${modelType}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-tachometer" aria-hidden="true">颜色:
                    <c:out value="${carColor}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-calendar" aria-hidden="true">购买日期:
                    <c:out value="${carPurchaseD}"/>
                </i>
            </div>
        </div>
        <h4 style="margin-top: 10px">详细配置</h4>
        <hr/>
        <div class="row">
            <div class="col-md-3">
                <i class="fa fa-grav" aria-hidden="true">座位数:
                    <c:out value="${modelSeatNum}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-hdd-o" aria-hidden="true">油箱容量:
                    <c:out value="${modelSeatNum}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-tint" aria-hidden="true">燃油编号:
                    <c:out value="${carFuelN}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-info" aria-hidden="true">发动机号:
                    <c:out value="${carEngineN}"/>
                </i>
            </div>
        </div>
        <div class="row" style="margin-top: 10px">
            <div class="col-md-3">
                <i class="fa fa-info" aria-hidden="true">车架编号:
                    <c:out value="${carFrameN}"/>
                </i>
            </div>
        </div>

        <div class="row" style="margin-top: 10px">
            <div class="col-md-1 col-md-offset-11">
                <a type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">租车</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: auto;left: 45%;display: inline-block;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-1">
                        <button class="btn btn-primary" id="newClient">新客户</button>
                    </div>
                    <div class="col-md-1 col-md-offset-3">
                        <button class="btn btn-primary" id="accountClient">老用户</button>
                    </div>
                </div>

            </div>
        </div>
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
    $('#newClient').click(function () {
        console.log('newClient press');
        window.location.href = './client_information.jsp?carNo=' + $('#carNo').text()
    });

    $('#accountClient').click(function () {
        window.location.href = './account-rent.jsp?carNo=' + $('#carNo').text()
    })
</script>
</body>

</html>