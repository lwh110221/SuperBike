<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
                    <td>${order.price}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 0}">
                                <button class="btn btn-primary sendOrder" data-order-id="${order.orderId}">确认发货</button>
                            </c:when>
                            <c:when test="${order.status == 1}">
                                <span class="badge bg-warning">等待用户签收</span>
                            </c:when>
                            <c:when test="${order.status == 2}">
                                <span class="badge bg-success">已签收</span>
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <a href="client/orderServlet?action=showOrderItem&orderId=${order.orderId}" class="btn btn-info">查看详情</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<script>
    $(document).ready(function() {
        $('.sendOrder').click(function(e) {
            e.preventDefault();
            var orderId = $(this).data('orderId');
            var button = $(this);
            $.ajax({
                url: 'bikemanager/orderServlet',
                type: 'GET',
                data: {
                    action: 'sendOrder',
                    orderId: orderId
                },
                success: function(response) {
                    button.closest('td').html('<span class="badge bg-warning">等待用户签收</span>');
                },
                error: function() {
                    alert('请求失败');
                }
            });
        });
    });
</script>

</body>
</html>
