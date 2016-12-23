<%@ page import="com.springapp.mvc.domain.Comment" %>
<%@ page import="com.springapp.mvc.domain.CommentCount" %>
<%@ page import="com.springapp.mvc.domain.Parameter" %>
<%@ page import="com.springapp.mvc.service.CommentService" %>
<%@ page import="com.springapp.mvc.util.DateUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
  <link href="/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
  <link href="/assets/css/style.css" rel="stylesheet" type="text/css"/>
  <link href="/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
  <link href="/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
  <%
        String hotWordStr = request.getParameter("hotWord");
        request.setAttribute("hotWordStr",hotWordStr);
  %>
</head>
<body class="page-header-fixed">

<div class="header navbar navbar-inverse navbar-fixed-top">
  <!-- BEGIN TOP NAVIGATION BAR -->
  <div class="header-inner">
    <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      <img src="/assets/img/menu-toggler.png" alt=""/>
    </a>
    <ul class="nav navbar-nav pull-right">
      <li class="dropdown user">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
           data-close-others="true">
          <img alt="" src="/assets/img/avatar1_small.jpg"/>
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
        <a href="/index">
          <i class="fa fa-home"></i>
          <span class="title">Dashboard</span>
          <span class="selected"></span>
        </a>
      </li>

      <li class="">
        <a href="/comment">
          <i class="fa fa-comments"></i>
          <span class="title">Comments</span>
        </a>
      </li>
      <li class="">
        <a href="/subscribe">
          <i class="fa fa-rss-square"></i>
          <span class="title">Subscribe</span>
        </a>
      </li>
      <li class="">
        <a href="/alert">
          <i class="fa fa-bell"></i>
          <span class="title">Alert</span>
        </a>
      </li>
    </ul>
  </div>
  <div class="page-content">
      <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="form-group col-1 pull-left">
                    <form action="/subscribe/modifyHotWord.do">
                        <h3>选择监测的游戏：</h3>
                        <select class="form-control input-sm" id="gameName" style="font-size: 20px;height: 50px" name="gameName">
                            <option value="皇室战争" selected>皇室战争</option>
                            <option value="王者荣耀">王者荣耀</option>
                            <option value="梦幻西游">梦幻西游</option>
                        </select>
                        <h3>添加您要监测的热词：(英文逗号隔开)</h3>
                        <textarea class="form-control" name="hotWord" placeholder="输入热词，英文逗号隔开"><c:if test="${hotWordStr != null}">${hotWordStr}</c:if></textarea>
                        <input type="text" name="userName" value="Joker" hidden>
                        <input type="submit" class="btn blue  btn-bolck pull-right" value="保存更改">
                    </form>
                </div>
            </div>
      </div>

      <div class="row ">
          <div class="col-md-6 col-sm-6" id="hotword" style="height: 530px;">
          </div>
      </div>
  </div>
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

<script src="/js/echarts-2.2.7/src/echarts-all.js"></script>

<script type="text/javascript">
    var month = new Array();
    month.push('12-16');
    month.push('12-17');
    month.push('12-18');
    month.push('12-19');
    month.push('12-20');
    month.push('12-21');
    month.push('12-22');
    var hotWordName = new Array();
    var hotWordList = new Array();
    <%
        Map<String, List<Integer>> map = (Map<String, List<Integer>>) request.getAttribute("hotWordMap");
        if(map == null) return;
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

</body>
</html>