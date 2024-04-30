<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/4/30
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>权限不足</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        #header {
            text-align: center;
            padding: 20px 0;
        }

        #logo_img {
            width: 150px;
            float: left;
        }

        .wel_word {
            font-size: 1.5em;
            color: #333;
        }

        #main {
            text-align: center;
            margin-top: 50px;
        }

        td {
            width: 300px;
        }

        a.btn {
            color: #fff;
        }
    </style>
</head>
<body>
    <div id="header">
        <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
    </div>

    <div id="main" class="container">
        <div class="row">
            <div class="col">
                <table class="table">
                    <tbody>
                    <tr>
                        <td>你没有管理员权限！</td>
                    </tr>
                    <tr>
                        <td>
                            <a href="pages/user/login.jsp" class="btn btn-danger">管理员登录</a>
                            <a href="index.jsp" class="btn btn-danger">返回首页</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<%@include file="/pages/common/footer.jsp"%>

</body>
</html>