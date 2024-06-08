<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>编辑用户信息</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f4f6;
            color: #333;
        }
        #main1 {
            width: 80%;
            margin: 0 auto;
            height: 100%;
        }
        #main {
            margin-top: 20px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #82cb2d;
        }
        .btn-primary {
            background-color: #82cb2d;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #6ba22a;
        }
    </style>
</head>
<body>

<div id="main1">
</div>
<div id="main" class="container">
    <form action="bikemanager/UserServlet" method="post">
        <input type="hidden" name="pageNo" value="${param.pageNo}">
        <input type="hidden" name="action" value="${empty param.id ? "add":"update"}"/>
        <input type="hidden" name="id" value="${requestScope.user.id}"/>
        <div class="form-group">
            <label for="username">用户名</label>
            <input name="username" type="text" id="username" class="form-control" value="${requestScope.user.username}"/>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input name="password" type="password" id="password" class="form-control" value="${requestScope.user.password}"/>
        </div>
        <div class="form-group">
            <label for="email">电子邮箱</label>
            <input name="email" type="text" id="email" class="form-control" value="${requestScope.user.email}"/>
        </div>
        <div class="form-group">
            <label for="address">收货地址</label>
            <input name="address" type="text" id="address" class="form-control" value="${requestScope.user.address}"/>
        </div>
        <div class="form-group">
            <label for="receiver">收货人</label>
            <input name="receiver" type="text" id="receiver" class="form-control" value="${requestScope.user.receiver}"/>
        </div>
        <div class="form-group">
            <label for="phone">电话</label>
            <input name="phone" type="text" id="phone" class="form-control" value="${requestScope.user.phone}"/>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="提交"/>
        </div>
    </form>
</div>

</body>
</html>
