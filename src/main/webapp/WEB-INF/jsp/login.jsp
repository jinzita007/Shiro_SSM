
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/11
  Time: 下午3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>
</head>
<body>
<div style="color: #ff0000;">${error}</div>
<br/>
<form action="${pageContext.request.contextPath}/user/login" method="post">
    用户名：
    <input type="text" name="username"><br/>
    密码：
    <input type="password" name="password"><br/>

    <input type="submit" value="登录">

</form>
</body>
</html>
