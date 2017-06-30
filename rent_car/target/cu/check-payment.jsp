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
    <%@include file="navbar.jsp" %>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-header">金额结算</h4>
            </div>
            <form id="payment-form">
                <div class="row" style="margin-left: auto">
                    <div class="col-md-4">
                        <label class="control-label">订单号</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${orderNo}" name="orderNo"
                                   class="input-xlarge" readonly>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">基本消费</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${basicConsume}" name="basicConsume" id="basicConsume"
                                   class="input-xlarge" readonly>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">超时金额</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${timeoutConsume}" name="timeoutConsume" id="timeoutConsume"
                                   class="input-xlarge" readonly>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">超里程金额</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${kmoutConsume}" name="kmoutConsume" id="kmoutConsume"
                                   class="input-xlarge" readonly>
                        </div>

                    </div>

                </div>
                <div class="row" style="margin-left: auto; margin-top: 10px">
                    <div class="col-md-4">
                        <label class="control-label">租车押金</label>
                        <div class="controls">
                            <input type="number" placeholder="" value="${rentDeposit}" name="rentDeposit" id="rentDeposit"
                                   class="input-xlarge">
                        </div>

                    </div>
                </div>

                <div class="row" style="margin-left: auto; margin-top: 10px">
                    <div class="col-md-4">
                        <label class="control-label">车损扣款</label>
                        <div class="controls">
                            <input type="number" placeholder=""  name="damageDeductions" id="damageDeductions"
                                   class="input-xlarge">
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">违章押金</label>
                        <div class="controls">
                            <input type="number" placeholder="" name="violateDeposit" id="violateDeposit" class="input-xlarge">
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">优惠金额</label>
                        <div class="controls">
                            <input type="number" placeholder=""  name="discountAmount" id="discountAmount"
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
                    <h4 class="modal-title" id="myModalLabel">付款</h4>
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

<script src="/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/dist/js/sb-admin-2.js"></script>

<script>
    $('.pay').click(function () {
        var data = $('#payment-form').serializeArray();
        var jsonData = {}
        for (var i = 0; i <data.length; ++i) {
            jsonData[data[i].name] = data[i].value
        }
        $.ajax({
            type: "POST",
            url: "/Order/BackCar",
            data: JSON.stringify(jsonData),
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            success: function (dataVal) {
                dataVal = JSON.parse(dataVal)
                if (dataVal.RESULT_KEY == 1) {
                    alert("结账成功");
                    window.location.href = "/Order/Query/orderStatus?orderStatus=2"
                } else {
                    alert("操作失败")
                }
            },
            error: function () {
                alert("操作失败")
            }
        })
    });
    $('#myModal').on('show.bs.modal', function (event) {
        console.log($('#basicConsume').val())
        var orderBasicF = parseFloat($('#basicConsume').val());
        var orderTimeoutF = parseFloat($('#timeoutConsume').val());
        var orderMileOutF = parseFloat($('#kmoutConsume').val());
        var orderDeposit = parseFloat($('#rentDeposit').val());
        var damageDeductions = parseFloat($('#damageDeductions').val());
        var orderDiscountF = parseFloat($('#discountAmount').val());
        var violateDeposit = parseFloat($('#violateDeposit').val());

        var result = orderBasicF + orderTimeoutF + orderMileOutF + damageDeductions + violateDeposit - orderDeposit - orderDiscountF;
        var modal = $(this);
        modal.find('.modal-title').text('应付金额');
        modal.find('.modal-body')
            .find('#format').text('应付金额=基本消费+超时金额+超里程金额+车损扣款+违章押金-租车押金-优惠金额');
        modal.find('.modal-body')
            .find('#cal')
            .text([orderBasicF, orderTimeoutF, orderMileOutF, damageDeductions, violateDeposit].join('+') + '-' + [orderDeposit, orderDiscountF].join('-') + '=' + result
            )

    })

</script>

</html>