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
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0" name="viewport">
    <title>角色管理 - 角色列表</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/zTree_v3/css/zTreeStyle/zTreeStyle.css">
</head>

<body>
<jsp:include page="../page/header.jsp"/>
<div class="container">

    <h3>角色列表</h3>
    <shiro:hasPermission name="role:add">
    <button type="button" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-user-form">添加角色</button>
    </shiro:hasPermission>
    <br/>
    <br/>


    <!--添加新用户表单-->
    <div class="modal fade" id="add-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加角色</h4>
                </div>
                <div class="modal-body">
                    <form class="user-form">
                        <div class="form-group">
                            <label for="name">角色名</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="角色名">
                        </div>

                        <label>权限分配</label>
                        <ul id="treeDemo" class="ztree"></ul>
                        <input type="hidden" name="permissionIds" value="" />
                        <!-- <div class="roles-div"></div> -->
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary add-user-submit">添加 </button>
                </div>
            </div>
        </div>
    </div>

    <table id="table" class="user-list"></table>
    <br/>
    <button onclick="test()">选择</button>

    <!--修改用户角色表单-->
    <div class="modal fade" id="edit-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改角色权限</h4>

                </div>
                <div class="modal-body">

                    <form class="edit-user-form">
                        <div class="form-group">
                            <input name="id" type="hidden" id="id" />
                            <!-- <input name="urId" type="hidden" id="urId"/> -->
                            <label for="name">角色名</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="角色名">
                        </div>

                        <label>权限分配</label>
                        <ul id="treeDemo2" class="ztree"></ul>
                    </form>

                </div>
                <div class="modal-footer">
                    <button id="closeTree" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary update-user-submit">提交 </button>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.0/extensions/treegrid/bootstrap-table-treegrid.js"></script>
<script src="${pageContext.request.contextPath}/static/plugin/zTree_v3/js/jquery.ztree.all.min.js"></script>

<script type="text/javascript">
    var $table = $('#table');

    $(function () {
        tableData();
    });

    function tableData() {
        $table.bootstrapTable({
            // data:data,
            async: false,
            url: '${pageContext.request.contextPath}/role/list',
            method: 'get',
            dataType: 'json',
            idField: 'id',
            columns: [{
                field: 'check',
                checkbox: true,
                formatter: function (value, row, index) {
                    if (row.check == true) {
                        // console.log(row.serverName);
                        //设置选中
                        return {
                            checked: true
                        };
                    }
                }
            },
                {
                    field: 'id',
                    title: 'ID'
                },
                {
                    field: 'name',
                    title: '角色名'
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents,
                    formatter: 'operateFormatter'
                },
            ],
        });

    }

    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            '<shiro:hasPermission name="role:update"><button type="button" class="update btn-small btn-primary" style="margin-right:15px;" data-toggle="modal" data-target="#edit-user-form"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</button></shiro:hasPermission>',
            '<shiro:hasPermission name="role:delete"><button type="button" class="remove btn-small btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button></shiro:hasPermission>'
        ].join('');

    }

    //初始化操作按钮的方法
    window.operateEvents = {

        'click .update': function (e, value, row) {
            showModal(row);
            getList();
            getRolePerm(row.id);
        },
        'click .remove': function (e, value, row, index) {
            del(row.id);
        },

    };
</script>

<script>
    var setting = {
        check: {
            enable: true,
            chkboxType: {
                "Y": "",
                "N": ""
            }
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

    function del(id) {
        if (confirm('确认删除ID为"' + id + '"的角色吗？')) {
            //请求删除该用户
            $.ajax({
                url: "${pageContext.request.contextPath}/role/delete",
                data: {
                    id: id
                },
                type: "POST",
                success: function () {
                    $table.bootstrapTable('remove', {
                        field: 'id',
                        values: [id]
                    });
                }
            });
        }
    }

    function getList() {
        $.ajax({
            url: "${pageContext.request.contextPath}/role/role_list",
            type: "get",
            async: false,
            dataType: "json",
            success: function (data) {
                console.log(data);
                $.fn.zTree.init($("#treeDemo"), setting, data.data);
                var tree = $.fn.zTree.init($("#treeDemo2"), setting, data.data);
                tree.expandAll(tree); //默认是展开的
            },
            error: function () {
                console.log("加载异常！")
            }
        });

    }

    function getRolePerm(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/role/roleperm/" + id,
            type: "get",
            async: false,
            dataType: "json",
            success: function (res) {
                for (var i = 0; i < res.rolePermissionList.length; i++) {
                    console.log(res.rolePermissionList[i].permissionId);
                    zTree = $.fn.zTree.getZTreeObj("treeDemo2");
                    zTree.checkNode(zTree.getNodeByParam("id", res.rolePermissionList[i].permissionId),
                        true); //根据id在ztree的复选框中实现自动勾选
                }
            },
            error: function () {
                console.log("加载异常！")
            }
        });
    }


    function showModal(row) {
        // console.log(row.name);
        // getRolePerm(row.id);
        $('.edit-user-form #id').val(row.id);
        $('.edit-user-form #name').val(row.name);
    }

    //页面加载完毕时加载此方法
    $(document).ready(function () {
        getList();
        // $("#closeTree").click(function () {
        //         $("#treeDemo2").empty();
        // });

        //新增--提交按钮
        $(".add-user-submit").click(function () {
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
                name: $("#name").val(),
                permissionIds: $("input[name=permissionIds]").val()
            }
            console.log(data);
            $.ajax({
                url: "${pageContext.request.contextPath}/role/add",
                type: "post",
                async: false,
                data: data,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#table").bootstrapTable("refresh");
                    $("#add-user-form").modal("hide");
                },
                error: function () {
                    console.log("异常！")
                }
            })
            return false;
        })

        // 编辑--提交保存
        $(".update-user-submit").click(function () {
            // 获取ztree对象
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
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
                name: $(".edit-user-form #name").val(),
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
                    $("#table").bootstrapTable("refresh");
                    $("#edit-user-form").modal("hide");
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
