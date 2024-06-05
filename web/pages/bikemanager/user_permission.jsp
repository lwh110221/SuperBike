<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
    <title>权限设置</title>
    <%@include file="/pages/common/header.jsp"%>
    <%@include file="/pages/common/managercomon.jsp"%>
</head>
<body>
<div class="container mt-4">
    <h1>权限设置</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>用户名</th>
            <th>管理员权限</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>
                    <select class="form-select admin-status" data-user-id="${user.id}">
                        <option value="yes" ${user.adminornot == 'yes' ? 'selected' : ''}>Yes</option>
                        <option value="no" ${user.adminornot == 'no' ? 'selected' : ''}>No</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary save-btn" data-user-id="${user.id}">保存</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function() {
        $('.save-btn').click(function() {
            var userId = $(this).data('user-id');
            var adminStatus = $(this).closest('tr').find('.admin-status').val();
            $.ajax({
                url: 'bikemanager/UserServlet',
                type: 'POST',
                data: {
                    action: 'updateAdminStatus',
                    userId: userId,
                    adminStatus: adminStatus
                },
                success: function(response) {
                    alert('权限更新成功');
                },
                error: function() {
                    alert('权限更新失败');
                }
            });
        });
    });
</script>

</body>
</html>
