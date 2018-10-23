
<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/23
  Time: 上午10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                    aria-controls="navbar">
                <span class="sr-only">Shiro权限管理后台</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Shiro权限管理后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="/">首页</a>
                </li>
                <li>
                    <shiro:hasPermission name="user:list">
                    <a href="${pageContext.request.contextPath}/user">用户管理</a>
                    </shiro:hasPermission>
                </li>
                <li>
                   <shiro:hasPermission name="role:list">
                    <a href="${pageContext.request.contextPath}/role">角色管理</a>
                   </shiro:hasPermission>
                </li>
                <li>
                   <shiro:hasPermission name="permission:list">
                    <a href="${pageContext.request.contextPath}/permission">权限管理</a>
                   </shiro:hasPermission>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="${pageContext.request.contextPath}/user/logout">退出</a>
                </li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
<br/>
<br/>


