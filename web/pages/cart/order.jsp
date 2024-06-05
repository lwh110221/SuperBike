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
        <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
        <h1 class="wel_word">提交订单</h1>
    </div>
    <%@include file="/pages/common/login_success_menu.jsp"%>
</head>
<style>
    body, html, div, table, tbody, tr, th, td, input {
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
    }

    /* Header styling */
    #header {
        background-color: #82cb2d;
        color: #fff;
        padding: 10px 0;
        text-align: center;
        height: 170px;
        border-radius: 20px;
    }

    #logo_img {
        width: 150px;
        float: left;
    }

    .wel_word {
        float: left;
        font-size: 60px;
        margin-left: 20px;
        margin-top: 50px;
    }

    #main {
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgb(203, 241, 255);
    }

    /* Table styling */
    #order_table {
        width: 100%;
        border-collapse: collapse;
    }

    #order_table th, #order_table td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    #order_table th {
        background-color: #f2f2f2;
    }

    #order_table .total_label {
        text-align: right;
        font-weight: bold;
    }

    #order_table .total_amount {
        font-weight: bold;
        color: crimson;
    }

    .submit_button {
        text-align: center;
        padding-top: 20px;
    }

    .submit_button input[type="submit"] {
        padding: 10px 20px;
        background-color: #ff8400;
        color: #0a0a0a;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .submit_button input[type="submit"]:hover {
        background-color: #a4ee20;
    }
</style>
<body>

<div id="main">
    <form action="client/orderServlet?action=createOrder" method="post">
        <table id="order_table">
            <thead>
            <tr>
                <th>名称</th>
                <th>数量</th>
                <th>单价</th>
                <th>金额</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty selectedItems}">
                <c:forEach items="${selectedItems}" var="entry">
                    <tr>
                        <td>${entry.name}</td>
                        <td>
                            <input style="width: 70px;border: none; text-align: center;" type="text" value="${entry.count}" readonly="readonly">
                        </td>
                        <td>${entry.price}</td>
                        <td>${entry.totalPrice}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="3" class="total_label">总金额：</td>
                <td class="total_amount">${totalPrice} 元</td>
            </tr>
            <tr>
                <td colspan="4" class="submit_button">
                    <input type="submit" value="确认提交订单">
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<script>
    var paymentAmount = '${totalPrice}';
    sessionStorage.setItem('paymentAmount', paymentAmount);

    document.addEventListener("DOMContentLoaded", function() {
        var submitButton = document.querySelector('.submit_button input[type="submit"]');
        submitButton.addEventListener('click', function(event) {
            var receiver = '${sessionScope.user.receiver}';
            var address = '${sessionScope.user.address}';
            var phone = '${sessionScope.user.phone}';
            if (!receiver || !address || !phone) {
                event.preventDefault();
                var confirmation = confirm("无法提交订单，收货信息不完整。点击确定前往填写收货信息页面。");
                if (confirmation) {
                    window.location.href = 'pages/user/userinfo.jsp';
                }
            }
        });
    });
</script>



<%@include file="/pages/common/footer.jsp"%>

</body>
</html>
