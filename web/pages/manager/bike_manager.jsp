<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>自行车管理</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>

    <script type="text/javascript">
        $(function () {
            //给删除的a标签绑定单击事件，用于删除提示
            $("a.deleteClass").click(function () {
                /**
                 * 返回true表示确认
                 */
                return confirm("你确定要删除【"+$(this).parent().parent().find("td:first").text()+"】?");

            })
        })
    </script>
    <style>
        #main1{
            width: 90%;
            height: 100%;
            background-color: #cbf1ff;
            margin: 0 auto;
            border-radius: 20px;
            border: #82cb2d;
            position: relative;
            top: 20px;
        }

        #main {
            margin-top: 10px;
        }
        .table th,
        .table td {
            vertical-align: middle; /* 垂直居中 */
        }
        .table img {
            max-width: 70px; /* 图片最大宽度 */
            height: auto;
        }

        .table td:nth-child(7) {
            width: 25%; /* 调整描述和图片之间的宽度为25% */
        }

        .table td:nth-last-child(3) a,
        .table td:nth-last-child(2) a {
            margin: 0 2px; /* 删除和修改按钮之间的外边距设置为2px */
        }
        .table td:last-child {
            padding-left: 5px; /* 右侧内边距 */
            text-align: left; /* 文字右对齐 */
        }
    </style>
</head>
<body>
<div id="main1">
    <div id="main">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>名称</th>
                <th>价格</th>
                <th>品牌</th>
                <th>销量</th>
                <th>库存</th>
                <th>分类</th>
                <th>描述</th>
                <th>图片</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.page.items}" var="bike">
                <tr>
                    <td>${bike.name}</td>
                    <td>${bike.price}</td>
                    <td>${bike.brand}</td>
                    <td>${bike.sales}</td>
                    <td>${bike.stock}</td>
                    <td>${bike.classification}</td>
                    <td>${bike.size}</td>
                    <td><img src="${bike.img_path}" alt="" style="width: 70px;height: 70px;"></td>
                    <td><a href="manager/bikeServlet?&action=getBike&id=${bike.id}&pageNo=${requestScope.page.pageNo}" class="btn btn-primary">修改</a></td>
                    <td><a href="manager/bikeServlet?action=delete&id=${bike.id}&pageNo=${requestScope.page.pageNo}" class="btn btn-danger deleteClass">删除</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="9"></td>
                <td><a href="pages/manager/bike_edit.jsp?pageNo=${requestScope.page.pageTotal}" class="btn btn-success">添加图书</a></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<footer style="bottom: 15px">
    <%@include file="/pages/common/page_nav.jsp"%>
</footer>
</body>
</html>
