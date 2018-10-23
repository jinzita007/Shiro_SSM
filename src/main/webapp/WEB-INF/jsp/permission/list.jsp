<%--
  Created by IntelliJ IDEA.
  User: zhouyulong
  Date: 2018/10/16
  Time: 下午1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0" name="viewport">
    <title>权限管理 - 权限列表</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css">
</head>

<body>
<jsp:include page="../page/header.jsp"/>

<div class="container">
    <h3>权限列表</h3>
    <shiro:hasPermission name="permission:add">
    <button type="button" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-perm-form">添加父节点</button>
    </shiro:hasPermission>
    <br/>
    <br/>


    <!--添加父节点表单-->
    <div class="modal fade" id="add-perm-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加权限</h4>
                </div>
                <div class="modal-body">
                    <form class="perm-form">
                        <input name="pid" type="hidden" id="pid" value="0"/>
                        <div class="form-group">
                            <label for="name">权限名</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="权限名">
                        </div>
                        <div class="form-group">
                            <label for="url">URL</label>
                            <input type="url" name="url" class="form-control" id="url" placeholder="URL">
                        </div>
                        <div class="form-group">
                            <label for="code">权限代码</label>
                            <input type="code" name="code" class="form-control" id="code" placeholder="权限代码">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary add-perm-submit">添加 </button>
                </div>
            </div>
        </div>
    </div>

    <!--添加子节点表单-->
    <div class="modal fade" id="add-permchild-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加子节点</h4>
                </div>
                <div class="modal-body">
                    <form class="permchild-form">
                        <input name="pid" type="hidden" id="pid" />
                        <fieldset disabled>
                            <div class="form-group">
                                <label for="disabledTextInput">父节点</label>
                                <input type="text" class="form-control pname" id="disabledTextInput" placeholder="父节点">
                            </div>
                        </fieldset>

                        <div class="form-group">
                            <label for="name">子节点</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="子节点">
                        </div>
                        <div class="form-group">
                            <label for="url">URL</label>
                            <input type="url" name="url" class="form-control" id="url" placeholder="URL">
                        </div>
                        <div class="form-group">
                            <label for="code">权限代码</label>
                            <input type="code" name="code" class="form-control" id="code" placeholder="权限代码">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary add-permchild-submit">添加</button>
                </div>
            </div>
        </div>
    </div>

    <!--修改权限表单-->
    <div class="modal fade" id="edit-perm-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改权限</h4>
                </div>
                <div class="modal-body">
                    <form class="edit-perm-form">
                        <input name="id" type="hidden" id="id" />
                        <input name="pid" type="hidden" id="pid" />
                        <div class="form-group">
                            <label for="name">权限名</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="父节点">
                        </div>
                        <div class="form-group">
                            <label for="url">URL</label>
                            <input type="url" name="url" class="form-control" id="url" placeholder="URL">
                        </div>
                        <div class="form-group">
                            <label for="code">权限代码</label>
                            <input type="code" name="code" class="form-control" id="code" placeholder="权限代码">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary edit-perm-submit">保存</button>
                </div>
            </div>
        </div>
    </div>


    <table id="table"></table>
    <br/>
    <button onclick="test()">选择</button>
</div>
</body>
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.0/extensions/treegrid/bootstrap-table-treegrid.js"></script>
<script src="https://cdn.bootcss.com/jquery-treegrid/0.2.0/js/jquery.treegrid.min.js"></script>
<script type="text/javascript">
    var $table = $('#table');

    $(function () {
        getData();
        addPerm();
        add();
        update();
    });

    //获取权限列表接口
    function getData(data) {
        $.ajax({
            async: false,
            type: 'GET',
            url: '${pageContext.request.contextPath}/permission/permlist',
            data: {},
            success: function (data) {
                tableData(data.data);
            },
            error: function () {
                console.log("error");
            }
        });
    }


    function tableData(data) {

        $table.bootstrapTable({
            async: false,
            type: 'GET',
            url: '${pageContext.request.contextPath}/permission/permlist',
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
                    field: 'name',
                    title: '名称'
                },
                // {field: 'id', title: '编号', sortable: true, align: 'center'},
                // {field: 'pid', title: '所属上级'},
                // { field: 'status',  title: '状态', sortable: true,  align: 'center', formatter: 'statusFormatter'  },
                {
                    field: 'code',
                    title: '权限值'
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents,
                    formatter: 'operateFormatter'
                },
            ],

            // bootstrap-table-treegrid.js 插件配置 -- start

            //在哪一列展开树形
            treeShowField: 'name',
            //指定父id列
            parentIdField: 'pid',

            onResetView: function (data) {
                //console.log('load');
                $table.treegrid({
                    initialState: 'collapsed', // 所有节点都折叠
                    // initialState: 'expanded',// 所有节点都展开，默认展开
                    treeColumn: 1,
                    // expanderExpandedClass: 'glyphicon glyphicon-minus',  //图标样式
                    // expanderCollapsedClass: 'glyphicon glyphicon-plus',
                    onChange: function () {
                        $table.bootstrapTable('resetWidth');
                    }
                });

                //只展开树形的第一级节点
                $table.treegrid('getRootNodes').treegrid('expand');

            },
            onCheck: function (row) {
                var datas = $table.bootstrapTable('getData');
                // 勾选子类
                selectChilds(datas, row, "id", "pid", false);

                // 勾选父类
                selectParentChecked(datas, row, "id")

                // 刷新数据
                $table.bootstrapTable('load', datas);
            },

            onUncheck: function (row) {
                var datas = $table.bootstrapTable('getData');
                selectChilds(datas, row, "id", "pid", false);
                $table.bootstrapTable('load', datas);
            },
            // bootstrap-table-treetreegrid.js 插件配置 -- end
        });
    }


    // 格式化按钮
    function operateFormatter(value, row, index) {
        if(row.pid == 0) {
            return [
                '<shiro:hasPermission name="role:add"><button type="button" class="PPermOfadd btn-small btn-primary" style="margin-right:15px;" data-toggle="modal" data-target="#add-permchild-form"><i class="fa fa-plus"></i>&nbsp;新增</button></shiro:hasPermission>',
                '<shiro:hasPermission name="role:update"><button type="button" class="PermOfedit btn-small btn-primary" style="margin-right:15px;" data-toggle="modal" data-target="#edit-perm-form"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</button></shiro:hasPermission>',
                '<shiro:hasPermission name="role:delete"><button type="button" class="PermOfdelete btn-small btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o"></i>&nbsp;删除</button></shiro:hasPermission>'
            ].join('');
        }
        return [
            '<shiro:hasPermission name="role:update"><button type="button" class="PermOfedit btn-small btn-primary" style="margin-right:15px;" data-toggle="modal" data-target="#edit-perm-form"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</button></shiro:hasPermission>',
            '<shiro:hasPermission name="role:delete"><button type="button" class="PermOfdelete btn-small btn-primary" style="margin-right:-10%;"><i class="fa fa-trash-o"></i>&nbsp;删除</button></shiro:hasPermission>'
        ].join('');

    }
    // 格式化类型
    function typeFormatter(value, row, index) {
        if (value === 'menu') {
            return '菜单';
        }
        if (value === 'button') {
            return '按钮';
        }
        if (value === 'api') {
            return '接口';
        }
        return '-';
    }

    //初始化操作按钮的方法
    window.operateEvents = {
        //新增子节点
        'click .PPermOfadd': function (e, value, row, index) {
            // add(row.pid);
            showPPerm(row);
        },
        //编辑
        'click .PermOfedit': function (e, value, row, index){
            showPerme(row);
        },
        //删除
        'click .PermOfdelete': function (e, value, row, index) {
            del(row.id);
        }

    };
