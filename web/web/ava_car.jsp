<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>可用车辆</title>

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
        <!--<div class="row">-->
            <!--<div class="col-lg-12">-->
                <!--<h3 class="page-header">可用车辆</h3>-->
            <!--</div>-->
        <!--</div>-->
        <div class="row" style="margin-top: 30px">
            <div class="col-md-4">
                <p>
                    条件查询
                </p>
            </div>
            <div class="col-md-1 ">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon" id="s-car-type">车型</span>
                    <select class="form-control">
                        <option> </option>
                        <option>A1</option>
                        <option>A2</option>
                        <option>A3</option>
                        <option>B1</option>
                        <option>B2</option>
                        <option>C1</option>
                        <option>C2</option>
                        <option>C3</option>
                    </select>
                </div>
            </div>
            <div class="col-md-1 ">
                <div class="input-group input-group-sm">
                    <span class="input-group-addon" id="s-seats">座位数</span>
                    <select class="form-control">
                        <option> </option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>5+</option>

                    </select>
                </div>
            </div>
            <div class="col-md-1">
                <button type="button" class="btn btn-default dropdown-toggle fa fa-search"></button>

            </div>
        </div>
        <hr />
        <div class="row">
            <a href="./car_information.jsp">
            <div class="col-sm-6 col-md-1">
                <div class="thumbnail">
                    <img src="http://7xil86.com2.z0.glb.qiniucdn.com/uploads/images/2015/11/2015-11-03-5.jpg" alt="...">
                    <div >
                        <h5 class="text-center" id="car-no" style="margin-bottom: 0px">皖N48276</h5>
                        <p class="text-center" id="car-name" style="margin: 0px">小赚风</p>
                        <p class="text-center" id="car-type" style="margin: 0px">ssdf</p>

                    </div>
                </div>
            </div>
            </a>



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

</html>