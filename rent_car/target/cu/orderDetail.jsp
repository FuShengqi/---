<%--
  Created by IntelliJ IDEA.
  User: ogame
  Date: 17-6-27
  Time: 下午6:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>

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
        <div class="row ">

            <h5 class="page-header">订单信息</h5>
            <div class="col-md-1 col-md-offset-11">
                <button id="print">打印</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <i class="fa fa-circle-o" aria-hidden="true">订单号:
                    <c:out value="${orderNo}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-user" aria-hidden="true">客户姓名:
                    <c:out value="${customerName}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-car" aria-hidden="true">车牌号:
                    <c:out value="${carNo}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-id-card" aria-hidden="true">驾驶证号:
                    <c:out value="${licenseId}"/>
                </i>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-3">
                <i class="fa fa-calendar" aria-hidden="true">租车时间:
                    <c:out value="${orderStartD}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-calendar" aria-hidden="true">还车时间:
                    <c:out value="${orderAendD}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-wrench" aria-hidden="true">开始里程:
                    <c:out value="${orderStartM}"/>
                </i>
            </div>
            <div class="col-md-3">
                <i class="fa fa-wrench" aria-hidden="true">使用里程:
                    <c:out value="${orderUseM}"/>
                </i>
            </div>
        </div>
        <hr/>
        <div class="col-md-12">
            <i>续租情况</i>
        </div>
        <table class="table table-condensed">
            <thead>
            <tr>
                <td class="text-center">续租订单号</td>
                <td class="text-center">开始时间</td>
                <td class="text-center">结束时间</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td class="text-center">
                        <c:out value="${item.orderNo}"/>
                    </td>
                    <td class="text-center">
                        <c:out value="${item.renewalStartDate}"/>
                    </td>
                    <td class="text-center">
                        <c:out value="${item.renewalEndDate}"/>
                    </td>

                </tr>
            </c:forEach>
            </tbody>

        </table>
        <hr/>
        <div class="col-md-12">
            <i>违章情况</i>
        </div>
    </div>
</div>
</body>
<!-- jQuery -->
<script src="/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/dist/js/sb-admin-2.js"></script>
<script>
    $('#print').click(function () {
        window.print()
    })
</script>
</html>

