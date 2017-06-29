<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
    ArrayList list = new ArrayList();
    Map<String, String> dic = new HashMap<String, String>();
    dic.put("orderNo", "7236752553");
    dic.put("orderStartD", "2016-67-90");

    list.add(dic);
%>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>预约管理</title>
    <!-- Bootstrap Core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                                <c:forEach var="item" items="${list}">
                                <tr class="odd gradeX">

                                    <td class="text-center"><a class="orderNoo" href="/check-out.jsp?orderNo=<c:out
                                                value="${item.orderNo}"/>">
                                            <c:out value="${item.orderNo}"/>
                                        </a></td>
                                        <td class="text-center">
                                            <c:out value="${item.customerName}"/>
                                        </td class="text-center">
                                        <td class="text-center">
                                            <c:out value="${item.customerTel}"/>
                                        </td class="text-center">
                                        <td class="text-center">
                                            <c:out value="${item.orderStartDate}"/>
                                        </td class="text-center">
                                        <td style="width: 150px">
                                            <div class="btn-group btn-group-justified" role="group" aria-label="...">

                                                <div class="btn-group" role="group">
                                                    <a type="button"
                                                       class="btn btn-primary btn-sm text-center car-rent-press"
                                                       href="/client_information.jsp?orderNo=<c:out value="${item.orderNo}"/>">
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
<script src="/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/dist/js/sb-admin-2.js"></script>
<!-- jQuery -->

<!-- Bootstrap Core JavaScript -->

<!-- Metis Menu Plugin JavaScript -->

<!-- DataTables JavaScript -->
<script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>

<%--<script>--%>
<%--$('.car-rent-press').click(function () {--%>
<%--var orderNo = $(this).closest('tr')--%>
<%--.find('.orderNoo')--%>
<%--.text()--%>
<%--$.ajax({--%>
<%--type: "POST",--%>
<%--url: "/client_information.jsp",--%>
<%--async: false,--%>
<%--contentType: "application/json; charset=utf-8",--%>
<%--dataType: "text",--%>
<%--data: {--%>
<%--orderNo: orderNo--%>
<%--},--%>
<%--})--%>


<%--})--%>
<%--</script>--%>
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