<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/3
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css" >
<style>
    .pagination-container {
        position: relative;
    }

    .alert-info {
        position: absolute;
        width: 100%;
        top: -12px;
        z-index: -1;
    }
</style>

<div class="container pagination-container">
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${requestScope.page.pageNo > 1}">
                <li class="page-item">
                    <a class="page-link" href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}" aria-label="上一页">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${end}" var="i">
                <li class="page-item <c:if test='${i == requestScope.page.pageNo}'>active</c:if>'">
                    <a class="page-link" href="${requestScope.page.url}&pageNo=${i}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
                <li class="page-item">
                    <a class="page-link" href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}" aria-label="下一页">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </c:if>
            <div class="alert alert-info" role="alert">
                共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
            </div>
        </ul>
    </nav>
</div>

<!-- Bootstrap JS (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="static/script/bootstrap.min.js"></script>

<script type="text/javascript">
    $(function () {
        $("#searchPageBtn").click(function () {
            var pageNo = $("#pn_input").val()
            var pageTotal = ${requestScope.page.pageTotal}
            if(pageNo<1) pageNo=1
            if(pageNo>pageTotal) pageNo=pageTotal
            location.href="${requestScope.basePath}${requestScope.page.url}&pageNo="+pageNo;
        });
    });
</script>
