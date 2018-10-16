<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/13
  Time: 下午12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>
</head>
<body>
<form id="form1" class="user_form">
    <p>用户名：<input name="username" type="text" value=""/></p>
    <p>密　码：<input name="password" type="password" value=""/></p>
    <p>电子邮箱：<input name="email" type="email" value=""/></p>

    <div class="form-roles">
        <label>角色选择</label>
        <select name="roleIds">
            <option value="" selected>=请选择=</option>
            <c:forEach items="${roleList}" var="value">
                <option value="${value.id}">
                        ${value.name}
                </option>
            </c:forEach>
        </select>
    </div>
    <p><input type="submit" class="save_submit" value="保存">&nbsp<input type="reset" value="重置"></p>
</form>
</body>
<script>
    $(document).ready(function () {
        $(".save_submit").click(function () {
            var data = $(".user_form").serialize();
            console.log(data);
            //请求新增用户
            $.ajax({
                url: "add",
                type: "post",
                dataType: "json",
                data: data,
                success: function (data) {
                    console.log(data);
                    window.location.href = "/user/list";
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
