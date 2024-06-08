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
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f4f6;
            color: #333;
        }
        #main {
            margin-top: 20px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control, .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s;
        }
        .form-control:focus, .form-select:focus {
            border-color: #82cb2d;
        }
        .btn-primary {
            background-color: #82cb2d;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #6ba22a;
        }
        .form-control-file {
            padding: 3px;
        }
    </style>
</head>
<body>
<div id="main" class="container">
    <form action="bikemanager/bikeServlet" method="post">
        <input type="hidden" name="pageNo" value="${param.pageNo}">
        <input type="hidden" name="action" value="${empty param.id ? "add":"update"}"/>
        <input type="hidden" name="id" value="${requestScope.bike.id}"/>
        <div class="form-group">
            <label for="name">型号</label>
            <input name="name" type="text" id="name" class="form-control" value="${requestScope.bike.name}"/>
        </div>
        <div class="form-group">
            <label for="price">价格</label>
            <input name="price" type="text" id="price" class="form-control" value="${requestScope.bike.price}"/>
        </div>
        <div class="form-group">
            <label for="brand">品牌</label>
            <input name="brand" type="text" id="brand" class="form-control" value="${requestScope.bike.brand}"/>
        </div>
        <div class="form-group" style="display: none;">
            <label for="sales">销量</label>
            <input name="sales" type="text" id="sales" class="form-control" value="${requestScope.bike.sales}"/>
        </div>
        <div class="form-group">
            <label for="stock">库存</label>
            <input name="stock" type="text" id="stock" class="form-control" value="${requestScope.bike.stock}"/>
        </div>
        <div class="form-group">
            <label for="classification">分类</label>
            <select name="classification" id="classification" class="form-select">
                <option value="公路车" ${requestScope.bike.classification == '公路车' ? 'selected' : ''}>公路车</option>
                <option value="山地车" ${requestScope.bike.classification == '山地车' ? 'selected' : ''}>山地车</option>
                <option value="休闲车" ${requestScope.bike.classification == '休闲车' ? 'selected' : ''}>休闲车</option>
                <option value="折叠车" ${requestScope.bike.classification == '折叠车' ? 'selected' : ''}>折叠车</option>
                <option value="其他" ${requestScope.bike.classification == '其他' ? 'selected' : ''}>其他</option>
            </select>
        </div>
        <div class="form-group">
            <label for="size">描述</label>
            <input name="size" type="text" id="size" class="form-control" value="${requestScope.bike.size}"/>
        </div>
        <div class="form-group">
            <label for="imgInput">选择图片</label>
            <input type="file" id="imgInput" class="form-control-file" />
            <input name="img_path" type="hidden" id="hiddenImgPath" value="${requestScope.bike.img_path}"/>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="提交"/>
        </div>
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
