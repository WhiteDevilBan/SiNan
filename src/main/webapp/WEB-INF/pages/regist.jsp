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
    <script src="lib/jquery/jquery-2.0.3.min.js"></script>
    <%--<script src="lib/backbone/underscore-min.js"></script>--%>
    <script src="js/settings.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.css">
</head>
<body>
<div class="single-widget-container">
    <section class="widget login-widget">
        <header class="text-align-center">
            <h2>欢迎注册游戏司南系统！</h2>
        </header>
        <div class="body">
            <div id="content" class="container">

                <div class="row">
                    <!-- 注册-->
                    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                        <div class="well no-padding">

                            <form action="php/demo-register.php" id="smart-form-register"
                                  class="smart-form client-form">
                                <header>
                                    Registration is FREE
                                </header>

                                <fieldset style="width: 430px">
                                    <section>
                                        <label class="input"> <i class="icon-append fa fa-user"></i>
                                            <input type="text" name="username" placeholder="Username">
                                            <b class="tooltip tooltip-bottom-right">Needed to enter the website</b>
                                        </label>
                                    </section>

                                    <section>
                                        <label class="input"> <i class="icon-append fa fa-envelope"></i>
                                            <input type="email" name="email" placeholder="Email address">
                                            <b class="tooltip tooltip-bottom-right">Needed to verify your
                                                account</b>
                                        </label>
                                    </section>

                                    <section>
                                        <label class="input"> <i class="icon-append fa fa-lock"></i>
                                            <input type="password" name="password" placeholder="Password"
                                                   id="password">
                                            <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                        </label>
                                    </section>

                                    <section>
                                        <label class="input"> <i class="icon-append fa fa-lock"></i>
                                            <input type="password" name="passwordConfirm"
                                                   placeholder="Confirm password">
                                            <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                        </label>
                                    </section>
                                </fieldset>
                                <footer style="width: 430px;margin: inherit">
                                    <button type="submit" class="btn btn-primary">
                                        Register
                                    </button>
                                </footer>

                                <div class="message">
                                    <i class="fa fa-check"></i>

                                    <p>
                                        Thank you for your registration!
                                    </p>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>