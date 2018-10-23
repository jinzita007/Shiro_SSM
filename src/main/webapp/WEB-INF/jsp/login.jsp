
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
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-form {
            position: absolute;
            left: 50%;
            top: 25%;
            margin-left: -150px;
            margin-right: -150px;
            width: 300px;
        }
    </style>
</head>
<body>


<div class="container">
    <div class="row">
        <div class="login-form">
            <div style="color: #ff0000;">${error}</div>
            <br/>
            <form class="user-form" action="${pageContext.request.contextPath}/user/login" method="post">
                <div class="form-group">
                    <label for="usernameInput">用户名</label>
                    <input type="text" name="username" class="form-control" id="usernameInput" placeholder="用户名">
                </div>
                <div class="form-group">
                    <label for="passwordInput">密码</label>
                    <input type="password" name="password" class="form-control" id="passwordInput" placeholder="密码">
                </div>
                <input type="submit" class="btn btn-primary" value="登录">
            </form>

        </div>

    </div>
</div>

</body>
</html>
