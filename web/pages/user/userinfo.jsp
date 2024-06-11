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
</head>
<body class="bg-light">
<div class="container my-5">
    <div class="text-white p-4 rounded mb-4" style="background-color: #82cb2d;">
        <div class="d-flex align-items-center">
            <img id="logo_img" alt="Logo" src="static/img/logo.jpg" class="me-3" style="width: 100px;">
            <h1 class="display-5 mb-0">个人信息</h1>
        </div>
        <%@include file="/pages/common/login_success_menu.jsp"%>
    </div>

    <div class="bg-white p-4 rounded shadow-sm">
        <form action="userServlet" method="post">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="id" value="${sessionScope.user.id}"/>
            <div class="mb-3">
                <label for="username" class="form-label">用户名</label>
                <input name="username" type="text" value="${sessionScope.user.username}" class="form-control" readonly/>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">密码</label>
                <input name="password" type="text" value="${sessionScope.user.password}" class="form-control"/>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">电子邮箱</label>
                <input name="email" type="text" value="${sessionScope.user.email}" class="form-control"/>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">收货地址</label>
                <input name="address" type="text" value="${sessionScope.user.address}" class="form-control"/>
            </div>
            <div class="mb-3">
                <label for="receiver" class="form-label">收货人</label>
                <input name="receiver" type="text" value="${sessionScope.user.receiver}" class="form-control"/>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">电话</label>
                <input name="phone" type="text" value="${sessionScope.user.phone}" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary" onclick="onSubmit()">提交</button>
        </form>
    </div>
</div>

<script>
    // 当用户点击提交按钮时触发的函数
    function onSubmit() {
        // 弹出提交成功的提示框
        alert("SuperBikeTips：提交修改成功！");
    }
</script>
<footer class="bg-dark text-white text-center py-3 mt-4">
    <%@include file="/pages/common/footer.jsp"%>
</footer>
</body>
</html>
