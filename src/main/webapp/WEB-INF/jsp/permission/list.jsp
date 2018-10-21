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
<html>
<head>
    <title>权限管理</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0" name="viewport">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css">

</head>
<body>

<%--<ul>--%>
    <%--<li>--%>
        <%--<shiro:hasPermission name="user:list">--%>
            <%--<a href="${pageContext.request.contextPath}/user/list">用户管理</a>--%>
        <%--</shiro:hasPermission>--%>

    <%--</li>--%>
    <%--<li>--%>
        <%--<shiro:hasPermission name="role:list">--%>
            <%--<a href="${pageContext.request.contextPath}/role/list">角色管理</a>--%>
        <%--</shiro:hasPermission>--%>
    <%--</li>--%>
    <%--<li>--%>
        <%--<shiro:hasPermission name="permission:list">--%>
            <%--<a href="${pageContext.request.contextPath}/permission/list">权限管理</a>--%>
        <%--</shiro:hasPermission>--%>
    <%--</li>--%>
    <%--<li>--%>
        <%--<shiro:hasPermission name="permission:list">--%>
            <%--<a href="${pageContext.request.contextPath}/permission/list">权限列表</a>--%>
        <%--</shiro:hasPermission>--%>
    <%--</li>--%>
    <%--<li>--%>
        <%--<shiro:hasPermission name="permission:add">--%>
            <%--<a href="${pageContext.request.contextPath}/permission/add">新增权限</a>--%>
        <%--</shiro:hasPermission>--%>
    <%--</li>--%>
<%--</ul>--%>
<%--<a href="${pageContext.request.contextPath}/user/logout">退出</a>--%>

<div class="container">
    <table id="table"></table>
    <br/>
    <button onclick="test()">选择</button>
</div>

</body>

<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.0/extensions/treegrid/bootstrap-table-treegrid.js"></script>
<script src="https://cdn.bootcss.com/jquery-treegrid/0.2.0/js/jquery.treegrid.min.js"></script>
<script>
    var $table = $('#table');

    $(function() {
        getData();
    });

    function getData() {
        $.ajax({
            async: false,
            type : 'GET',
            url : '${pageContext.request.contextPath}/permission/permlist',
            data:{},
            success : function(data) {
                tableData(data.data);
            },
            error: function () {
                console.log("error");
            }
        });
    }

    function tableData(data) {


        //控制台输出一下数据
        console.log(data);

        $table.bootstrapTable({
            data:data,
            idField: 'id',
            dataType:'jsonp',
            columns: [
                { field: 'check',  checkbox: true, formatter: function (value, row, index) {
                        if (row.check == true) {
                            // console.log(row.serverName);
                            //设置选中
                            return {  checked: true };
                        }
                    }
                },
                { field: 'name',  title: '名称' },
                // {field: 'id', title: '编号', sortable: true, align: 'center'},
                // {field: 'pid', title: '所属上级'},
                // { field: 'status',  title: '状态', sortable: true,  align: 'center', formatter: 'statusFormatter'  },
                { field: 'code', title: '权限值'  },
                { field: 'operate', title: '操作', align: 'center', events : operateEvents, formatter: 'operateFormatter' },
            ],

            // bootstrap-table-treegrid.js 插件配置 -- start

            //在哪一列展开树形
            treeShowField: 'name',
            //指定父id列
            parentIdField: 'pid',

            onResetView: function(data) {
                //console.log('load');
                $table.treegrid({
                    initialState: 'collapsed',// 所有节点都折叠
                    // initialState: 'expanded',// 所有节点都展开，默认展开
                    treeColumn: 1,
                    // expanderExpandedClass: 'glyphicon glyphicon-minus',  //图标样式
                    // expanderCollapsedClass: 'glyphicon glyphicon-plus',
                    onChange: function() {
                        $table.bootstrapTable('resetWidth');
                    }
                });

                //只展开树形的第一级节点
                $table.treegrid('getRootNodes').treegrid('expand');

            },
            onCheck:function(row){
                var datas = $table.bootstrapTable('getData');
                // 勾选子类
                selectChilds(datas,row,"id","pid",false);

                // 勾选父类
                selectParentChecked(datas,row,"id")

                // 刷新数据
                $table.bootstrapTable('load', datas);
            },

            onUncheck:function(row){
                var datas = $table.bootstrapTable('getData');
                selectChilds(datas,row,"id","pid", false);
                $table.bootstrapTable('load', datas);
            },
            // bootstrap-table-treetreegrid.js 插件配置 -- end
        });
    }


    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            '<button type="button" class="RoleOfadd btn-small  btn-primary" style="margin-right:15px;"><i class="fa fa-plus" ></i>&nbsp;新增</button>',
            '<button type="button" class="RoleOfedit btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;修改</button>',
            '<button type="button" class="RoleOfdelete btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>'
        ].join('');

    }
    // 格式化类型
    function typeFormatter(value, row, index) {
        if (value === 'menu') {  return '菜单';  }
        if (value === 'button') {  return '按钮'; }
        if (value === 'api') {  return '接口'; }
        return '-';
    }
    // 格式化状态
    // function statusFormatter(value, row, index) {
    //     if (value === 1) {
    //         return '<span class="label label-success">正常</span>';
    //     } else {
    //         return '<span class="label label-default">锁定</span>';
    //     }
    // }

    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfadd': function (e, value, row, index) {
            add(row.id);
        },
        'click .RoleOfdelete': function (e, value, row, index) {
            del(row.id);
        },
        'click .RoleOfedit': function (e, value, row, index) {
            update(row.id);
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
    function selectChilds(datas,row,id,pid,checked) {
        for(var i in datas){
            if(datas[i][pid] == row[id]){
                datas[i].check=checked;
                selectChilds(datas,datas[i],id,pid,checked);
            };
        }
    }

    function selectParentChecked(datas,row,id,pid){
        for(var i in datas){
            if(datas[i][id] == row[pid]){
                datas[i].check=true;
                selectParentChecked(datas,datas[i],id,pid);
            };
        }
    }

    function test() {
        var selRows = $table.bootstrapTable("getSelections");
        if(selRows.length == 0){
            alert("请至少选择一行");
            return;
        }

        var postData = "";
        $.each(selRows,function(i) {
            postData +=  this.id;
            if (i < selRows.length - 1) {
                postData += "， ";
            }
        });
        alert("你选中行的 id 为："+postData);

    }

    function add(id) {
        alert("add 方法 , id = " + id);
    }
    function del(id) {
        alert("del 方法 , id = " + id);
    }
    function update(id) {
        alert("update 方法 , id = " + id);
    }
</script>
</html>
