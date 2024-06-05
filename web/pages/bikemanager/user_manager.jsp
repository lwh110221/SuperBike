<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>用户管理</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
    <script type="text/javascript">
        $(function () {
            //给删除的a标签绑定单击事件，用于删除提示
            $("a.deleteClass").click(function () {
                /**
                 * 返回true表示确认
                 */
                return confirm("你确定要删除【"+$(this).parent().parent().find("td:first").text()+"】用户吗?");

            })
        })
    </script>
    <style>

        #main1 {
            justify-content: center;
            width: 85%;
            height: 100%;
            margin: 0 auto;
            align-items: center;
        }
        #main {
            text-align: center;
            background-color: #cbf1ff;
            border-radius: 30px;
        }

    </style>
</head>
<body>

<div id="main1">
    <div id="main">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>序号</th>
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
            <c:forEach items="${requestScope.page.items}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.email}</td>
                    <td>${user.address}</td>
                    <td>${user.receiver}</td>
                    <td>${user.phone}</td>
                    <td><a href="bikemanager/UserServlet?&action=getUser&id=${user.id}&pageNo=${requestScope.page.pageNo}" class="btn btn-primary">修改信息</a></td>
                    <td><a class="btn btn-danger deleteClass" href="bikemanager/UserServlet?action=delete&id=${user.id}&pageNo=${requestScope.page.pageNo}">删除信息</a></td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="8"></td>
                <td><a href="pages/bikemanager/user_edit.jsp?pageNo=${requestScope.page.pageTotal}" class="btn btn-success">添加用户</a></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<footer style="margin-bottom: 20px">
    <%@include file="/pages/common/page_nav.jsp"%>
</footer>
</body>
</html>
