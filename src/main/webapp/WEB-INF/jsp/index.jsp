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
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0" name="viewport">
    <title>权限首页</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css">
    <style>
        .page {
            margin-top: 80px;
        }
    </style>
</head>
<body>
<jsp:include page="./page/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="page">
            <div class="jumbotron">
                <h1>欢迎权限后台页面！</h1>
                <p>这是一个SSM+Shiro权限后台系统。</p>
            </div>
        </div>

    </div>
</div>


</body>
</html>
