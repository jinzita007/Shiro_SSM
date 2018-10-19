<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/13
  Time: 下午3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改用户页面</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/plugin/zTree_v3/css/zTreeStyle/zTreeStyle.css">

</head>
<body>
修改用户页面
<form id="form1" class="user_form">

    <%--<input type="hidden" class="form_user_id" value="${userRole.id}" data-id="${userRole.id}"/>--%>
    <input type="hidden" class="form_user_urid" name="urId" value="${userRole.urId}"/>
    <p>用户名：<input name="username" type="text" value="${userRole.username}" class="form_user_id" data-id="${userRole.id}"/></p>
    <p>密　码：<input name="password" type="password" value="${userRole.password}"/></p>
    <p>电子邮箱：<input name="email" type="email" value="${userRole.email}"/></p>
        <%--<p>用户角色ID：<input name="urId" type="text" value="${userRole.urId}"/></p>--%>
    <c:set var="id" value="${userRole.role_id}" scope="request"/>
    <div class="form-roles">
        <label>角色选择</label>
        <select name="roleIds" id="roleIds">
            <option value="" selected>=请选择=</option>
            <c:forEach items="${roleList}" var="value">
                <option value="${value.id}" <c:if test="${value.id == id}">
                    selected
                </c:if>>
                        ${value.name}
                </option>
            </c:forEach>
        </select>

    </div>
    <p><input type="submit" class="save_submit" value="保存">&nbsp<input type="reset" value="重置"></p>
</form>
</body>
<%--<script src="https://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/static/plugin/zTree_v3/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugin/zTree_v3/js/jquery.ztree.all.min.js"></script>
<script>

    $(document).ready(function () {
        $(".save_submit").click(function () {
            var data = $(".user_form").serialize();
            var id = $(".form_user_id").attr("data-id");
            console.log(data);
            //请求新增用户
            $.ajax({
                url: "${pageContext.request.contextPath}/user/update/"+id,
                type: "post",
                dataType: "json",
                "cache":false,
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
