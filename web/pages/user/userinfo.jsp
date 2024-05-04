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
    <title>我的个人信息</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        body {
            padding-top: 20px;
            background-color: #f8f9fa;
        }
        #header {
            background-color: #82cb2d;
            padding: 20px;
            border-radius: 30px;
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
        }
        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
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
        <table class="table">
            <thead>
            <tr>
                <th>用户名</th>
                <th>密码</th>
                <th>电子邮箱</th>
                <th>收货地址</th>
                <th>收货人</th>
                <th>电话</th>
                <th colspan="2">修改</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="display: none;"><input name="id" type="text" value="${sessionScope.user.id}"/></td>
                <td><input name="username" type="text" value="${sessionScope.user.username}" class="form-control" readonly="readonly"/></td>
                <td><input name="password" type="text" value="${sessionScope.user.password}" class="form-control"/></td>
                <td><input name="email" type="text" value="${sessionScope.user.email}" class="form-control"/></td>
                <td><input name="address" type="text" value="${sessionScope.user.address}" class="form-control"/></td>
                <td><input name="receiver" type="text" value="${sessionScope.user.receiver}" class="form-control"/></td>
                <td><input name="phone" type="text" value="${sessionScope.user.phone}" class="form-control"/></td>
                <td><input type="submit" class="btn btn-primary" value="提交" onclick="onSubmit()"/></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<script>
    // 当用户点击提交按钮时触发的函数
    function onSubmit() {
        // 这里可以添加一些其他的表单验证逻辑

        // 弹出提交成功的提示框
        alert("SuperBikeTips：提交修改成功！");
    }
</script>
<footer>
    <%@include file="/pages/common/footer.jsp"%>
</footer>
</body>
</html>