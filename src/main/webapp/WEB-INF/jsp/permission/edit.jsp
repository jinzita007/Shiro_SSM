
<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/20
  Time: 下午12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑权限</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
<form id="form1" class="user_form">
    <input type="hidden" name="pid" value="${parent.id}"/>
<c:if test="${not empty parent}">
    <p>父节点名称：${parent.name}</p>
</c:if>
    <p>子节点名称: <input name="name" type="text" value=""/></p>
    <p>URL：<input name="url" type="text" value=""/></p>
    <p>权限代码：<input name="code" type="text" value=""/></p>
    <p><input type="submit" class="save_submit" value="保存">&nbsp<input type="reset" value="重置"></p>
</form>

</body>
<script src="https://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $(".save_submit").click(function () {
            var data = $(".user_form").serialize();
            console.log(data);
            //请求新增用户
            $.ajax({
                url: "${pageContext.request.contextPath}/permission/"+"${parent.id}"+"/appendChild",
                type: "post",
                dataType: "json",
                data: data,
                success: function (data) {
                    console.log(data);
                    // window.location.href = "/permission/list";
                },
                error: function () {
                    console.log("error");
                }
            });
            return false;
        })
    })
</script>
</html>
