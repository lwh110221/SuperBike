<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/4/30
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>自行车热销榜单</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        body {
            padding-top: 4rem;
            background-color: #fffefc;
        }
        #logo_img {
            width: 150px;
        }
        .wel_word {
            font-size: 2.5rem;
            font-weight: bold;
            color: #f9fcff;
            margin-bottom: 20px;
        }
        #topbar {
            background-color: #82cb2d;
            color: #ffffff;
        }
        #topbar a {
            color: #ffffff;
        }
        #main table {
            height: 350px;
        }
        #main table td {
            padding: 0.75rem;
            vertical-align: middle;
        }
        #main table tr:first-child {
            font-weight: bold;
            background-color: #f8f9fa;
        }
        .btn-outline-light{
            background-color: #cbf1ff;
            position: fixed;
            right: 10%;
        }
    </style>
</head>
<body>

<header>
    <div id="topbar" class="py-2">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                    <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
                    <span class="wel_word">自行车热销榜单</span>
                </div>
                <div class="col-auto">
                    <a style="color: #000000" href="index.jsp" class="btn btn-outline-light">返回主页</a>
                </div>
            </div>
        </div>
    </div>
</header>

<div id="main" class="container">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">排名</th>
            <th scope="col">型号</th>
            <th scope="col">价格</th>
            <th scope="col">品牌</th>
            <th scope="col" style="color: red">销量</th>
        </tr>
        </thead>
        <tbody>
        <%int i=1;%>
        <c:forEach items="${requestScope.page.items}" var="bike">
            <tr>
                <td><%=i++%></td>
                <td>${bike.name}</td>
                <td>${bike.price}</td>
                <td>${bike.brand}</td>
                <td style="color: red">${bike.sales}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="/pages/common/footer.jsp"%>

</body>
</html>
