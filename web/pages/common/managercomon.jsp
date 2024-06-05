<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css" >
<script type="text/javascript" src="static/script/bootstrap.bundle.min.js"></script>
<style>
    .container2 {
        background-color: #82cb2d;
        height: 180px;
        border-radius: 50px;
        padding: 20px;
        width: 85%;
        margin: 0 auto;
    }
    .m-0 {
        font-size: 50px;
        color: white;
    }
    footer {
        position: fixed;
        bottom: 0;
        width: 100%;
    }
    #menu {
        margin-top: -100px;
    }
</style>
<body>
<div class="container2">
    <div id="header" class="d-flex justify-content-between align-items-center py-3">
        <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
    </div>
    <div id="menu">
        <%@include file="/pages/common/manager_menu.jsp"%>
    </div>
</div>
<footer>
    <%@include file="/pages/common/footer.jsp"%>
</footer>
</body>
