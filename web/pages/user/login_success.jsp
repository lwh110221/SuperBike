<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录成功</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        #header {
            text-align: center;
            height: 200px;
            background-color: #82cb2d;
        }

        #logo_img {
            width: 150px;
            float: left;
        }

        .display-4 {
            font-size: 6em;
            color: #333;
        }

        #main {
            text-align: center;
            margin-top: 50px;
        }

        h1 {
            font-size: 2em;
            color: #333;
        }

        h1 a {
            color: #007bff;
            text-decoration: none;
        }

        h1 a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
</div>

<div id="main" class="container">
    <h1 class="display-4">欢迎回来</h1>
    <a href="index.jsp" class="btn btn-primary btn-lg">前往主页</a>
</div>

<%@include file="/pages/common/footer.jsp"%>

</body>
</html>
