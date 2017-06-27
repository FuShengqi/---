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

    <title>已还车订单</title>

    <!-- Bootstrap Core CSS -->
    <link href="./vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
                                    <%--<th class="text-center">消费金额</th>--%>
                                    <th class="text-center">违章押金</th>
                                    <!--<th class="text-center">balabala</th>-->
                                    <!--<th class="text-center">操作</th>-->
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr>
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
                                            <c:out value="${item.orderAEndD}"/>
                                        </td>
                                        <td class="text-center">
                                            <c:out value="${item.iolateDeposit}"/>
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

                                </tbody>
                            </table>
                        </div>
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

<!-- DataTables JavaScript -->
<script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="./vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="./vendor/datatables-responsive/dataTables.responsive.js"></script>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</body>

</html>