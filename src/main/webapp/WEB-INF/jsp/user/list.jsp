<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/11
  Time: 下午3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html>
<head>
    <title>管理页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/zTree_v3/css/zTreeStyle/zTreeStyle.css">
</head>
<body>

<ul>
    <li>
        <shiro:hasPermission name="user:list">
            <a href="${pageContext.request.contextPath}/user/list">用户管理</a>
        </shiro:hasPermission>

    </li>
    <li>
        <a href="${pageContext.request.contextPath}/role/list">角色管理</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/permission/list">权限管理</a>
    </li>

    <li>
        <shiro:hasPermission name="user:list">
            <a href="${pageContext.request.contextPath}/user/list">用户列表</a>
        </shiro:hasPermission>

    </li>
    <li>
        <shiro:hasPermission name="user:add">
            <a href="${pageContext.request.contextPath}/user/add">新增用户</a>
        </shiro:hasPermission>

    </li>


</ul>
<a href="${pageContext.request.contextPath}/user/logout">退出</a>

<table class="table">
    <thead>
    <tr>
        <th>用户名</th>
        <th>电子邮箱</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <c:forEach items="${userList}" var="user">
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>
            <shiro:hasPermission name="user:update">
                <a href="${pageContext.request.contextPath}/user/${user.id}/update">修改</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="user:delete">
                <a href="javascript:void(0);" class="delete_submit" data-id="${user.id}">删除</a>
            </shiro:hasPermission>

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
            var userId = $(this).attr("data-id");
            console.log(userId);
            //请求新增用户
            if (confirm('确认删除ID为"' + userId + '"的用户吗？')) {
                $.ajax({
                    url: "delete",
                    type: "post",
                    dataType: "json",
                    data: {userId:userId},
                    success: function () {
                        console.log("删除成功！");
                        window.location.href = "/user/list";
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