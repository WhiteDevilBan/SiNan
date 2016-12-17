<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>游戏司南系统</title>
    <link href="css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <script src="lib/jquery/jquery-2.0.3.min.js"> </script>
    <script src="lib/backbone/underscore-min.js"></script>
    <script src="js/settings.js"> </script>
</head>
<body>
<div class="single-widget-container">
    <section class="widget login-widget">
        <header class="text-align-center">
            <h3>欢迎登陆游戏司南系统！</h3>
        </header>
        <div class="body">
            <form class="no-margin"
                  action="/user/login.do" method="post">
                <fieldset>
                    <div class="form-group no-margin">
                        <label for="email" >Email</label>

                        <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <i class="eicon-user"></i>
                                </span>
                            <input id="email" type="email" class="form-control input-lg"
                                   placeholder="Your Email" name="email">
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="password" >Password</label>

                        <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                            <input id="password" type="password" class="form-control input-lg"
                                   placeholder="Your Password" name="password">
                        </div>

                    </div>
                </fieldset>
                <div class="form-actions">
                    <button type="submit" class="btn btn-block btn-lg btn-danger">
                        <small>登  	陆</small>
                    </button>
                    <div class="forgot"><a class="register" href="regist">欢迎注册</a></div>
                </div>
            </form>
        </div>
    </section>
</div>
</body>
</html>