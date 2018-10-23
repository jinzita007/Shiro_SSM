<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/11
  Time: 下午3:04
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
    <title>用户管理 - 用户列表</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css">
</head>

<body>
<jsp:include page="../page/header.jsp"/>

<div class="container">

    <h3>用户列表</h3>
    <shiro:hasPermission name="user:add">
    <button type="button" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-user-form">添加新用户</button>
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
                    <h4 class="modal-title">添加新用户</h4>
                </div>
                <div class="modal-body">
                    <form class="user-form">
                        <div class="form-group">
                            <label for="usernameInput">用户名</label>
                            <input type="text" name="username" class="form-control" id="usernameInput" placeholder="用户名">
                        </div>
                        <div class="form-group">
                            <label for="passwordInput">密码</label>
                            <input type="password" name="password" class="form-control" id="passwordInput" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="emailInput">电子邮箱</label>
                            <input type="email" name="email" class="form-control" id="emailInput" placeholder="密码">
                        </div>
                        <label>角色选择</label>
                        <div class="roles-div"></div>
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
    <%--<br/>--%>
    <%--<button onclick="test()">选择</button>--%>

    <!--修改用户角色表单-->
    <div class="modal fade" id="edit-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改用户角色</h4>

                </div>
                <div class="modal-body">

                    <form class="edit-user-form">
                        <div class="form-group">
                            <input name="id" type="hidden" id="id" />
                            <input name="urId" type="hidden" id="urId" />
                            <label for="usernameInput">用户名</label>
                            <input type="text" name="username" class="form-control" id="username" placeholder="用户名">
                        </div>
                        <div class="form-group">
                            <label for="passwordInput">密码</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="emailInput">电子邮箱</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="电子邮箱">
                        </div>
                        <label>角色选择</label>
                        <div class="roles-div2"></div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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
<script src="https://cdn.bootcss.com/jquery-treegrid/0.2.0/js/jquery.treegrid.min.js"></script>
<script type="text/javascript">
    var $table = $('#table');
    var $modal = $('#modal').modal({
        show: false
    });


    $(function () {
        tableData();
        getRole();
        AddUser();
        update();

    });

    // 获取角色选择接口
    function getRole(roleId) {
        $(".roles-div").html("");
        $(".roles-div2").html("");
        $.ajax({
            async: false,
            type: 'GET',
            url: '${pageContext.request.contextPath}/user/role_list',
            data: {},
            success: function (data) {
                console.log(data);
                if (data.data != null && data.data.length > 0) {

                    var htmls = '<select name="roleIds">';
                    htmls += '<option value="" selected>=请选择=</option>';
                    for (var i = 0; i < data.data.length; i++) {
                        htmls += '<option value="' + data.data[i].id + '">';
                        htmls += data.data[i].name;
                        htmls += '</option>';
                    }
                    htmls += '</select>';
                    $(".roles-div").html(htmls);

                    var htmls2 = '<select name="roleIds">';
                    htmls2 += '<option value="" selected>=请选择=</option>';
                    for (var i = 0; i < data.data.length; i++) {
                        if (data.data[i].id == roleId) {
                            htmls2 += '<option value="' + data.data[i].id + '" selected>';
                        } else {
                            htmls2 += '<option value="' + data.data[i].id + '">';
                        }
                        htmls2 += data.data[i].name;
                        htmls2 += '</option>';
                    }
                    htmls2 += '</select>';
                    $(".roles-div2").html(htmls2);
                }



            },
            error: function () {
                console.log("error");
            }
        });
    }

    // 新增用户接口
    function AddUser() {
        $(".add-user-submit").click(function () {
            //请求添加新用户
            var data = $(".user-form").serialize();
            console.log(data)
            $.ajax({
                url: "${pageContext.request.contextPath}/user/add",
                data: data,
                type: "POST",
                dataType: "json",
                success: function (data) {
                    $(".add-user-form").empty();
                    $("#add-user-form").modal("hide");
                    $("#table").bootstrapTable("refresh");
                }
            });
        });
    }


    function showModal(row) {

        $.ajax({
            cache: false,
            async: false,
            type: 'GET',
            dataType: "json",
            contentType: 'application/json',
            url: '${pageContext.request.contextPath}/user/update/' + row.id,
            success: function (data) {

                getRole(data.userRole.role_id);

                $('#id').val(data.data.id);
                $('#urId').val(data.userRole.urId);
                $('#username').val(data.data.username);
                $('#password').val(data.data.password);
                $('#email').val(data.data.email);
                console.log(data);

            },
            error: function () {
                console.log("error");
            }
        });


    }




    function tableData() {
        //控制台输出一下数据
        // console.log(data);
        $table.bootstrapTable({
            // data:data,
            url: '${pageContext.request.contextPath}/user/list',
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
                    field: 'username',
                    title: '用户名'
                },
                {
                    field: 'email',
                    title: 'Email'
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
            '<shiro:hasPermission name="user:update"><button type="button" class="update btn-small btn-primary" style="margin-right:15px;" data-toggle="modal" data-target="#edit-user-form"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</button></shiro:hasPermission>',
            '<shiro:hasPermission name="user:delete"><button type="button" class="remove btn-small btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button></shiro:hasPermission>'
        ].join('');

    }


    //初始化操作按钮的方法
    window.operateEvents = {

        'click .update': function (e, value, row) {
            showModal(row);
        },
        'click .remove': function (e, value, row, index) {
            del(row.id);
        }
    };
</script>
<script>
    function test() {
        var selRows = $table.bootstrapTable("getSelections");
        if (selRows.length == 0) {
            alert("请至少选择一行");
            return;
        }

        var postData = "";
        $.each(selRows, function (i) {
            postData += this.id;
            if (i < selRows.length - 1) {
                postData += "， ";
            }
        });
        alert("你选中行的 id 为：" + postData);

    }

    function del(id) {
        if (confirm('确认删除ID为"' + id + '"的用户吗？')) {
            //请求删除该用户
            $.ajax({
                url: "${pageContext.request.contextPath}/user/delete",
                data: {
                    userId: id
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

    function update() {

        $(".update-user-submit").on("click", function (e) {
            e.preventDefault();
            var data = $(".edit-user-form").serialize();
            console.log(data);
            //请求修改用户
            $.ajax({
                url: "${pageContext.request.contextPath}/user/update",
                type: "post",
                cache: false,
                dataType: "json",
                data: data,
                success: function (data) {
                    console.log(data);
                    $("#table").bootstrapTable("refresh");
                    $("#edit-user-form").modal("hide");

                },
                error: function () {
                    console.log("error");
                }
            });
            return false;
        })
    }
</script>
</html>