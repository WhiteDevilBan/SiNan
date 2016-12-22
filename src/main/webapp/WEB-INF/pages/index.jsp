<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springapp.mvc.domain.FeelingEntry" %>
<%@ page import="com.springapp.mvc.domain.Parameter" %>
<%@ page import="com.springapp.mvc.service.CommentService" %>
<%@ page import="com.springapp.mvc.util.DateUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springapp.mvc.domain.CommentCount" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8"/>
    <title>手游司南系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <meta name="MobileOptimized" content="320">
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="img/favicon.ico"/>

    <%
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
        CommentService service = context.getBean(CommentService.class);
        Parameter param = new Parameter();
        param.setType(0);
        String gameName = request.getParameter("gameName");
        request.setAttribute("gameName",gameName);
        String store = request.getParameter("store");
        param.setGameName(gameName);
        param.setStore(store);
        String startTime = request.getParameter("start");
        String endTime = request.getParameter("end");
        if (startTime == null) {
            startTime = DateUtil.format(DateUtil.addDay(DateUtil.parse(DateUtil.getNow()), -1));
        } else {
            startTime = DateUtil.getDateStr(startTime);
        }
        if (endTime == null) {
            endTime = DateUtil.getNow();//yestoday
        } else {
            endTime = DateUtil.getDateStr(endTime);
        }

        param.setStartTime(startTime);
        param.setEndTime(endTime);

        int total = service.getCommentCount(param);

        String href;
        if (gameName == null) {
            href = "comment";
        } else {
            href = "comment?gameName=" + gameName + "&store=" + store;
        }

        List<FeelingEntry> feelingEntryList = service.getFeelingLineCount(param);
        List<String> month = new ArrayList();
        List<Integer> goodLine = new ArrayList();
        List<Integer> badLine = new ArrayList();

        for (FeelingEntry entry : feelingEntryList) {
            if (entry.getType() == 1) {
                month.add(entry.getCommentTime());
                goodLine.add(entry.getCount());
            } else if (entry.getType() == 2) {
                badLine.add(entry.getCount());
            }
        }

        List<CommentCount> commentList = service.getCommentCountWithoutTime(param);
        Map<String,List<Integer>> map = service.getHotWordCount();

    %>
</head>
<body class="page-header-fixed">
<div class="header navbar navbar-inverse navbar-fixed-top">
    <div class="header-inner">
        <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <img src="assets/img/menu-toggler.png" alt=""/>
        </a>
        <ul class="nav navbar-nav pull-right">
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                   data-close-others="true">
                    <img alt="" src="assets/img/avatar1_small.jpg"/>
                    <span class="username">Joker</span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="extra_profile.html"><i class="fa fa-user"></i> My Profile</a></li>
                    <li><a href="page_calendar.html"><i class="fa fa-calendar"></i> My Calendar</a></li>
                    <li><a href="inbox.html"><i class="fa fa-envelope"></i> My Inbox <span
                            class="badge badge-danger">3</span></a></li>
                    <li><a href="#"><i class="fa fa-tasks"></i> My Tasks <span class="badge badge-success">7</span></a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="javascript:;" id="trigger_fullscreen"><i class="fa fa-move"></i> Full Screen</a></li>
                    <!-- 锁屏->登录界面 -->
                    <li><a href="extra_lock.html"><i class="fa fa-lock"></i> Lock Screen</a></li>
                    <li><a href="login.html"><i class="fa fa-key"></i> Log Out</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div class="clearfix"></div>
<div class="page-container">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu">
            <li>
                <!-- 隐藏菜单 -->
                <div class="sidebar-toggler hidden-phone"></div>
            </li>
            <li class="start active ">
                <a href="index">
                    <i class="fa fa-home"></i>
                    <span class="title">Dashboard</span>
                    <span class="selected"></span>
                </a>
            </li>
            <li class="">
                <a href="comment">
                    <i class="fa fa-comment"></i>
                    <span class="title">Comments</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-md-12">
                <h3 class="page-title">
                    Dashboard
                    <small>手游下的数据仓库</small>
                </h3>
                <ul class="page-breadcrumb breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="index.html">Home</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li><a href="#">Dashboard</a></li>

                    <div class="form-group col-2 pull-right">
                        <button type="button" class="btn blue" style="height: 30px" onclick="location.href='?gameName='+document.getElementById('gameName').value+
                        '&store='+document.getElementById('store').value">查看
                        </button>
                    </div>
                    <div class="form-group col-1 pull-right">
                        <select class="form-control input-sm" id="gameName">
                            <option value="皇室战争" selected>皇室战争</option>
                            <option value="王者荣耀">王者荣耀</option>
                            <option value="梦幻西游">梦幻西游</option>
                        </select>
                    </div>
                    <div class="form-group col-1 pull-right">
                        <select class="form-control input-sm" id="store">
                            <option value="meizu" selected>魅族应用中心</option>
                            <option value="qq">应用宝</option>
                            <option value="Apple Store">Apple Store</option>
                        </select>
                    </div>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="dashboard-stat blue">
                    <div class="visual">
                        <i class="fa fa-comments"></i>
                    </div>
                    <div class="details">
                        <div class="number">
                            <%=total%>
                            <!-- 每日新评论数-->
                        </div>
                        <div class="desc">
                            Yestoday's New Comments
                        </div>
                    </div>
                    <a class="more" href="<%=href%>">
                        查看更多... <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 col-sm-6" id="feelingline" style="height: 400px">

            </div>
            <div class="col-md-6 col-sm-6" id="storefeelingbar" style="height: 400px;">
            </div>
        </div>

        <div class="row ">
            <div class="col-md-6 col-sm-6" style="text-align: center">

                <c:if test="${gameName != null}">
                    <h4 class="pull-left"><b>热词词云：</b></h4>
                    <img src="img/<%=gameName%>.png" height="400px">
                </c:if>
            </div>

            <div class="col-md-6 col-sm-6" id="hotword" style="height: 400px;">
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer-inner">
        CopyRight by Bzz.
    </div>
    <div class="footer-tools">
			<span class="go-top">
			<i class="fa fa-angle-up"></i>
			</span>
    </div>
