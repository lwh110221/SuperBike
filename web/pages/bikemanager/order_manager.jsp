<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
</head>

<style>
    #main1 {
        width: 90%;
        height: 100%;
        background-color: #cbf1ff;
        margin: 0 auto;
        border-radius: 30px;
    }
    #main {
        margin-top: 20px;
        text-align: center;
        border-radius: 30px;
    }

</style>
<body>

<div id="main1">
    <div id="main">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>订单号</th>
                <th>日期</th>
                <th>用户</th>
                <th>金额</th>
                <th>发货</th>
                <th>详情</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.orders}" var="order">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.createTime}</td>
                    <td>${sessionScope.user.username}</td>
                    <td>${order.price}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status==0}">
                                <a href="bikemanager/orderServlet?action=sendOrder&orderId=${order.orderId}" class="btn btn-primary">确认发货</a>
                            </c:when>
                            <c:when test="${order.status == 1}">
                                等待用户签收
                            </c:when>
                            <c:when test="${order.status == 2}">
                                已签收
                            </c:when>
                        </c:choose>
                    </td>
                    <td><a href="client/orderServlet?action=showOrderItem&orderId=${order.orderId}" class="btn btn-info">查看详情</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
