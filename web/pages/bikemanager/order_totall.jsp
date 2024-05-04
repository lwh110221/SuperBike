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
<html>
<head>
    <meta charset="UTF-8">
    <title>总账单</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
</head>
<style>
    #main1 {
        justify-content: center;
        width: 85%;
        margin: 0 auto;
        border-radius: 30px;
    }
    #main {
        text-align: center;
        background-color: #cbf1ff;
        border-radius: 30px;
        padding: 70px;
    }
</style>
<body>


<%
    String usernumber=request.getParameter("usernumber");
    String ordernumber = request.getParameter("ordernumber");
    String bikenumbers = request.getParameter("bikenumbers");
    String bigDecimal = request.getParameter("bigDecimal");


//转换日期的格式
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年M月d日 EEEE");
    String currentDate = sdf.format(new Date());
%>


<div id="main1">
    <div id="main">
        <table class="table table-striped">
            <thead>
            <tr>
                <th colspan="2"><h1>总账单</h1></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2">截止<%=currentDate%></td>
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
                <td> 总收入:</td>
                <td>${bigDecimal}元</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>




</body>
</html>