</script>
<script>
    /**
     * 选中父项时，同时选中子项
     * @param datas 所有的数据
     * @param row 当前数据
     * @param id id 字段名
     * @param pid 父id字段名
     */
    function selectChilds(datas, row, id, pid, checked) {
        for (var i in datas) {
            if (datas[i][pid] == row[id]) {
                datas[i].check = checked;
                selectChilds(datas, datas[i], id, pid, checked);
            };
        }
    }

    function selectParentChecked(datas, row, id, pid) {
        for (var i in datas) {
            if (datas[i][id] == row[pid]) {
                datas[i].check = true;
                selectParentChecked(datas, datas[i], id, pid);
            };
        }
    }

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

    //显示新增子节点
    function showPPerm(row) {
        console.log(row.name);
        $('.permchild-form #pid').val(row.id);
        if(row.pid == 0) {
            $('.permchild-form .pname').val(row.name);
        }
    }

    //显示编辑
    function showPerme(row) {
        $('.edit-perm-form #id').val(row.id);
        $('.edit-perm-form #pid').val(row.pid);
        $('.edit-perm-form #name').val(row.name);
        $('.edit-perm-form #url').val(row.url);
        $('.edit-perm-form #code').val(row.code);
    }


    //增加父节点接口
    function addPerm() {
        $(".add-perm-submit").click(function () {
            var data = $(".perm-form").serialize();
            console.log(data);
            //请求新增权限
            $.ajax({
                async: false,
                url: "${pageContext.request.contextPath}permission/add",
                type: "post",
                dataType: "json",
                data: data,
                success: function (data) {
                    console.log(data);
                    $("#table").bootstrapTable("refresh");
                    $("#add-perm-form").modal("hide");
                },
                error: function () {
                    console.log("error");
                }
            });
            return false;
        })
    }

    //新增子节点接口
    function add() {
        $(".add-permchild-submit").click(function () {
            var data = $(".permchild-form").serialize();
            var pid = $('.permchild-form #pid').val();
            console.log(data);

            $.ajax({
                async: false,
                url: "${pageContext.request.contextPath}/permission/"+pid+"/appendChild",
                type: "post",
                dataType: "json",
                data: data,
                success: function (data) {
                    console.log(data);
                    $("#table").bootstrapTable("refresh");
                    $("#add-permchild-form").modal("hide");
                    // window.location.href = "/permission/list";
                },
                error: function () {
                    console.log("error");
                }
            });

            return false;
        })

    }

    //提交修改
    function update() {
        $(".edit-perm-submit").click(function (e) {
            e.preventDefault();
            var data = $(".edit-perm-form").serialize();
            console.log(data);
            //请求修改权限
            $.ajax({
                url: "${pageContext.request.contextPath}/permission/update",
                type: "post",
                cache: false,
                dataType: "json",
                data: data,
                success: function (data) {
                    console.log(data);
                    $("#table").bootstrapTable("refresh");
                    $("#edit-perm-form").modal("hide");
                },
                error: function () {
                    console.log("error");
                }
            });
            return false;
        })
    }

    //删除权限ID
    function del(id) {
        if (confirm('确认删除ID为"' + id + '"的权限吗？')) {
            //请求删除该权限
            $.ajax({
                url: "${pageContext.request.contextPath}/permission/delete",
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


</script>

</html>