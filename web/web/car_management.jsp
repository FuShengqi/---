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

    <title>所有车辆</title>

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
        <div class="col-md-12">
            <h4 class="page-header">suoyoucheliang</h4>
        </div>

        <div class="row">
            <c:forEach var="ite" items="${allCar}">
                <div class="col-md-2"
                     style="border-bottom-color: #1b6d85;border: dashed; display: block; margin: 10px; padding: 5px">
                    <div style="display: block">
                        <i class="fa fa-ravelry" aria-hidden="true">品牌:
                            <c:out value="${ite.modelName}"/>
                        </i>
                    </div>

                    <div style="display: block">
                        <i class="fa fa-meetup" aria-hidden="true">车系:
                            <c:out value="${ite.modelType}"/>
                        </i>
                    </div>
                    <div style="display: block">
                        <i class="fa fa-hashtag" aria-hidden="true">牌照:
                            <span class="carNo"><c:out value="${ite.carNo}"/></span>
                        </i>
                    </div>

                    <div style="display: block">
                        <i class="fa fa-grav" aria-hidden="true">座位数:
                            <c:out value="${ite.modelSeatNum}"/>
                        </i>
                    </div>
                    <div style="display: block">
                        <i class="fa fa-tachometer" aria-hidden="true">颜色:
                            <c:out value="${ite.carColor}"/>
                        </i>
                    </div>
                    <a class="btn btn-info btn-sm carDetail">Detail</a>
                </div>
            </c:forEach>
            <div class="col-md-2"
                 style="border-bottom-color: #1b6d85;border: dashed; display: block; margin: 10px; padding: 5px">
                <div style="display: block">
                    <i class="fa fa-ravelry" aria-hidden="true">品牌:
                        BMW
                    </i>
                </div>

                <div style="display: block">
                    <i class="fa fa-meetup" aria-hidden="true">车系:
                        High
                    </i>
                </div>
                <div style="display: block">
                    <i class="fa fa-hashtag" aria-hidden="true">牌照:
                        <span class="carNo">皖N48276</span>
                    </i>
                </div>

                <div style="display: block">
                    <i class="fa fa-grav" aria-hidden="true">座位数:
                        5
                    </i>
                </div>
                <div style="display: block">
                    <i class="fa fa-tachometer" aria-hidden="true">颜色:
                        Red
                    </i>
                </div>
                <a class="btn btn-info btn-sm carDetail">Detail</a>
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

</body>
<script>
    $('.carDetail').click(function () {
        var carNo = $('.carDetail').closest('.col-md-2')
            .find('.carNo')
            .text();
        window.location.href = './car_information.jsp?carNo=' + carNo
    })
</script>

</html>