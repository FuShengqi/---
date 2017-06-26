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
                                <th class="text-center">违章日期</th>
                                <th class="text-center">消费金额</th>
                                <th class="text-center">违章押金</th>
                                <th class="text-center">违章扣款</th>
                                <!--<th class="text-center">balabala</th>-->
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="odd gradeX">
                                <td class="text-center" id="order-no"><a href="./">18572398575</a></td>
                                <td class="text-center">皖N.1859395</td>
                                <td class="text-center">大头</td>
                                <td class="text-center">2017-06-22</td>
                                <td class="text-center">2017-06-22</td>
                                <td class="text-center">2017-06-22</td>
                                <td class="text-center">200</td>
                                <td class="text-center">200</td>
                                <td class="text-center">2022</td>
                                <td style="width: 100px">
                                    <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                        <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-danger btn-sm" id="rent-finish"
                                                    data-toggle="modal" data-target="#myModal" data-orderno="'">
                                                退还押金</button>
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
                            <b>订单号</b> <b id="order">847587</b>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <b>违章押金:</b> <b>987</b>
                            </div>
                            <div class="col-md-4">
                                <b>违章扣款:</b> <b>200</b>
                            </div>
                            <div class="col-md-4">
                                <b>退换押金:</b> <b>289</b>
                            </div>
                        </div>
                        <div class="col-md-4">

                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">已退押金</button>
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
    $(function () {
        $( "dialog" ).dialog( "close" );
    })
    $(".btn").click(function() {
        var item = $(this).closest("tr")   // Finds the closest row <tr>
            .find("a")
            .text();         // Retrieves the text within <td>

        console.log(item)
    });
</script>

</body>

</html>