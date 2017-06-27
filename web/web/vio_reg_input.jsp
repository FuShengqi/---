<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>违章信息录入</title>

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
        <div class="row page-header">
            <h4>违章信息录入</h4>
        </div>
        <form>
            <div class="row">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">车牌</span>
                        <input type="text" required="true" name="carNo" maxlength="18" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">违章时间</span>
                        <input type="date" required="true" name="violateDate" maxlength="18" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">违章事件</span>
                        <input type="text" required="true" name="violateEvent" maxlength="18" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">扣分</span>
                        <input type="number" name="violateMarks" min="0" required="true" maxlength="18"
                               class="form-control" placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">违章罚款</span>
                        <input type="number" name="violateFee" required="true" maxlength="18" class="form-control"
                               placeholder="必填" aria-describedby="basic-addon1">
                    </div>
                </div>

            </div>
            <div class="col-md-1 col-md-offset-11">
                <button type="submit" class="btn btn-primary">录入</button>
            </div>
        </form>
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