<%@ page import="com.springapp.mvc.domain.Comment" %>
<%@ page import="com.springapp.mvc.domain.CommentCount" %>
<%@ page import="com.springapp.mvc.domain.Parameter" %>
<%@ page import="com.springapp.mvc.service.CommentService" %>
<%@ page import="com.springapp.mvc.util.DateUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8"/>
    <title>手游司南系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <meta name="MobileOptimized" content="320">
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <%
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
        CommentService service = context.getBean(CommentService.class);
        Parameter param = new Parameter();
        String gameName = request.getParameter("gameName");
        String store = request.getParameter("store");
        param.setGameName(gameName);
        param.setStore(store);
        String type = request.getParameter("type");
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 1 : Integer.parseInt(pageNoStr);
        param.setPageNo(pageNo);
        param.setOffset((pageNo - 1) * 10);
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

        int goodCommentCount = 0;
        int badCommentCount = 0;
        if (type == null) {
            param.setType(1);
            goodCommentCount = service.getCommentCount(param);
            param.setType(2);
            badCommentCount = service.getCommentCount(param);
        } else if (type.equals("2")) {
            param.setType(2);
            badCommentCount = service.getCommentCount(param);
        } else if (type.equals("1")) {
            param.setType(1);
            goodCommentCount = service.getCommentCount(param);
        }
        List<Comment> commentList = service.getCommentList(param);
        int totalCount = goodCommentCount+badCommentCount;
        request.setAttribute("commentList", commentList);

        String href;
        if (gameName == null) {
            href = "comment?";
        } else {
            href = "comment?gameName=" + gameName + "&store=" + store;
        }

        CommentCount star = service.getCommentStarCount(param);


    %>
</head>
<body class="page-header-fixed">

<div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
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
                    <i class="fa fa-comments"></i>
                    <span class="title">Comments</span>
                </a>
            </li>
            <li class="">
                <a href="subscribe">
                    <i class="fa fa-rss-square"></i>
                    <span class="title">Subscribe</span>
                </a>
            </li>
            <li class="">
                <a href="alert">
                    <i class="fa fa-bell"></i>
                    <span class="title">Alert</span>
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
                        <a href="index">Home</a>
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

        <%--评论数，正文从这开始--%>
        <div class="row">

            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="dashboard-stat green">
                    <div class="visual">
                        <i class="fa fa-comments"></i>
                    </div>
                    <div class="details">
                        <div class="number">
                            <%--29--%>
                            <%=goodCommentCount%>
                            <!-- 好评数-->
                        </div>
                        <div class="desc">
                            Yestoday's Good Comments
                        </div>
                    </div>
                    <a class="more" href="<%=href%>&type=1">
                        查看更多... <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="dashboard-stat yellow">
                    <div class="visual">
                        <i class="fa fa-comments"></i>
                    </div>
                    <div class="details">
                        <div class="number">
                            <%--22--%>
                            <%=badCommentCount%>
                            <!-- 差评数-->
                        </div>
                        <div class="desc">
                            Yestoday's Bad Comments
                        </div>
                    </div>
                    <a class="more" href="<%=href%>&type=2">
                        查看更多... <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>

        </div>
        <div class="row ">
            <div class="col-md-6 col-sm-6">
                <div class="portlet">
                    <div class="portlet-title line">
                        <div class="caption"><i class="fa fa-comments"></i>Comments</div>
                    </div>
                    <div class="portlet-body" id="chats">
                        <div class="scroller" style="height: 700px;" data-always-visible="1" data-rail-visible1="1">
                            <ul class="chats">
                                <pg:pager items="100" maxIndexPages="10" maxPageItems="10">
                                    <c:forEach items="${commentList}" var="comment">
                                        <li class="in">
                                            <img class="avatar img-responsive" alt="" src="assets/img/avatar1.jpg"/>

                                            <div class="message">
                                                <span class="arrow"></span>
                                                <a href="#" class="name">${comment.author}</a>
                                                <span class="datetime"> @ ${comment.commentTimeStr}</span>
                                                <span class="score"
                                                      style="float: right;font-size: 24px">${comment.score/10}星</span>
											<span class="body">
                                                    ${comment.content}
                                            </span>
                                            </div>
                                        </li>
                                    </c:forEach>
                                    <pg:index>
                                        <pg:first>
                                            <a href="comment">首页</a>
                                        </pg:first>
                                        <pg:prev>
                                            <a href="comment">上一页</a>
                                        </pg:prev>
                                        <pg:pages>
                                            <c:choose>
                                                <c:when test="${pageNumber eq currentPageNumber}">
                                                    <%=pageNumber%>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="comment?&pageNo=<%=pageNumber%>"><%=pageNumber%>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </pg:pages>
                                        <pg:next>
                                            <a href="<%=pageUrl%>">下一页</a>
                                        </pg:next>
                                        <pg:last>
                                            <a href="comment">尾页</a>
                                        </pg:last>
                                    </pg:index>
                                </pg:pager>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- END PORTLET-->
            </div>
            <div class="col-md-6 col-sm-6" id="starBar" style="height: 600px">
            </div>
        </div>
    </div>
    <!-- END PAGE -->
</div>
<div class="footer">
    <div class="footer-inner">
        CopyRight by Bzz. View More @ <a>https://github.com/WhiteDevilBan</a>
    </div>
    <div class="footer-tools">
			<span class="go-top">
			<i class="fa fa-angle-up"></i>
			</span>
    </div>
</div>

<script src="js/echarts-2.2.7/src/echarts-all.js"></script>
<script type="text/javascript">
    var starBar = echarts.init(document.getElementById('starBar'));
    var option = {
        title: {
            text: '各评分分布',
            subtext: ''
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['评分数量']
        },

        calculable: true,
        xAxis: [
            {
                type: 'category',
                data: ['一星', '二星', '三星', '四星', '五星']
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '评分量',
                type: 'bar',
                data: [<%=star.getCount1()%>, <%=star.getCount2()%>, <%=star.getCount3()%>, <%=star.getCount4()%>, <%=star.getCount5()%>]
            }
        ]
    };
    starBar.setOption(option);
</script>
</body>
</html>