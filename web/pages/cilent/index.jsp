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
            height: 150px;
        }

        #logo_img {
            width: 150px;
            height: 150px;
            margin-bottom: 50px;
        }

        #wel_word {
            font-size: 100px;
            font-weight: bold;
            color: #ffffff;
        }

        #ul_dao {
            font-size: 20px;
            position: absolute;
            right: 5%;
            top: 80px;
            font-family: "幼圆", serif;
            background-color: #cbf1ff;
            border-radius: 10px;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        #ul_dao li {
            display: inline;
            margin-right: 20px;
        }

        #ul_dao li a {
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        #ul_dao li a:hover {
            color: #007bff;
        }

        @media screen and (max-width: 768px) {
            #ul_dao {
                position: relative;
                top: auto;
                right: auto;
                text-align: center;
            }

            #ul_dao li {
                display: block;
                margin: 10px 0;
            }
        }
        .um_span {
            color: #161414;
        }

        #main {
            margin-top: 20px;
        }

        #bike {
            margin-top: 20px;
        }

        #bike_cc {
            margin-bottom: 20px;
        }

        #b_list {
            margin-top: 20px;
            border-color: #a0b5b4;
            background-color: #cbf1ff;
        }

        .bike_img {
            width: 100%;
            height: 100%;
        }

        #my_footer {
            margin-top: 20px;
        }

        #cartTotalCount {
            font-size: 20px;
        }

        #cartLastName {
            font-size: 20px;
        }

        .card {
            margin-top: 20px;
        }

        .addToCart {
            margin-top: 20px;
        }

        .bike_check {
            margin-top: 20px;
        }

        .input-group {
            margin-top: 20px;
        }

        #nameorbrand {
            width: 300px;
        }

        #min {
            width: 100px;
        }

        #max {
            width: 100px;
        }
        .container-fluid {
            padding: 10px;
        }
        .cart2 {
            /*    固定在右下角*/
            position: fixed;
            right: 10px;
            bottom: 50px;
            display: inline-block;
        }
        .cart-count {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 5px 8px;
            font-size: 15px;
            font-weight: bold;
            line-height: 1;
        }
        .tip2 {
            position: absolute;
            top: -90px;
            right: -10px;
            transform: translateY(-50%);
            background-color: #a4ee20; /* 设置背景色 */
            border: 1px solid #ff6f00; /* 设置边框样式 */
            padding: 5px; /* 设置内边距 */
            border-radius: 5px; /* 设置边框圆角 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 设置阴影效果 */
            z-index: 1; /* 确保永远在最顶层 */
            width: 80px; /* 固定宽度 */
            text-align: center; /* 文本居中 */
        }
        .um_span1{
            margin-top: 10px;
            margin-right: 20px;
            color: #156cc6;
        }
        .mm{
            position: fixed;
            bottom: 180px;
            right: -55px;
            transform: scale(0.5);
            display: inline-block;
            border-radius: 20px;
        }

    </style>
</head>
<body>
<div id="header" class="container-fluid">
    <div class="row align-items-center">
        <div class="col">
            <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
            <span id="wel_word" class="ms-2">Bikestore</span>
        </div>
        <div class="col">
            <c:if test="${empty sessionScope.user}">
                <ul id="ul_dao" class="nav justify-content-end">
                    <li class="nav-item"><a class="nav-link" href="pages/user/login.jsp">登录</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/user/regist.jsp">注册</a></li>
                    <li class="nav-item"><a class="nav-link" href="client/bikeServlet?action=pageOrder">热销榜单</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/bikemanager/manager.jsp">后台管理</a></li>
                </ul>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <ul id="ul_dao" class="nav justify-content-end">
                    <span class="um_span1">当前用户：<span class="um_span">${sessionScope.user.username}</span></span>
                    <a class="nav-link" href="userServlet?action=logout">注销</a>
                    <a class="nav-link" href="client/bikeServlet?action=pageOrder">热销榜单</a>
                    <a class="nav-link" href="client/orderServlet?action=myOrders">我的订单</a>
                    <a class="nav-link" href="pages/user/userinfo.jsp">个人信息</a>
                    <a class="nav-link" href="pages/bikemanager/manager.jsp">后台管理</a>
                </ul>
            </c:if>
        </div>
    </div>
</div>

<div id="main" class="container">
    <div class="bike_check">
        <form action="client/bikeServlet" method="get">
            <input type="hidden" name="action" value="pageByNameOrBrand">
            <div class="input-group mb-3">
                <input id="nameorbrand" type="text" class="form-control" placeholder="请输入型号或品牌名" name="nameorbrand" value="${param.nameorbrand}">
                <button class="btn btn-outline-secondary" type="submit">查询</button>
            </div>
        </form>
    </div>
    <div id="bike">
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
        <div class="text-center">
            <c:choose>
                <c:when test="${empty sessionScope.cart.items}">
                    <div class="cart2">
                        <a href="pages/cart/cart.jsp">
                            <img src="static/img/cart.png"  width="50px" height="50px">
                            <span id="cartTotalCount" class="cart-count">0</span>
                        </a>
                        <div class="tip2">
                            <span style="color: #ff6f00" id="cartLastName">---</span>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="cart2">
                        <a href="pages/cart/cart.jsp">
                            <img src="static/img/cart.png"  width="50px" height="50px">
                            <span id="cartTotalCount" class="cart-count">${sessionScope.cart.totalCount}</span>
                        </a>
                        <div class="tip2">
                            <span style="color: #ff6f00" id="cartLastName">${sessionScope.lastName}</span>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <c:forEach items="${requestScope.page.items}" var="bike">
            <div id="b_list" class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img class="bike_img card-img-top" src="${bike.img_path}" alt="暂无图片，等待上传">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 style="font-size: 50px" class="card-title">${bike.name}</h5>
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
<div class="mm">
    <a href="pages/client/catline.jsp">
        <img src="static/img/lwhmm.gif" alt="mm">
    </a>
</div>



<script type="text/javascript">
    $(function () {
        //给加入购物车绑定单击事件
        $("button.addToCart").click(function () {
            var bikeId = $(this).attr("bikeId");
            //发ajax请求添加商品到购物车
            $.getJSON("/Bike/cartServlet", "action=ajaxAddItem&id=" + bikeId, function (data) {
                $("#cartTotalCount").text(data.totalCount);
                $("#cartLastName").html(data.lastName+"已加入购物车");
            });
        });
    });
</script>

<div id="my_footer">
    <%@include file="/pages/common/page_nav.jsp"%>
    <%@include file="/pages/common/footer.jsp"%>
</div>

</body>
</html>



