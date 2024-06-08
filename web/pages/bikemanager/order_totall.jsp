<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>总账单</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f4f6;
            color: #333;
        }
        #main1 {
            display: flex;
            justify-content: center;
            width: 85%;
            margin: 20px auto;
            border-radius: 10px;
        }
        #main {
            text-align: center;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 123, 255, 0.05);
        }
        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<%
    String usernumber=request.getParameter("usernumber");
    String ordernumber = request.getParameter("ordernumber");
    String bikenumbers = request.getParameter("bikenumbers");
    String bigDecimal = request.getParameter("bigDecimal");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年M月d日 EEEE");
    String currentDate = sdf.format(new Date());
%>

<div id="main1">
    <div id="main" class="container">
        <table class="table table-striped table-hover">
            <thead class="table-primary">
            <tr>
                <th colspan="2"><h1>总账单</h1></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2" class="text-muted">截止<%=currentDate%></td>
            </tr>
            <tr>
                <td>用户总数:</td>
                <td>${usernumber}人</td>
            </tr>
            <tr>
                <td>总订单数:</td>
                <td>${ordernumber}单</td>
            </tr>
            <tr>
                <td>销售辆数:</td>
                <td>${bikenumbers}辆</td>
            </tr>
            <tr>
                <td>总收入:</td>
                <td>${bigDecimal}元</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>

