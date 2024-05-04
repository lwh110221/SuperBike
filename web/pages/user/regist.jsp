<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        body{
        }
        #login_header {
            background-color: #c0eaf8;
            border-bottom: 1px solid rgba(203, 241, 255, 0.91);
            height: 30px;
        }
        .login_banner {
            background-image: url("static/img/background.png");
            background-size: cover;
            background-position: center;
            min-height: calc(100vh - 60px);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login_box {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 400px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.5);
        }
        .login_form label {
            font-weight: bold;
        }
        .login_form input[type="text"],
        .login_form input[type="password"] {
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .login_form input[type="submit"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }
        .login_form input[type="submit"]:hover {
            background-color: #007bff;
            border-color: #007bff;
        }
        .errorMsg {
            color: red;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id="login_header" class="bg-light py-3">
    <div class="container">
        <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px;margin-top: 15px">
    </div>
</div>
<div class="login_banner">
    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit mb-4 text-center">
                    <h1 class="mb-0">注册会员</h1>
                    <span class="errorMsg">
                        ${requestScope.msg}
                    </span>
                </div>
                <div class="form">
                    <form action="userServlet" method="post" class="login_form">
                        <input type="hidden" name="action" value="regist">
                        <div class="mb-3">
                            <label for="username" class="form-label">用户名称：</label>
                            <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="username" value="${requestScope.username}">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">用户密码：</label>
                            <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password" value="${requestScope.password}">
                        </div>
                        <div class="mb-3">
                            <label for="repwd" class="form-label">确认密码：</label>
                            <input type="password" class="form-control" id="repwd" placeholder="确认密码" name="repwd" value="${requestScope.repwd}">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">电子邮件：</label>
                            <input type="text" class="form-control" id="email" placeholder="请输入邮箱地址" name="email" value="${requestScope.email}">
                        </div>
                        <div class="mb-3 d-flex align-items-center">
                            <label for="code" class="form-label me-3">验证码：</label>
                            <input type="text" class="form-control me-3" id="code" name="code" style="width: 80px;margin-top: 18px">
                            <img id="code_img" alt="" src="kaptcha.jpg" style="width: 110px; height: 40px;">
                        </div>
                        <input type="submit" value="注册" class="btn btn-primary" id="sub_btn">
                        <a href="bikemanager/bikeServlet" class="btn btn-secondary">返回登录</a>
                        <a style="float: right" href="/Bike/" class="btn btn-secondary">返回首页</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    // 页面加载完成之后
    $(function(){
        $("#username").blur(function () {
            //1、获取用户名
            var username = this.value;
            $.getJSON("http://localhost:8080/bikestore1/userServlet","action=ajaxExistsusername&username="+username,function (data) {
                if(data.exitsUsername) {
                    $("span.errorMsg").text("用户名已存在！");
                } else {
                    $("span.errorMsg").text("用户名可用！");
                }

            });

        });

        $("#code_img").click(function () {
            this.src = "${basePath}kaptcha.jpg?d=" + new Date();
        });

        // 给注册按钮添加事件
        $("#sub_btn").click(function(){

            // 获取用户名
            var usernameValue = $("#username").val();
            // 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
            var usernameReg = /^\w{5,15}$/;
            // 验证用户信息
            if (!usernameReg.test(usernameValue)) {
                // 提示用户
                $("span.errorMsg").text("用户名不合法！");
                return false;
            }

            // 获取密码
            var passwordValue = $("#password").val();
            // 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
            var passwordReg = /^\w{5,15}$/;
            // 验证用户信息
            if (!passwordReg.test(passwordValue)) {
                // 提示用户
                $("span.errorMsg").text("密码不合法！");
                return false;
            }

            // 获取确认密码
            var repwdValue = $("#repwd").val();
            // 验证确认密码和密码一致
            if (passwordValue != repwdValue) {
                // 提示用户
                $("span.errorMsg").text("确认密码和密码不一致！");
                return false;
            }

            // 获取用户名
            var emailValue = $("#email").val();
            // 验证邮件输入是否合法。
            var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

            if (!emailReg.test(emailValue)) {
                // 提示用户
                $("span.errorMsg").text("邮件输入不合法！");
                return false;
            }
            // 获取验证码信息
            var codeValue = $("#code").val();
            // 验证验证码不为空！
            if (codeValue == "") {
                $("span.errorMsg").text("验证码不能为空！")
                return false;
            }

            return true;
        });

    });
</script>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
