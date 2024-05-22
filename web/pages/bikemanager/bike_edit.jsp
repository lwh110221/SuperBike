<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑自行车</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
</head>
<style>
    #main {
        justify-content: center;
        margin-top: 20px;
    }
</style>

<body>
<div id="main" class="container">
    <form action="bikemanager/bikeServlet" method="post">
        <input type="hidden" name="pageNo" value="${param.pageNo}">
        <input type="hidden" name="action" value="${empty param.id ? "add":"update"}"/>
        <input type="hidden" name="id" value="${requestScope.bike.id}"/>
        <table class="table">
            <thead>
            <tr>
                <th>型号</th>
                <th>价格</th>
                <th>品牌</th>
                <th>库存</th>
                <th>分类</th>
                <th>描述</th>
                <th>选择图片</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 170px"><input name="name" type="text" class="form-control" value="${requestScope.bike.name}"/></td>
                <td style="width: 120px"><input name="price" type="text" class="form-control" value="${requestScope.bike.price}"/></td>
                <td style="width: 75px"><input name="brand" type="text" class="form-control" value="${requestScope.bike.brand}"/></td>
                <td style="display: none;"><input name="sales" type="text" class="form-control" value="${requestScope.bike.sales}"/></td>
                <td style="width: 75px"><input name="stock" type="text" class="form-control" value="${requestScope.bike.stock}"/></td>
                <td style="width: 115px">
                    <select name="classification" class="form-select">
                        <option value="公路车" ${requestScope.bike.classification == '公路车' ? 'selected' : ''}>公路车</option>
                        <option value="山地车" ${requestScope.bike.classification == '山地车' ? 'selected' : ''}>山地车</option>
                        <option value="休闲车" ${requestScope.bike.classification == '休闲车' ? 'selected' : ''}>休闲车</option>
                        <option value="折叠车" ${requestScope.bike.classification == '折叠车' ? 'selected' : ''}>折叠车</option>
                        <option value="其他" ${requestScope.bike.classification == '其他' ? 'selected' : ''}>其他</option>
                    </select>
                </td>
                <td style="width: 400px"><input name="size" type="text" class="form-control" value="${requestScope.bike.size}"/></td>
                <td style="width: 220px">
                    <input type="file" id="imgInput" class="form-control" />
                    <input name="img_path" type="hidden" id="hiddenImgPath" value="${requestScope.bike.img_path}"/>
                </td>
                <td><input type="submit" class="btn btn-primary" value="提交"/></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<%--			获取文件名，		填入路径的方法--%>
<script>
    $(document).ready(function() {
        $('#imgInput').change(function() {
            const file = $(this).prop('files')[0]; 			// 获取选择的文件
            if (file) {
                const fixedPath = 'static/img/'; 			// 我自己设置的固定的路径
                const fullPath = fixedPath + file.name; 	// 拼接固定路径和文件名
                $('#hiddenImgPath').val(fullPath); 			// 将完整路径填入隐藏输入框
            }
        });
    });
</script>

</body>
</html>
