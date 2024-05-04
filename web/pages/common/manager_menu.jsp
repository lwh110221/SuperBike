<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css" >
<script type="text/javascript" src="static/script/bootstrap.bundle.min.js"></script>

<style>
    #navbarNav{
        justify-content: center; /* 导航栏链接右对齐 */
    }
    .navbar {
        box-shadow: 0 2px 4px rgb(164, 238, 32); /* 导航栏阴影 */
        padding: 0.5rem 1rem; /* 导航栏内边距 */
        margin-bottom: 1rem; /* 导航栏外边距 */
        width: 75%;
        margin: 0 auto;
        height: 55px;
    }
    .navbar-nav .nav-link {
        color: #78b411; /* 导航链接文字颜色 */
        font-weight: bold; /* 导航链接文字粗细 */
        padding: 0.5rem 1rem; /* 导航链接内边距 */
        margin: 0 0.5rem; /* 导航链接外边距 */
        border-radius: 50px;
        transition: all 0.3s ease;
    }

    .navbar-nav .nav-link:hover {
        background-color: rgba(164, 238, 32, 0.65); /* 鼠标悬停时导航链接背景色 */
        color: #101111; /* 鼠标悬停时导航链接文字颜色 */
    }

    .navbar-nav .nav-item.active .nav-link {
        color: #fbf6f6; /* 激活状态导航链接文字颜色 */
    }

    .navbar-toggler {
        border: none; /* 导航栏切换按钮边框 */
        outline: none; /* 导航栏切换按钮轮廓 */
    }
    #navbar-out{
        border: 1px solid #a4ee20; /* 导航栏边框 */
        border-radius: 50px; /* 导航栏圆角 */
        background-color: #b6d4fe;
    }
    .container-fluid{
        padding: 0;
        background-color: rgba(182, 212, 254, 0);
    }
    .nav-link{
        color: #78b411;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar-out">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="manager/bikeServlet?action=page">货架管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manager/orderServlet?action=orders">订单管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manager/UserServlet?action=page">用户管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manager/orderServlet?action=showTotal">总账单</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">返回主页</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
