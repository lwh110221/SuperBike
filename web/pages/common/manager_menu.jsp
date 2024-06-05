<!-- manager_menu.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css">
<script type="text/javascript" src="static/script/bootstrap.bundle.min.js"></script>

<style>
    .navbar-custom {
        background-color: #343a40; /* 深色背景 */
        border-radius: 50px; /* 圆角 */
        margin-top: 20px; /* 与头部的距离 */
    }
    .navbar-custom .navbar-nav .nav-link {
        color: #ffffff; /* 白色文字 */
    }
    .navbar-custom .navbar-nav .nav-link:hover {
        color: #ffc107; /* 悬停时的文字颜色 */
    }
    .navbar-custom .navbar-brand {
        color: #ffffff;
    }
    .navbar-custom .navbar-brand:hover {
        color: #ffc107;
    }
    .form-check-input {
        width: 1.5em;
        height: 1.5em;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <span class="navbar-brand">后台管理</span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="bikemanager/bikeServlet?action=page">货架管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bikemanager/orderServlet?action=orders">订单管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bikemanager/UserServlet?action=page">用户管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bikemanager/orderServlet?action=showTotal">总账单</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bikemanager/UserServlet?action=showPermissions">权限设置</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">返回主页</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
