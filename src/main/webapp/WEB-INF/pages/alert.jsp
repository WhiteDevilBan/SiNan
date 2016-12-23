<%@ page import="com.springapp.mvc.domain.Rule" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.springapp.mvc.service.RuleService" %>
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
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro.css" />
    <link rel="stylesheet" href="assets/plugins/data-tables/DT_bootstrap.css" />
    <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="favicon.ico" />
    <%
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
        RuleService service = context.getBean(RuleService.class);
//        List<Rule> ruleList = service.getAllRule();
//        request.setAttribute();
    %>
</head>
<body class="page-header-fixed">

<div class="header navbar navbar-inverse navbar-fixed-top">
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

      <div class="col-md-6">

          <!-- BEGIN EXAMPLE TABLE PORTLET-->
          <div class="portlet box blue">
              <div class="portlet-title">
                  <div class="caption"><i class="fa fa-edit"></i>规则列表</div>
              </div>
              <div class="portlet-body">
                  <form action="/rule/updateRule.do">
                  <div class="table-toolbar">
                      <div class="btn-group">
                          <button id="sample_editable_1_new" class="btn green">
                              添加新规则 <i class="fa fa-plus"></i>
                          </button>
                      </div>
                      <div class="btn-group pull-right">
                          <input type="submit" class="btn red  btn-bolck pull-right" value="更新规则列表">
                      </div>
                  </div>
                  <table class="table table-striped " id="sample_editable_1">
                      <thead>
                      <tr>
                          <th>类型(评论数 or 热词数 or 负面评论数)</th>
                          <th>大于或小于(> or <)</th>
                          <th>数量</th>
                          <th>警报类型</th>
                          <th>编辑</th>
                          <th>删除</th>
                      </tr>
                      </thead>
                      <tbody>
                      <tr>
                          <td>
                              评论数
                          </td>
                          <td>
                             <
                          </td>
                          <td>21</td>
                          <td class="center">warning</td>
                          <td><a class="edit" href="javascript:;">编辑</a></td>
                          <td><a class="delete" href="javascript:;">删除</a></td>
                      </tr>
                      <tr>
                          <td>负面评论数</td>
                          <td>></td>
                          <td>49</td>
                          <td class="center">error</td>
                          <td><a class="edit" href="javascript:;">编辑</a></td>
                          <td><a class="delete" href="javascript:;">删除</a></td>
                      </tr>
                      </tbody>
                  </table>
                  </form>
              </div>
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

<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="assets/plugins/data-tables/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/scripts/app.js"></script>
<script src="assets/scripts/table-editable.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
        TableEditable.init();
    });
</script></body>
</html>