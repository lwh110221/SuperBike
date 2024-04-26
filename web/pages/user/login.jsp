<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/4/21
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <%@include file="/pages/common/header.jsp"%>
<body>
    <div class="login_banner">
        <div style="text-align: center; font-size: 20px; margin-bottom: 20px;">
            <h1>欢迎登录SuperBike</h1>
            <a style="float: right" href="/Bike/" class="btn btn-secondary">返回首页</a>
            <div id="content">
                <div class="form">
                    <form action="userServlet" method="post">
                        <input type="hidden" name="action" value="login">
                        <label style="float: left">用户名：</label>
                        <input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off"
                               tabindex="1" name="username" id="username"
                               value="${requestScope.username}"
                        />
                            <br/>
                            <br/>
                        <label style="float: left">密码：</label>
                        <input class="itxt" type="password" placeholder="请输入密码" autocomplete="off"
                               tabindex="1" name="password" id="password"
                        />
                        <div class="msg_cont">
                                            <span class="errorMsg">
                                                ${empty requestScope.msg ? "请输入用户名和密码":requestScope.msg}
                                            </span>
                        </div>
                            <br/>
                            <br/>
                        <input type="submit" value="登录" id="sub_btn" />

                        <a>还没有账户？</a>
                        <a style="color: #ea868f" href="pages/user/regist.jsp">立即注册</a>
                    </form>
                </div>


            </div>
            </div>
        <div>
            <%@include file="/pages/common/footer.jsp"%>
        </div>
    </div>
</body>
    <script type="text/javascript">
        // 页面加载完成之后
        $(function(){

            // 给注册按钮添加事件
            $("#sub_btn").click(function(){

                // 获取用户名
                var usernameValue = $("#username").val();
                // 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                var usernameReg = /^\w{5,15}$/;
                // 验证用户信息
                if (!usernameReg.test(usernameValue)) {
                    // 提示用户
                    $("span.errorMsg").text("用户名不合法！");
                    return false;
                }

                // 获取密码
                var passwordValue = $("#password").val();
                // 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                var passwordReg = /^\w{5,15}$/;
                // 验证用户信息
                if (!passwordReg.test(passwordValue)) {
                    // 提示用户
                    $("span.errorMsg").text("密码不合法！");
                    return false;
                }

                // 阻止表单提交
                return true;
            });

        });

    </script>
</html>
