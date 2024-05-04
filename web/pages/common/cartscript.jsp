<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $("a.deleteItem").click(function () {
            return confirm("你确定要删除【"+$(this).parent().parent().find("td:first").text() +"】么？");
        });
        $("#clearCart").click(function () {
            return confirm("你确定要清空购物车么？");
        });

        $(".updateCount").change(function () {
            var name = $(this).parent().parent().find("td:first").text();
            var count = this.value;
            var id = $(this).attr("bikeId");
            if(confirm("你确定要修改【"+name+"】数量为"+count+"么？")) {
                location.href="http://localhost:8080/Bike/cartServlet?action=updateCount&count="+count+"&id="+id;
            } else {
                this.value = this.defaultValue;
            }
        })
    });

</script>
