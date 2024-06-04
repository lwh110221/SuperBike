<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/4/19
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        #header {
            background-color: #78b411;
            padding: 10px 0;
        }
        #logo_img {
            width: 50px;
            height: 50px;
        }
        .col-md-8{
            background-color: #cbf1ff;
        }
        #wel_word {
            font-size: 30px;
            font-weight: bold;
            color: #ffffff;
        }
        .nav-item{
            font-size: large;
            font-weight: bold;
            color: #0a58ca;
        }

        .bike_img {
            width: 100%;
            height: auto;
        }

        .card-title {
            font-size: 24px;
            font-weight: bold;
        }

        .cart {
            position: fixed;
            right: 10px;
            bottom: 50px;
            width: 60px;
            height: 60px;
            background-color: #1f3759;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        .cart:hover {
            background-color: #0056b3;
        }

        .cart img {
            width: 30px;
            height: 30px;
        }

        .cart-count {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: #fffbfb;
            color: #78b411;
            border-radius: 50%;
            padding: 5px 8px;
            font-size: 20px;
            font-weight: bold;
            line-height: 1;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #78b411;">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img id="logo_img" src="static/img/logo.jpg" alt="Logo">
            <span id="wel_word">Bikestore</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <c:if test="${empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="pages/user/login.jsp">登录</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/user/regist.jsp">注册</a></li>
                    <li class="nav-item"><a class="nav-link" href="client/bikeServlet?action=pageOrder">热销榜单</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/bikemanager/manager.jsp">后台管理</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <span class="navbar-text">当前用户：<span class="text-white">${sessionScope.user.username}</span></span>
                    <li class="nav-item"><a class="nav-link" href="userServlet?action=logout">注销</a></li>
                    <li class="nav-item"><a class="nav-link" href="client/bikeServlet?action=pageOrder">热销榜单</a></li>
                    <li class="nav-item"><a class="nav-link" href="client/orderServlet?action=myOrders">我的订单</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/user/userinfo.jsp">个人信息</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/bikemanager/manager.jsp">后台管理</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<div id="main" class="container mt-4">
    <div class="bike_check">
        <form action="client/bikeServlet" method="get">
            <input type="hidden" name="action" value="pageByNameOrBrand">
            <div class="input-group mb-3">
                <input id="nameorbrand" type="text" class="form-control" placeholder="请输入型号或品牌名" name="nameorbrand" value="${param.nameorbrand}">
                <button class="btn btn-outline-secondary" type="submit">查询</button>
            </div>
        </form>
    </div>
    <div id="bike_cc">
        <form action="client/bikeServlet" method="get">
            <input type="hidden" name="action" value="pageByPrice">
            <div class="input-group mb-3">
                <span class="input-group-text">价格：</span>
                <input id="min" type="text" class="form-control" name="min" value="${param.min}" placeholder="最低价">
                <span class="input-group-text">元 - </span>
                <input id="max" type="text" class="form-control" name="max" value="${param.max}" placeholder="最高价">
                <span class="input-group-text">元</span>
                <button class="btn btn-outline-secondary" type="submit">查询</button>
            </div>
        </form>
    </div>
    <div id="bike">
        <c:forEach items="${requestScope.page.items}" var="bike">
            <div id="b_list" class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img class="bike_img card-img-top" src="${bike.img_path}" alt="暂无图片，等待上传">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">${bike.name}</h5>
                            <p class="card-text">品牌: ${bike.brand}</p>
                            <p class="card-text">价格: ￥${bike.price}</p>
                            <p class="card-text">销量: ${bike.sales}</p>
                            <p class="card-text">库存: ${bike.stock}</p>
                            <p class="card-text">分类: ${bike.classification}</p>
                            <p class="card-text">描述: ${bike.size}</p>
                            <button bikeId="${bike.id}" class="btn btn-primary addToCart">加入购物车</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="cart">
    <a href="pages/cart/cart.jsp">
        <img src="static/img/cart.png" alt="Cart">
        <span id="cartTotalCount" class="cart-count">${sessionScope.cart.totalCount}</span>
    </a>
</div>

<script type="text/javascript">
    $(function () {
        // 加入购物车事件
        $("button.addToCart").click(function () {
            var bikeId = $(this).attr("bikeId");
            $.getJSON("/Bike/cartServlet", { action: "ajaxAddItem", id: bikeId }, function (data) {
                $("#cartTotalCount").text(data.totalCount);
            });
        });
    });

    //控制台输出session中的用户信息
    console.log("${sessionScope.user}");
</script>

<div id="my_footer">
    <%@include file="/pages/common/page_nav.jsp"%>
    <%@include file="/pages/common/footer.jsp"%>
</div>

</body>
</html>
