
<%@ page contentType="text/html;charset=UTF-8"%>

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">租车后台管理</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">


        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i>账户信息</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
                </li>
                <li class="divider"></li>
                <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="搜索...">
                        <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
                    <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> 总览</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-fw"></i> 订单管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./booking.jsp">预约管理</a>
                        </li>
                        <li>
                            <a href="./renting.jsp">已出车订单</a>
                        </li>
                        <li>
                            <a href="./back.jsp">已还车订单</a>
                        </li>
                        <li>
                            <a href="./violate.jsp">违章处理订单</a>
                        </li>
                        <li>
                            <a href="./finish.jsp">完成订单</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-car fa-fw"></i> 车辆管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./add_car.jsp">新增车辆</a>
                        </li>
                        <li>
                            <a href="./ava_car.jsp">可用车辆</a>
                        </li>

                        <li>
                            <a href="./car_management.jsp">所有车辆</a>
                        </li>

                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-pencil fa-fw"></i> 违章信息管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./vio_reg_input.jsp">违章信息录入</a>
                        </li>
                        <li>
                            <a href="./vio_reg.jsp">违章信息查询</a>
                        </li>



                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-line-chart fa-fw"></i> 统计信息<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./car_statistic.jsp">车辆统计</a>
                        </li>
                        <li>
                            <a href="./finan_statistic.jsp">财务统计</a>
                        </li>

                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>