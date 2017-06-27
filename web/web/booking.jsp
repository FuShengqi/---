<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>预约管理</title>
    <!-- Bootstrap Core CSS -->
    <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="./vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

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
                <h1 class="page-header">预约管理</h1>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <%--<div class="panel-heading">--%>
                        <%--预约信息--%>
                        <%--</div>--%>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="text-center">订单号</th>
                                    <th class="text-center">姓名</th>
                                    <th class="text-center">手机号</th>
                                    <th class="text-center">预约时间</th>
                                    <!--<th class="text-center">balabala</th>-->
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <c:forEach var="item" items="${list}">
                                        <td class="text-center"><a href="./check-out.jsp?orderNo=" + <c:out
                                                value="${item.orderNo}"/> >
                                            <c:out value="${item.orderNo}"/>
                                        </a></td>
                                        <td>
                                            <c:out value="${item.customerName}"/>
                                        </td>
                                        <td>
                                            <c:out value="${item.customerTel}"/>
                                        </td>
                                        <td>
                                            <c:out value="${item.orderStartD}"/>
                                        </td>
                                        <td style="width: 150px">
                                            <div class="btn-group btn-group-justified" role="group" aria-label="...">

                                                <div class="btn-group" role="group">
                                                    <a type="button" class="btn btn-primary btn-sm text-center "
                                                       href="./client_information.jsp">
                                                        <i class="fa fa-shopping-cart"></i>出车
                                                    </a>
                                                </div>
                                                <div class="btn-group" role="group">
                                                    <a type="button" class="btn btn-danger btn-sm text-center">
                                                        <i class="fa fa-trash"></i>取消</a>
                                                </div>
                                            </div>
                                        </td>
                                    </c:forEach>
                                </tr>
                                <%--<tr class="odd gradeX">--%>
                                <%--<td class="text-center"><a href="check-out.html">7435y6273642</a></td>--%>
                                <%--<td>Internet Explorer 4.0</td>--%>
                                <%--<td>Win 95+</td>--%>
                                <%--<td class="center">4</td>--%>
                                <%--<td style="width: 150px">--%>
                                <%--<div class="btn-group btn-group-justified" role="group" aria-label="...">--%>

                                <%--<div class="btn-group" role="group">--%>
                                <%--<a type="button" class="btn btn-primary btn-sm text-center " href="./client_information.jsp" >--%>
                                <%--<i class="fa fa-shopping-cart" ></i>出车--%>
                                <%--</a>--%>
                                <%--</div>--%>
                                <%--<div class="btn-group" role="group">--%>
                                <%--<a type="button" class="btn btn-danger btn-sm text-center">--%>
                                <%--<i class="fa fa-trash"></i>取消</a>--%>
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
            <!-- /.col-lg-12 -->
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="./vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="./dist/js/sb-admin-2.js"></script>
<!-- jQuery -->

<!-- Bootstrap Core JavaScript -->

<!-- Metis Menu Plugin JavaScript -->

<!-- DataTables JavaScript -->
<script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="./vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="./vendor/datatables-responsive/dataTables.responsive.js"></script>


<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>
</body>
</html>