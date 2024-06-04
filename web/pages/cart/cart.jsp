<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <%@include file="/pages/common/header.jsp"%>
</head>
<style>
    body {
        background-color: #f8f9fa;
    }
    #header {
        background-color: #82cb2d;
        color: #ffffff;
        padding: 10px 0;
        border-radius: 8px;
        box-shadow: 0 0 10px rgb(254, 229, 202);
        height: 215px;
    }
    #header img {
        max-width: 150px;
    }
    #main {
        background-color: #ffffff;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 0 10px rgb(254, 229, 202);
    }
    .cart_info {
        margin-top: 20px;
        text-align: right;
    }
    .cart_span {
        margin-left: 10px;
    }
    .b_count {
        color: #ff0000;
        font-weight: bold;
        font-size: large;
    }
    .b_price {
        color: #ff0000;
        font-weight: bold;
        font-size: large;
    }
</style>
<body>
<div id="header" class="container">
    <div class="row align-items-center">
        <div class="col-md-3">
            <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
        </div>
        <div class="col-md-6">
            <h1 class="text-center">购物车</h1>
        </div>
        <%@include file="/pages/common/login_success_menu.jsp"%>
    </div>
</div>

<div id="main" class="container mt-5">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">商品名称</th>
            <th scope="col">数量</th>
            <th scope="col">单价</th>
            <th scope="col">金额</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>

        <c:if test="${empty sessionScope.cart.items}">
            <tr>
                <td colspan="5"><a href="index.jsp">当前购物车为空，请前往首页挑选</a></td>
            </tr>
        </c:if>

        <c:if test="${not empty sessionScope.cart.items}">
            <c:forEach items="${sessionScope.cart.items}" var="entry">
                <tr>
                    <td>${entry.value.name}</td>
                    <td>
                        <input class="form-control updateCount" style="width: 70px;" bikeId="${entry.value.id}" type="text" value="${entry.value.count}">
                    </td>
                    <td>${entry.value.price}</td>
                    <td>${entry.value.totalPrice}</td>
                    <td><a class="deleteItem btn btn-danger" href="cartServlet?action=deleteItem&id=${entry.value.id}">删除</a></td>
                </tr>
            </c:forEach>
        </c:if>

        </tbody>
    </table>
    <c:if test="${not empty sessionScope.cart.items}">
        <div class="cart_info">
            <span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount}</span>辆自行车</span>
            <span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice}</span>元</span>
            <span class="cart_span"><a id="clearCart" class="btn btn-warning" href="cartServlet?action=clearItem">清空购物车</a></span>
            <span class="cart_span"><a class="btn btn-primary" href="client/orderServlet?action=isLogin">去提交</a></span>
        </div>
    </c:if>
</div>

<script type="text/javascript">
    $(function () {
        $("a.deleteItem").click(function () {
            return confirm("你确定要删除【"+$(this).parent().parent().find("td:first").text() +"】么？");
        });
        $("#clearCart").click(function () {
            return confirm("你确定要清空购物车么？");
        });

        $(".updateCount").change(function () {
            var name = $(this).parent().parent().find("td:first").text();
            var count = this.value;
            var id = $(this).attr("bikeId");
            if(confirm("你确定要修改【"+name+"】数量为"+count+"么？")) {
                location.href="http://localhost:8080/Bike/cartServlet?action=updateCount&count="+count+"&id="+id;
            } else {
                this.value = this.defaultValue;
            }
        })
    });

</script><%@include file="/pages/common/footer.jsp"%>
</body>
</html>

