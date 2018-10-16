<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/16
  Time: 上午8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>权限首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css">
</head>
<body>

<ul>
    <li>
        <shiro:hasPermission name="user:list">
            <a href="${pageContext.request.contextPath}/user/list">用户管理</a>
        </shiro:hasPermission>
    </li>
    <li>
        <shiro:hasPermission name="role:list">
            <a href="${pageContext.request.contextPath}/role/list">角色管理</a>
        </shiro:hasPermission>
    </li>
    <li>
        <shiro:hasPermission name="permission:list">
            <a href="${pageContext.request.contextPath}/permission/list">权限管理</a>
        </shiro:hasPermission>
    </li>
</ul>
<a href="${pageContext.request.contextPath}/user/logout">退出</a>

</body>
</html>
