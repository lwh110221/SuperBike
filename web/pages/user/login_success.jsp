<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
    <meta charset="UTF-8">
    <%@include file="/pages/common/header.jsp"%>
</head>
    <body>
        <div id="header">
            <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
            <%@include file="/pages/common/login_success_menu.jsp"%>
        </div>

        <div id="main">

            <h1>欢迎回来 <a href="index.jsp">转到主页</a></h1>

        </div>

        <%@include file="/pages/common/footer.jsp"%>
</body>
</html>
