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
                            <th class="text-center">租车押金</th>
                            <!--<th class="text-center">balabala</th>-->
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="odd gradeX">
                            <td class="text-center"><a href="./">18572398575</a></td>
                            <td class="text-center">皖N.1859395</td>
                            <td class="text-center">大头</td>
                            <td class="text-center">2017-06-22</td>
                            <td class="text-center">200</td>
                            <td style="width: 150px">
                                <div class="btn-group btn-group-justified" role="group" aria-label="...">

                                    <div class="btn-group" role="group">
                                        <a type="button" class="btn btn-primary btn-sm " href="client_information.html" >续租</a>
                                    </div>
                                    <div class="btn-group" role="group">
                                        <a type="button" class="btn btn-danger btn-sm" href="check-out.html">还车</a>
                                    </div>
                                </div>
                            </td>
                            <!--<td style="width: 100px">-->
                                <!--<div class="btn-group btn-group-justified" role="group" aria-label="...">-->
                                    <!--<div class="btn-group" role="group">-->
                                        <!--<a type="button" class="btn btn-primary btn-sm " href="./check-out.html" >续租</a>-->
                                        <!--<a type="button" class="btn btn-primary btn-sm " href="./check-out.html" >还车结算</a>-->
                                    <!--</div>-->
                                    <!--&lt;!&ndash;<div class="btn-group" role="group">&ndash;&gt;-->
                                        <!--&lt;!&ndash;<button type="button" class="btn btn-danger btn-sm">取消</button>&ndash;&gt;-->
                                    <!--&lt;!&ndash;</div>&ndash;&gt;-->
                                <!--</div>-->
                            <!--</td>-->
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</html>