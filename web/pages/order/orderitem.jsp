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
    <%@include file="/pages/common/header.jsp"%>
</head>
<style>
    #header {
        background-color: #82cb2d;
        padding: 20px;
        border-radius: 30px;
    }
    .wel_word {
        font-size: 50px;
        margin-left: 20px;
    }
</style>
<body>
<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
    <span class="wel_word">我的订单</span>
    <%@include file="/pages/common/login_success_menu.jsp" %>
</div>
<div id="main1" class="container mt-4">
    <div id="main">
        <table class="table table-striped table-bordered table-hover">
            <thead class="table-dark">
            <tr>
                <th>编号</th>
                <th>型号</th>
                <th>数量</th>
                <th>单价</th>
                <th>收货地址</th>
                <th>收货人</th>
                <th>电话</th>
                <th>总金额</th>
                <th>订单编号</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.orderItems}" var="order">
                <tr>
                    <td>${ order.id}</td>
                    <td>${ order.name }</td>
                    <td>${ order.count }</td>
                    <td>${ order.price }</td>
                    <td>${sessionScope.user.address}</td>
                    <td>${sessionScope.user.receiver}</td>
                    <td>${sessionScope.user.phone}</td>
                    <td>${ order.totalPrice }</td>
                    <td>${ order.orderId }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>



</body>
</html>
