<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/4/26
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%
        String basePath = request.getScheme()
                +"://"
                +request.getServerName()
                +":"
                +request.getServerPort()
                +request.getContextPath()
                +"/";

    %>
<!-- base标签，获取项目的根路径,永远固定相对路径跳转的结果 -->
<base href=<%=basePath%>>

<%--引用--%>