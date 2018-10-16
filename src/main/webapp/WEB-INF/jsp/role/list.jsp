<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/16
  Time: 上午9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html>
<head>
    <title>角色管理</title>
</head>
<body>

<ul>
    <li>
            <a href="${pageContext.request.contextPath}/role/list">角色列表</a>

    </li>
    <li>
            <a href="${pageContext.request.contextPath}/role/add">新增角色</a>

    </li>
</ul>
<a href="${pageContext.request.contextPath}/user/logout">退出</a>

<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>角色</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <c:forEach items="${roleList}" var="role">
        <td>${role.id}</td>
        <td>${role.name}</td>
        <td>
                <a href="">修改</a>
                <a href="javascript:void(0);" class="delete_submit" data-id="${role.id}">删除</a>

        </td>
    </tr>
    </c:forEach>


    </tbody>
</table>

</body>
<script src="${pageContext.request.contextPath}/static/plugin/zTree_v3/js/jquery-1.4.4.min.js"></script>
<script>

</script>
</html>