</div>
<script type="text/javascript">
    var month = new Array();
    var good = new Array();
    var bad = new Array();
    var hotWordName = new Array();
    var hotWordList = new Array();
    <%
        for(int i=0;i<month.size();i++){
    %>
            month[<%=i%>] = '<%=month.get(i)%>';
            good[<%=i%>] = <%=goodLine.get(i)%>;
            bad[<%=i%>] = <%=badLine.get(i)%>;
    <%
        }
        int c = 0;
        for(String hotWord:map.keySet()){
    %>
            hotWordName[<%=c%>] = '<%=hotWord%>';
    <%
            List<Integer> count = map.get(hotWord);
    %>
            var hotWord = {};
            hotWord.name='<%=hotWord%>';
            hotWord.type = 'line';
            hotWord.data = <%=count%>;
            hotWordList[<%=c%>] = hotWord;
    <%
            c++;
        }
    %>
</script>
<script src="js/echarts-2.2.7/src/echarts-all.js"></script>
<script type="text/javascript">
    var starBar = echarts.init(document.getElementById('feelingline'));
    var starBaroption = {
        title: {
            text: '情感走势',
            subtext: '过去一周'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['好评量', '差评量']
        },

        calculable: true,
        xAxis: [
            {
                type: 'category',
                data: month
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '好评量',
                type: 'line',
                data: bad
            },
            {
                name: '差评量',
                type: 'line',
                data: good
            }
        ]
    };
    starBar.setOption(starBaroption);
</script>
<script type="text/javascript">
    var bar = echarts.init(document.getElementById('storefeelingbar'))
    var baroption = {
        title: {
            text: '各应用商店情感趋势',
            subtext: ''
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['差评','好评']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable: true,
        xAxis: [
            {
                type: 'category',
                data: ['<%=commentList.get(0).getStore()%>','<%=commentList.get(1).getStore()%>','<%=commentList.get(2).getStore()%>']
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '差评量',
                type: 'bar',
                data: [<%=commentList.get(0).getGoodCount()%>,<%=commentList.get(1).getGoodCount()%>,<%=commentList.get(2).getGoodCount()%>]
            },
            {
                name: '好评量',
                type: 'bar',
                data: [<%=commentList.get(0).getBadCount()%>,<%=commentList.get(1).getBadCount()%>,<%=commentList.get(2).getBadCount()%>]
            }
        ]
    };
    bar.setOption(baroption);
</script>
<script type="text/javascript">
    var hotWordLine = echarts.init(document.getElementById('hotword'));
    var hotWordoption = {
        title: {
            text: '热词走势',
            subtext: '过去一周'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: hotWordName
        },

        calculable: true,
        xAxis: [
            {
                type: 'category',
                data: month
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: hotWordList
    };
    hotWordLine.setOption(hotWordoption);
</script>
<!--[if lt IE 9]>
<script src="assets/plugins/respond.min.js"></script>
<script src="assets/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
<script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
<script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="assets/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="assets/plugins/flot/jquery.flot.js" type="text/javascript"></script>
<script src="assets/plugins/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<script src="assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="assets/scripts/app.js" type="text/javascript"></script>
<script src="assets/scripts/index.js" type="text/javascript"></script>
<script src="assets/scripts/tasks.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
        Index.init();
        Index.initJQVMAP(); // init index page's custom scripts
        Index.initCalendar(); // init index page's custom scripts
        Index.initCharts(); // init index page's custom scripts
        Index.initChat();
        Index.initMiniCharts();
        Index.initDashboardDaterange();
        Index.initIntro();
        Tasks.initDashboardWidget();
    });
</script>
</body>
</html>