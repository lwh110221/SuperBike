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
    <title>我的订单</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
</head>
<body>
<div id="main1" class="container">
    <div id="main">
        <table class="table">
            <thead>
            <tr>
                <th>编号</th>
                <th>书名</th>
                <th>数量</th>
                <th>单价</th>
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
