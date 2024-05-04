<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的订单</title>
    <%@include file="/pages/common/header.jsp"%>
</head>
<style>
    #header {
        background-color: #82cb2d;
        padding: 20px;
        border-radius: 30px;
    }
    #main {
        margin-top: 20px;
        background-color: #cbf1ff;
        padding: 20px;
        border-radius: 30px;
    }

    .wel_word {
        font-size: 50px;
        margin-left: 20px;
    }

    .table {
        margin-top: 20px;
    }

    #logo_img {
        margin-left: 20px;
    }
</style>
<body>
<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
    <span class="wel_word">我的订单</span>
    <%@include file="/pages/common/login_success_menu.jsp" %>
</div>

<div id="main" class="container">
    <table class="table">
        <thead>
        <tr>
            <th>日期</th>
            <th>金额</th>
            <th>状态</th>
            <th>详情</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.myOrders}" var="order">
            <tr>
                <td>${ order.createTime }</td>
                <td>${ order.price }</td>
                <td>
                    <c:choose>
                        <c:when test="${ order.status == 0 }">
                            未发货
                        </c:when>
                        <c:when test="${ order.status == 1 }">
                            <a href="client/orderServlet?action=receivedOrder&orderId=${ order.orderId }">确认收货</a>
                        </c:when>
                        <c:when test="${ order.status == 2 }">
                            已收货
                        </c:when>
                    </c:choose>
                </td>
                <td><a href="client/orderServlet?action=showOrderItem&orderId=${ order.orderId }">查看详情</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<footer>
    <%@include file="/pages/common/footer.jsp" %>
</footer>

</body>
</html>

