<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑用户信息</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
    <style>
        #main1 {
            width: 80%;
            margin: 0 auto;
            height: 100%;
        }
        #main {
            justify-content: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div id="main1">
</div>
<div id="main" class="container">
    <form action="bikemanager/UserServlet" method="post">
        <input type="hidden" name="pageNo" value="${param.pageNo}">
        <input type="hidden" name="action" value="${empty param.id ? "add":"update"}"/>
        <input type="hidden" name="id" value="${requestScope.user.id}"/>
        <table class="table">
            <thead>
            <tr>
                <th>用户名</th>
                <th>密码</th>
                <th>电子邮箱</th>
                <th>收货地址</th>
                <th>收货人</th>
                <th>电话</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="display: none;"><input name="id" type="text" value="${requestScope.user.id}"/></td>
                <td><input name="username" type="text" class="form-control" value="${requestScope.user.username}"/></td>
                <td><input name="password" type="text" class="form-control" value="${requestScope.user.password}"/></td>
                <td><input name="email" type="text" class="form-control" value="${requestScope.user.email}"/></td>
                <td><input name="address" type="text" class="form-control" value="${requestScope.user.address}"/></td>
                <td><input name="receiver" type="text" class="form-control" value="${requestScope.user.receiver}"/></td>
                <td><input name="phone" type="text" class="form-control" value="${requestScope.user.phone}"/></td>
                <td><input type="submit" class="btn btn-primary" value="提交"/></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>

</body>
</html>
