<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/4/19
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
</head>
<body>
<body>
<div id="header" class="container-fluid">
    <div class="row align-items-center">
        <div class="col">
            <span id="wel_word" class="ms-2">Bikestore</span>
        </div>
        <div class="col">
            <c:if test="${empty sessionScope.user}">
                <ul id="ul_dao" class="nav justify-content-end">
                    <li class="nav-item"><a class="nav-link" href="pages/user/login.jsp">登录</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/user/regist.jsp">注册</a></li>
                    <li class="nav-item"><a class="nav-link" href="client/bikeServlet?action=pageOrder">热销榜单</a></li>
                    <li class="nav-item"><a class="nav-link" href="pages/manager/manager.jsp">后台管理</a></li>
                </ul>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <ul id="ul_dao" class="nav justify-content-end">
                    <span class="um_span1">当前用户：<span class="um_span">${sessionScope.user.username}</span></span>
                    <a class="nav-link" href="userServlet?action=logout">注销</a>
                    <a class="nav-link" href="client/bikeServlet?action=pageOrder">热销榜单</a>
                    <a class="nav-link" href="client/orderServlet?action=myOrders">我的订单</a>
                    <a class="nav-link" href="pages/user/userinfo.jsp">个人信息</a>
                    <a class="nav-link" href="pages/manager/manager.jsp">后台管理</a>
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


</body>
</html>
