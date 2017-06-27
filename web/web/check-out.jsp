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

    <title>还车结算</title>

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
            <div class="col-md-12">
                <h4>订单结算</h4>
            </div>

        </div>
        <hr/>
        <form>
            <div class="row">
                <div class="col-md-4">
                    <label class="control-label">订单编号</label>
                    <div class="controls">
                        <input type="text" placeholder="" value="${orderNo}" name="orderNo" class="input-xlarge"
                               readonly>
                    </div>


                </div>
                <div class="col-md-4">
                    <label class="control-label">客户姓名</label>
                    <div class="controls">
                        <input type="text" placeholder="" value="${customerName}" name="customerName"
                               class="input-xlarge" readonly>
                    </div>

                </div>
                <div class="col-md-4">
                    <label class="control-label">电话号码</label>
                    <div class="controls">
                        <input type="number" placeholder="" value="${customerTel}" name="customerTel"
                               class="input-xlarge">
                    </div>

                </div>
            </div>

            <div class="row" style="margin-top: 10px">
                <div class="col-md-4">
                    <label class="control-label">车牌号</label>
                    <div class="controls">
                        <input type="number" placeholder="" value="${carNo}" name="carNo" class="input-xlarge" readonly>
                    </div>


                </div>
                <div class="col-md-4">
                    <label class="control-label">租车日期</label>
                    <div class="controls">
                        <input type="number" placeholder="" value="${orderStartD}" name="orderStartD"
                               class="input-xlarge" readonly>
                    </div>


                </div>
                <div class="col-md-4">
                    <label class="control-label">还车日期</label>
                    <div class="controls">
                        <input type="date" required="required" placeholder="" name="orderAEndD" class="input-xlarge">
                    </div>


                </div>
            </div>
            <div class="row" style="margin-top: 10px">
                <div class="col-md-4">
                    <label class="control-label">开始里程</label>
                    <div class="controls">
                        <input type="text" placeholder="" value="${orderStartM}" name="orderStartM" class="input-xlarge"
                               readonly>
                    </div>


                </div>
                <div class="col-md-4">
                    <label class="control-label">结束里程</label>
                    <div class="controls">
                        <input type="number" required="required" placeholder="" name="orderEndM" class="input-xlarge">
                    </div>


                </div>
                <%--<div class="col-md-4">--%>
                <%--<label class="control-label">优惠里程</label>--%>
                <%--<div class="controls">--%>
                <%--<input type="number" required="true" placeholder="" class="input-xlarge" >--%>
                <%--</div>--%>


                <%--</div>--%>

            </div>


            <div class="col-md-2 col-md-offset-10">
                <button type="submit" class="btn btn-primary">结算</button>
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

</body>

</html>