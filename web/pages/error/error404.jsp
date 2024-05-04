<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/4/30
  Time: 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        #header {
            text-align: center;
            padding: 20px 0;
        }

        #logo_img {
            width: 150px;
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
    <span class="wel_word">404错误</span>
</div>

<div id="main" class="container">
    <div class="row">
        <div class="col">
            <table class="table">
                <tbody>
                <tr>
                    <td>您访问的页面不存在或已被删除!</td>
                </tr>
                <tr>
                    <td>
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