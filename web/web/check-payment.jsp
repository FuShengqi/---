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

    <title>结算</title>

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
            <div class="col-md-12">
                <h4 class="page-header">金额结算</h4>
            </div>
            <form id="payment-form">
                <div class="row" style="margin-left: auto">
                    <div class="col-md-4">
                        <label class="control-label">基本消费</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${orderBasicF}" name="orderBasicF"
                                   class="input-xlarge" readonly>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">超时金额</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${orderTimeoutF}" name="orderTimeoutF"
                                   class="input-xlarge" readonly>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">超里程金额</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${orderMileOutF}" name="orderMileOutF"
                                   class="input-xlarge" readonly>
                        </div>

                    </div>

                </div>
                <div class="row" style="margin-left: auto; margin-top: 10px">
                    <div class="col-md-4">
                        <label class="control-label">租车押金</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${orderDeposit}" name="orderDeposit"
                                   class="input-xlarge">
                        </div>

                    </div>
                </div>

                <div class="row" style="margin-left: auto; margin-top: 10px">
                    <div class="col-md-4">
                        <label class="control-label">车损扣款</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${orderUllageF}" name="orderUllageF"
                                   class="input-xlarge">
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">违章押金</label>
                        <div class="controls">
                            <input type="number" placeholder="" name="violateDeposit" class="input-xlarge">
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">优惠金额</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${orderDiscountF}" name="orderDiscountF"
                                   class="input-xlarge">
                        </div>

                    </div>
                </div>

            </form>
            <div class="col-md-2 col-md-offset-10">
                <%--<a type="button" class="btn btn-danger" data-toggle="myModal" data-target="#myModal">付款</a>--%>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger " data-toggle="modal" data-target="#myModal">
                    付款
                </button>
            </div>

        </div>
    </div>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <span id="format"></span>
                    <br/>
                    <span id="cal"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary pay">已付款</button>
                </div>
            </div>
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
    $('.pay').click(function () {
        $.post(
            "./",
            {},
            function () {
                alert("结算成功");
                $('#myModal').modal('hide')
            },
            "json"
        )
    })
    $('#myModal').on('show.bs.modal', function (event) {
        var orderBasicF = $('#orderBasicF').val()
        var orderTimeoutF = $('#orderTimeoutF').val()
        var orderMileOutF = $('#orderMileOutF').val()
        var orderDeposit = $('#orderDeposit').val()
        var orderUllageF = $('#orderUllageF').val()
        var orderDiscountF = $('#orderDiscountF').val()
        var violateDeposit = $('#violateDeposit').val()

        var result = orderBasicF + orderTimeoutF + orderMileOutF + orderUllageF + violateDeposit - orderDeposit - orderDiscountF
        var modal = $(this)
        modal.find('.modal-title').text('应付金额');
        modal.find('.modal-body')
            .find('#format').text('应付金额=基本消费+超时金额+超里程金额+车损扣款+违章押金-租车押金-优惠金额')
        modal.find('.modal-body')
            .find('#cal')
            .text([orderBasicF, orderTimeoutF, orderMileOutF, orderUllageF, violateDeposit].join('+') + '-' + [orderDeposit, orderDiscountF].join('-') + '=' + result
            )

    })

</script>

</html>