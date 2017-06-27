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
    <%@include file="navbar.jsp" %>

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
                <div class="col-md-1 col-sm-3">
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon" id="s-car-type">车型</span>
                        <select class="form-control">
                            <option></option>
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
                <div class="col-md-1 col-sm-3 ">
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon" id="s-seats">座位数</span>
                        <select class="form-control">
                            <option></option>
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
            <hr/>
            <div class="row">
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
                            皖N48276
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
                    <a class="btn btn-info btn-sm">zuche</a>
                </div>
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
                            皖N48276
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
                    <a class="btn btn-info btn-sm">zuche</a>
                </div>
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
                            皖N48276
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
                    <a class="btn btn-info btn-sm">zuche</a>
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

</body>

</html>