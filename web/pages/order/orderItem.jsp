<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@include file="/pages/common/header.jsp"%>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f4f6;
            color: #333;
        }
        #header {
            background-color: #82cb2d;
            padding: 20px;
            border-radius: 30px;
        }
        #logo_img {
            width: 150px;
        }
        .wel_word {
            font-size: 50px;
            color: white;
        }
        .order-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .order-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .order-header, .order-item {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }
        .order-header:hover, .order-item:hover {
            background-color: #e2e6ea;
        }
        .order-header div, .order-item div {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .order-header div span, .order-item div span {
            font-weight: bold;
            margin-right: 10px;
        }
        .order-header div i, .order-item div i {
            color: #82cb2d;
            margin-right: 10px;
        }
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            padding: 20px;
            text-align: center;
        }
        .card-body {
            background-color: #fefefe;
            padding: 20px;
        }
        .order-item {
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        .order-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        .text-center {
            text-align: center;
        }
        .mb-4 {
            margin-bottom: 1.5rem;
        }
        .mt-4 {
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
    <span class="wel_word">订单详情</span>
    <%@include file="/pages/common/login_success_menu.jsp" %>
</div>
<div id="main1" class="container mt-4">
    <div id="main">
        <div class="order-container">
            <div class="card">
                <div class="card-header text-center">
                    <h4>订单详情</h4>
                </div>
                <div class="card-body">
                    <div class="order-header">
                        <div><i class="fa fa-file-alt"></i><span>订单编号:</span> <c:out value="${requestScope.orderItems[0].orderId}" /></div>
                        <div><i class="fa fa-user"></i><span>收货人:</span> <c:out value="${requestScope.orderItems[0].receiver}" /></div>
                        <div><i class="fa fa-phone"></i><span>电话:</span> <c:out value="${requestScope.orderItems[0].phone}" /></div>
                        <div><i class="fa fa-map-marker-alt"></i><span>收货地址:</span> <c:out value="${requestScope.orderItems[0].address}" /></div>
                    </div>
                    <div class="order-items">
                        <h5 class="text-center mb-4">商品列表</h5>
                        <c:forEach items="${requestScope.orderItems}" var="order">
                            <div class="order-item">
                                <div><i class="fa fa-box"></i><span>商品型号:</span> <c:out value="${order.name}" /></div>
                                <div><i class="fa fa-sort-numeric-up-alt"></i><span>数量:</span> <c:out value="${order.count}" /></div>
                                <div><i class="fa fa-tag"></i><span>单价:</span> <c:out value="${order.price}" /></div>
                                <div><i class="fa fa-dollar-sign"></i><span>总金额:</span> <c:out value="${order.totalPrice}" /></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</body>
</html>
