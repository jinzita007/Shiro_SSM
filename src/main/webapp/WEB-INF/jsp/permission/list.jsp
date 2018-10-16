<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/16
  Time: 下午1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>权限管理</title>
</head>
<body>

<ul>
    <li>
        <a href="${pageContext.request.contextPath}/permission/list">权限列表</a>

    </li>
    <li>
        <a href="${pageContext.request.contextPath}/permission/add">新增权限</a>

    </li>
</ul>
<a href="${pageContext.request.contextPath}/user/logout">退出</a>

<table class="table">
    <thead>
    <tr>
        <th>权限ID</th>
        <th>权限描述</th>
        <th>url</th>
        <th>权限代码</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <c:forEach items="${permissionList}" var="per">
        <td>${per.id}</td>
        <td>${per.name}</td>
        <td>${per.url}</td>
        <td>${per.code}</td>
        <td>
            <a href="">修改</a>
            <a href="javascript:void(0);" class="delete_submit" data-id="${per.id}">删除</a>

        </td>
    </tr>
    </c:forEach>


    </tbody>
</table>

</body>
<script src="${pageContext.request.contextPath}/static/plugin/zTree_v3/js/jquery-1.4.4.min.js"></script>
<script>
    $(document).ready(function () {
        $(".delete_submit").click(function () {
            var id = $(this).attr("data-id");
            console.log(id);
            //请求新增用户
            if (confirm('确认删除ID为"' + id + '"的权限吗？')) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/permission/delete",
                    type: "post",
                    dataType: "json",
                    data: {id: id},
                    success: function () {
                        console.log("删除成功！");
                        window.location.href = "/permission/list";
                    },
                    error: function () {
                        console.log("error");
                    }
                });
            }

            return false;
        })
    })
</script>
</html>
