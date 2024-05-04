<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>支付</title>
    <%@include file="/pages/common/header.jsp"%>
</head>
<body>

<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg" style="width: 150px">
    <span class="wel_word">支付</span>
    <%@include file="/pages/common/login_success_menu.jsp"%>
</div>


<h1>你的订单号为${sessionScope.orderId}，付款请备注订单号！！！</h1>
<div id="main">
    <form>
        <input type="hidden">
        <table>
            <tr>
                <td colspan="2">
                    支付金额：<span id="paymentAmount"></span>元
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td colspan="2">请选择支付方式</td>
            </tr>
            <tr>
                <td>
                    <label>
                        <input type="radio" name="pd_FrpId" value="wechat-pay" onchange="showPaymentCode('wechat-pay')">微信支付
                    </label>
                </td>
                <td>
                    <label>
                        <input type="radio" name="pd_FrpId" value="ali-pay" onchange="showPaymentCode('ali-pay')">支付宝支付
                    </label>
                </td>
            </tr>
            <tr id="paymentCodeRow" style="display: none;">
                <td colspan="2">
                    <img id="paymentCode" src="" alt="收款码" style="max-width: 400px;max-height: 400px">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="window.location.href='index.jsp'">已支付</button>
                </td>
            </tr>
        </table>
    </form>

    <script>
        // 获取存储的支付金额
        var paymentAmount = sessionStorage.getItem('paymentAmount');

        // 将支付金额显示在页面上
        document.getElementById('paymentAmount').innerText = paymentAmount;
    </script>

    <script>
        function showPaymentCode(paymentMethod) {
            var paymentCodeRow = document.getElementById("paymentCodeRow");
            var paymentCodeImg = document.getElementById("paymentCode");

            // 根据支付方式显示对应的收款码图片
            if (paymentMethod === 'wechat-pay') {
                paymentCodeImg.src = 'static/img/Wechatpay.jpg'; // 微信收款码图片路径
            } else if (paymentMethod === 'ali-pay') {
                paymentCodeImg.src = 'static/img/Alipay.jpg'; // 支付宝收款码图片路径
            }

            // 显示收款码图片
            paymentCodeRow.style.display = "table-row";
        }
    </script>


</div>


<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
