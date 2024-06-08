<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>我的个人信息</title>
    <%@include file="/pages/common/header.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 20px;
            background-color: #f8f9fa;
        }
        #header {
            background-color: #82cb2d;
            padding: 20px;
            border-radius: 30px;
            margin-bottom: 20px;
        }
        #logo_img {
            width: 150px;
        }
        .wel_word {
            font-size: 50px;
            margin-left: 20px;
        }
        #main {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 100px; /* Ensure space for footer */
        }
        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px 0;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
    <span class="wel_word">个人信息</span>
    <%@include file="/pages/common/login_success_menu.jsp"%>
</div>

<div id="main" class="container">
    <form action="userServlet" method="post">
        <input type="hidden" name="action" value="update"/>
        <div class="form-group">
            <label for="username">用户名</label>
            <input id="username" name="username" type="text" value="${sessionScope.user.username}" class="form-control" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input id="password" name="password" type="text" value="${sessionScope.user.password}" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="email">电子邮箱</label>
            <input id="email" name="email" type="text" value="${sessionScope.user.email}" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="address">收货地址</label>
            <input id="address" name="address" type="text" value="${sessionScope.user.address}" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="receiver">收货人</label>
            <input id="receiver" name="receiver" type="text" value="${sessionScope.user.receiver}" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="phone">电话</label>
            <input id="phone" name="phone" type="text" value="${sessionScope.user.phone}" class="form-control"/>
        </div>
        <div class="form-group text-center">
            <input type="submit" class="btn btn-primary" value="提交" onclick="onSubmit()"/>
        </div>
    </form>
</div>
<script>
    function onSubmit() {
        alert("SuperBikeTips：提交修改成功！");
    }
</script>
<footer>
    <%@include file="/pages/common/footer.jsp"%>
</footer>
</body>
</html>

