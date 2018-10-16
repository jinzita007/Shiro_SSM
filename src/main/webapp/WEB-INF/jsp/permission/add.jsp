<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/16
  Time: 下午2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增权限</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

</head>
<body>
<form id="form1" class="user_form">
    <p>权限描述：<input name="name" type="text" value=""/></p>
    <p>URL：<input name="url" type="text" value=""/></p>
    <p>权限代码：<input name="code" type="text" value=""/></p>
    <p><input type="submit" class="save_submit" value="保存">&nbsp<input type="reset" value="重置"></p>
</form>
</body>
<script src="https://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>

</html>
