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

    <title>违章处理</title>

    <!-- Bootstrap Core CSS -->
    <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="./vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
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
                <h4 class="page-header">已还车订单</h4>

            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!--<div class="panel-heading">-->

                        <!--</div>-->
                        <!-- /.panel-heading -->
                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="text-center">订单号</th>
                                    <th class="text-center">车牌号</th>
                                    <th class="text-center">客户姓名</th>
                                    <th class="text-center">出车日期</th>
                                    <th class="text-center">还车日期</th>
                                    <th class="text-center">消费金额</th>
                                    <th class="text-center">违章日期</th>

                                    <th class="text-center">违章押金</th>
                                    <th class="text-center">违章扣款</th>
                                    <!--<th class="text-center">balabala</th>-->
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr>
                                        <td class="text-center"><a href="./check-out.jsp?orderNo=<c:out
                                                value="${item.orderNo}"/>">
                                            <c:out value="${item.orderNo}"/>
                                        </a>
                                        </td>
                                        <td class="text-center carNo">
                                            <c:out value="${item.carId}"/>
                                        </td>
                                        <td class="text-center clientName">
                                            <c:out value="${item.customerName}"/>
                                        </td>
                                        <td class="text-center startTime">
                                            <c:out value="${item.orderStartD}"/>
                                        </td>
                                        <td class="text-center">
                                            <c:out value="${item.orderAEndD}"/>
                                        </td>
                                        <td class="text-center">
                                            <c:out value="${item.violateDate}"/>//消费金额
                                        </td>
                                        <td class="text-center">
                                            <c:out value="${item.violateDate}"/>
                                        </td>
                                        <td class="text-center">
                                            <c:out value="${item.violateDeposit}"/>
                                        </td>
                                        <td class="text-center">
                                            <c:out value="${item.violateFee }"/>
                                        </td>
                                        <td style="width: 100px">
                                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                                <div class="btn-group" role="group">
                                                    <button type="button" class="btn btn-danger btn-sm"
                                                            data-toggle="modal" data-target="#myModal" data-orderno="'">
                                                        退还押金
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%--<tr class="odd gradeX">--%>
                                <%--<td class="text-center"><a href="./" class="order-no">18572398575</a></td>--%>
                                <%--<td class="text-center">皖N.1859395</td>--%>
                                <%--<td class="text-center">大头</td>--%>
                                <%--<td class="text-center">2017-06-22</td>--%>
                                <%--<td class="text-center">2017-06-22</td>--%>
                                <%--<td class="text-center">2017-06-22</td>--%>
                                <%--<td class="text-center">200</td>--%>
                                <%--<td class="text-center yaj">200</td>--%>
                                <%--<td class="text-center kouk">2022</td>--%>
                                <%--<td style="width: 100px">--%>
                                <%--<div class="btn-group btn-group-justified" role="group" aria-label="...">--%>
                                <%--<div class="btn-group" role="group">--%>
                                <%--<button type="button" class="btn btn-danger btn-sm" id="rent-finish"--%>
                                <%--data-toggle="modal" data-target="#myModal" data-orderno="'">--%>
                                <%--退还押金</button>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</td>--%>
                                <%--<!--<td style="width: 100px">-->--%>
                                <%--<!--<div class="btn-group btn-group-justified" role="group" aria-label="...">-->--%>
                                <%--<!--<div class="btn-group" role="group">-->--%>
                                <%--<!--<a type="button" class="btn btn-primary btn-sm " href="./check-out.html" >续租</a>-->--%>
                                <%--<!--<a type="button" class="btn btn-primary btn-sm " href="./check-out.html" >还车结算</a>-->--%>
                                <%--<!--</div>-->--%>
                                <%--<!--&lt;!&ndash;<div class="btn-group" role="group">&ndash;&gt;-->--%>
                                <%--<!--&lt;!&ndash;<button type="button" class="btn btn-danger btn-sm">取消</button>&ndash;&gt;-->--%>
                                <%--<!--&lt;!&ndash;</div>&ndash;&gt;-->--%>
                                <%--<!--</div>-->--%>
                                <%--<!--</td>-->--%>
                                <%--</tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">退还押金</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8 col-md-offset-1">
                        <div class="page-header">
                            <b>订单号</b> <b id="orderNo"></b>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <b>违章押金:</b> <b id="yaj"></b>
                            </div>
                            <div class="col-md-4">
                                <b>违章扣款:</b> <b id="kouk"></b>
                            </div>
                            <div class="col-md-4">
                                <b>退还押金:</b> <b id="tuik"></b>
                            </div>
                        </div>
                        <div class="col-md-4">

                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="drawback">已退押金</button>
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

    $('#myModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        console.log(button)
        var orderNo = button.closest('tr')
            .find('.order-no')
            .text();
        var yaj = button.closest('tr')
            .find('.yaj')
            .text();
        var kouk = button.closest('tr')
            .find('.kouk')
            .text();
        var modal = $(this);
        modal.find('#orderNo').text(orderNo);
        modal.find('#yaj').text(yaj);
        modal.find('#kouk').text(kouk);
        modal.find('#tuik').text(yaj - kouk)

    });

    $("#drawback").click(function () {
        var modal = $('.modal');
        var orderNo = modal.find('#orderNo').text(orderNo);
        $.ajax({
            type: "POST",
            url: "./",
            data: {
                orderNo: orderNo
            },
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            success: function (dataVal) {
                if (dataVal == 1) {
                    alert("操作成功");
                    $('#myModal').modal('hide')
                } else {
                    alert("操作失败")
                }
            },
            error: function () {
                alert("操作失败")
            }
        })

    });
</script>

</body>
<!-- DataTables JavaScript -->
<script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="./vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="./vendor/datatables-responsive/dataTables.responsive.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</html>