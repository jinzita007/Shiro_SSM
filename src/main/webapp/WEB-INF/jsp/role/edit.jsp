<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/16
  Time: 下午4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑角色</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/plugin/zTree_v3/css/zTreeStyle/zTreeStyle.css">
</head>
<body>

<form id="myForm" action="" method="post">
    <p>角色：<input name="name" type="text" class="role_name" value="${data.name}"/></p>
    <ul id="treeDemo" class="ztree"></ul>
    <input type="hidden" name="id" value="${data.id}"/>
    <input type="hidden" name="permissionIds" value=""/>
    <input type="button" value="提交" class="btn_submit">
</form>

</body>
<script src="${pageContext.request.contextPath}/static/plugin/zTree_v3/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugin/zTree_v3/js/jquery.ztree.all.min.js"></script>
<script>
    var setting = {
        check: {
            enable: true,
            chkboxType: {"Y": "", "N": ""}
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id", // id编号命名
                pIdKey: "pid", // 父id编号命名
                rootPId: 0
            }
        }
    };


    //页面加载完毕时加载此方法
    $(document).ready(function () {

        $.ajax({
            url: "${pageContext.request.contextPath}/role/role_list",
            type: "get",
            async: false,
            dataType: "json",
            success: function (data) {
                console.log(data);
                var tree = $.fn.zTree.init($("#treeDemo"), setting, data.data);
                tree.expandAll(tree);//默认是展开的
            },
            error: function () {
                console.log("加载异常！")
            }
        });
        var id = $("input[name=id]").val();
        console.log(id);
        $.ajax({
            url: "${pageContext.request.contextPath}/role/roleperm/" + id,
            type: "get",
            async: false,
            dataType: "json",
            success: function (res) {
                for (var i = 0; i < res.rolePermissionList.length; i++) {
                    console.log(res.rolePermissionList[i].permissionId);
                    zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.checkNode(zTree.getNodeByParam("id", res.rolePermissionList[i].permissionId), true); //根据id在ztree的复选框中实现自动勾选
                }
            },
            error: function () {
                console.log("加载异常！")
            }
        });


        //提交按钮
        $(".btn_submit").click(function () {
            // 获取ztree对象
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            // 获取当前tree对象选中的节点数组
            var nodes = treeObj.getCheckedNodes("true");
            var array = new Array();
            for (var i = 0; i < nodes.length; i++) {
                array.push(nodes[i].id);
            }
            var ids = array.join(",");
            $("input[name=permissionIds]").val(ids);
            data = {
                id: $("input[name=id]").val(),
                name: $(".role_name").val(),
                permissionIds: $("input[name=permissionIds]").val()
            }
            console.log(data);
            $.ajax({
                url: "${pageContext.request.contextPath}/role/update",
                type: "post",
                data: data,
                async: false,
                contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    window.location.href = "/role/list";
                },
                error: function () {
                    console.log("异常！")
                }
            })
            return false;
        })


    });
</script>
</html>
