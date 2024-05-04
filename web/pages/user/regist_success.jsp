<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册成功页面</title>
    <%@include file="/pages/common/header.jsp"%>
    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }

        h1 a {
            color:red;
        }
    </style>
</head>
<body>
<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
    <span class="wel_word"></span>
    <%@include file="/pages/common/login_success_menu.jsp"%>
</div>

<div id="main">

    <h1>注册成功! <a href="index.jsp">转到主页</a></h1>

</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
