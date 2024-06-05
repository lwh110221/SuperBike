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
        #topbar {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        #logo_img {
            width: 50px;
            margin-right: 10px;
        }
        .wel_word {
            font-size: 24px;
            font-weight: bold;
        }
        #main {
            margin-top: 20px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            margin-top: 20px;
        }
        th, td {
            text-align: center;
        }
        .btn-outline-light {
            color: #fef1f1;
            background-color: #0a53be;
            font-weight: bold;
        }
        .btn-outline-light:hover {
            background-color: #2299ff;
            color: white;
        }
    </style>
</head>
<body>

<header>
    <div id="topbar" class="py-2">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-auto d-flex align-items-center">
                    <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
                    <span class="wel_word">自行车热销榜单</span>
                </div>
                <div class="col-auto">
                    <a href="index.jsp" class="btn btn-outline-light">返回主页</a>
                </div>
            </div>
        </div>
    </div>
</header>

<div id="main" class="container">
    <table class="table table-hover table-bordered">
        <thead class="table-dark">
        <tr>
            <th scope="col">排名</th>
            <th scope="col">型号</th>
            <th scope="col">价格</th>
            <th scope="col">品牌</th>
            <th scope="col" style="color: red">销量</th>
        </tr>
        </thead>
        <tbody>
        <% int i = 1; %>
        <c:forEach items="${requestScope.page.items}" var="bike">
            <tr>
                <td><%= i++ %></td>
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
