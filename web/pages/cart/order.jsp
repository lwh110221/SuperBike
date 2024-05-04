<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提交订单</title>
    <%@include file="/pages/common/header.jsp"%>
    <div id="header">
        <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
        <span class="wel_word">提交订单</span>
        <%@include file="/pages/common/login_success_menu.jsp"%>
    </div>
</head>
<body>

<div id="main">
    <form action="client/orderServlet?action=createOrder" method="post">
        <table>
            <tr>
                <td>名称</td>
                <td>数量</td>
                <td>单价</td>
                <td>金额</td>
            </tr>

            <td style="display: none;">
                总金额：<input id="money" TYPE="text" NAME="money" size="6" value="${sessionScope.cart.totalPrice}" readonly="true"
                              style="border:none;
                                    background-color:transparent;
                                    width: 90px;
                                    text-align-all: center;
                                    color: crimson">
                <label for="money"></label>元
            </td>


            <c:if test="${not empty sessionScope.cart.items}">
                <c:forEach items="${sessionScope.cart.items}" var="entry">
                    <tr>
                        <td>${entry.value.name}</td>
                        <td>
                            <input class="updateCount" style="width: 70px;" bikeId="${entry.value.id}" type="text" value="${entry.value.count}" readonly="true">
                        </td>
                        <td>${entry.value.price}</td>
                        <td>${entry.value.totalPrice}</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="确认提交订单"></td>
                    </tr>
                </c:forEach>
            </c:if>

        </table>
    </form>
</div>
<script>
    // 存储支付金额到 sessionStorage
    var paymentAmount = '${sessionScope.cart.totalPrice}';
    sessionStorage.setItem('paymentAmount', paymentAmount);
</script>



<%@include file="/pages/common/footer.jsp"%>

</body>
</body>
</html>
