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

    <title>已出车订单</title>

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
    <%@include file="navbar.jsp"%>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h4 class="page-header">已出车订单</h4>
            </div>
            <hr />
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
                                    <th class="text-center">预计还车日</th>
                                    <th class="text-center">租车押金</th>

                                    <!--<th class="text-center">balabala</th>-->
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr class="odd gradeX">

                                        <td class="text-center"><a href="./check-out.jsp?orderNo=" + <c:out
                                                value="${item.orderNo}"/> >
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
                                            <c:out value="${item.orderPEndID}"/>
                                        </td>
                                        <td class="text-center">
                                            <c:out value="${item.orderDeposit}"/>
                                        </td>
                                        <td style="width: 150px">
                                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                                <div class="btn-group" role="group">
                                                    <a type="button" class="btn btn-primary btn-sm " data-toggle="modal"
                                                       data-target="#myModal">续租</a>
                                                </div>
                                                <div class="btn-group" role="group">
                                                    <a type="button" class="btn btn-danger btn-sm returnCar">还车</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%--<tr class="odd gradeX">--%>
                                <%--<td class="text-center"><a href="./" name="orderNo">18572398575</a></td>--%>
                                <%--<td class="text-center carNo">皖N.1859395</td>--%>
                                <%--<td class="text-center clientName">大头</td>--%>
                                <%--<td class="text-center startTime">2017-06-22</td>--%>
                                <%--<td class="text-center ">200</td>--%>
                                <%--<td class="text-center ">200</td>--%>
                                <%--<td style="width: 150px">--%>
                                <%--<div class="btn-group btn-group-justified" role="group" aria-label="...">--%>
                                <%--<div class="btn-group" role="group">--%>
                                <%--<a type="button" class="btn btn-primary btn-sm " data-toggle="modal"--%>
                                <%--data-target="#myModal">续租</a>--%>
                                <%--</div>--%>
                                <%--<div class="btn-group" role="group">--%>
                                <%--<a type="button" class="btn btn-danger btn-sm returnCar">还车</a>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</td>--%>

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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">续租</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8 col-md-offset-1">
                        <div class="row" style="margin-top: 10px">
                            <div class="col-md-6">
                                <span>客户姓名: </span>
                                <span id="clientName"></span>
                                <br/>
                                <span>车牌: </span>
                                <span id="carNo"></span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-6">
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon" id="basic-addon1">续租到</span>
                                    <input required="true" type="date" class="form-control" id="user_date"/>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4">

                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="xuzu">续租</button>
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


<!-- DataTables JavaScript -->
<script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="./vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="./vendor/datatables-responsive/dataTables.responsive.js"></script>
<script>
    $('#myModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal

        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.

        var orderNo = button.closest("tr")   // Finds the closest row <tr>
            .find("a")
            .first()
            .text();
        var carNo = button.closest("tr")
            .find(".carNo")
            .text()
        var clientName = button.closest('tr')
            .find(".clientName")
            .text()
        console.log(carNo)
        var modal = $(this)
        modal.find('.modal-title').text('订单 ' + orderNo + ' 续租');
        modal.find('.modal-body')
            .find('#clientName').text(clientName)
        modal.find('.modal-body')
            .find('#carNo')
            .text(carNo)
    })
</script>
<script>
    $('#xuzu').click(function () {
//        console.log($(this))
        console.log($(this).parent().parent().find('#orderNo').text());
        $.ajax({
            type: "POST",
            url: "./",
            data: {
                orderId: $(this).parent().parent().find('#orderNo').text(),
                renewalEndDate: $(this).parent().parent().find('#user_date').text(),
                recordCreator: "ADMIN"
            },
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            success: function (dataVal) {
                if (dataVal == 1) {
                    alert("出车成功")
                    $('#myModal').modal('hide')
                } else {
                    alert("操作失败")
                }
            },
            error: function () {
                alert("操作失败")
            }
        })
//        $.post(
//            : "./",
//            data: {
//                orderId: $(this).parent().parent().find('#orderNo').text(),
//                renewalEndDate: $(this).parent().parent().find('#user_date').text(),
//                recordCreator: "ADMIN"
//            },
//            function () {
//                alert("续租成功");
//                $('#myModal').modal('hide')
//            },
//            "json"
//        )
    })
    $('.returnCar').click(function () {
        window.location.href = "./check-out.jsp?orderNo=" + $(this).closest("tr")
                .find("a")
                .first()
                .text();
    })
</script>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</html>