<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css" >
<script type="text/javascript" src="static/script/bootstrap.bundle.min.js"></script>
<style>
    .navbar-custom {
        background-color: #f0fcff;
        padding: 10px 0;
        border-radius: 30px;
    }
    /* 调整菜单栏字体样式 */
    .navbar-nav .nav-link {
        font-family: 'Roboto', sans-serif;
        font-weight: 700;
        color: #333;
        padding: 10px 15px;
        transition: all 0.3s ease;
        margin-right: 20px;
    }

    /* 悬停效果 */
    .navbar-nav .nav-link:hover {
        color: #007bff;
    }

    /* 激活状态 */
    .navbar-nav .nav-link.active {
        color: #007bff;
    }

    /* 调整欢迎文字样式 */
    .navbar-text {
        font-family: 'Roboto', sans-serif;
        font-weight: 400;
        color: #ff6f00;
        margin-right: 20px;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light navbar-custom">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <span class="navbar-text">欢迎<span class="um_span">${sessionScope.user.username}</span></span>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="userServlet?action=logout">注销登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="client/orderServlet?action=myOrders">我的订单</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/user/userinfo.jsp">个人信息</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="client/bikeServlet?action=pageOrder">热销榜单</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">返回主页</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
