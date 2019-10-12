<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户管理</title>
</head>
<body>
<div id="main">
    <div id="toolbar">
        <a class="waves-effect btn btn-info btn-sm" href="javascript:addAction();"><i class="zmdi zmdi-plus"></i>
            新增用户</a>
        <a class="waves-effect btn btn-warning btn-sm" href="javascript:editAction();"><i class="zmdi zmdi-edit"></i>
            编辑用户</a>
        <a class="waves-effect btn btn-danger btn-sm" href="javascript:deleteAction();"><i class="zmdi zmdi-delete"></i>
            删除用户</a>
        <a class="waves-effect btn btn-primary btn-sm" href="javascript:roleAction();"><i class="zmdi zmdi-male"></i>
            用户角色</a>
    </div>
    <table id="table"></table>
</div>

<!-- 角色管理 -->
<div class="modal fade" id="roleModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 id="roleModalTitle" class="modal-title">
                    用户拥有的角色
                </h4>
            </div>
            <div class="modal-body">
                <div id="roleZtree" class="ztree"></div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default btn-sm" data-dismiss="modal"><i
                        class="zmdi zmdi-close"></i> 关闭
                </button>
                <button id="roleSave-btn" class="waves-effect btn btn-success btn-sm"
                        style="margin-left: 10px; " type="button"
                        href="javascript:;">
                    <i class="zmdi zmdi-save"></i> 保存
                </button>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">

    var $table = $('#table');
    var treeObj;
    var userId;
    $(function () {

        $table.bsTable({
            url: '${pageContext.request.contextPath}/common/user/list',
            idField: 'userId',
            // 指定主键列
            singleSelect: true,
            search: true,
            clickToSelect: true,
            detailView: false,
            pageNumber: 1,
            //初始化加载第一页，默认第一页
            pageSize: 10,
            //每页的记录行数（*）
            pageList: [10, 15, 20],
            //可供选择的每页的行数（*）
            columns: [{
                field: 'state',
                checkbox: true
            },
                {
                    field: 'userId',
                    title: 'ID',
                    align: 'userId',
                    visible: false
                },
                {
                    field: 'userHosp',
                    title: '医院',
                    align: 'center',
                    visible: false
                },
                {
                    field: 'userDept',
                    title: '科室',
                    align: 'center'
                },
                {
                    field: 'userCode',
                    title: '工号',
                    align: 'center'
                },
                {
                    field: 'userName',
                    title: '姓名',
                    align: 'center'
                },
                {
                    field: 'userType',
                    title: '类别',
                    align: 'center'
                },
                {
                    field: 'userValid',
                    title: '是否有效',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (value) {
                            return '<span class="label label-info">正常</span>';
                        } else {
                            return '<span class="label label-danger">失效</span>';
                        }
                    }
                }]
        });




    });



    // 加载角色 tree 结构
    function loadRoleTree() {
        // 角色管理 tree 构建
        var setting = {
            async: {
                enable: true,
                url: "${pageContext.request.contextPath}/common/role/roleCheckedTree",
                autoParam: ["id", "pid", "name", "level"],
                otherParam: {"userId": userId}
            },
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: {"Y": "s", "N": "s"}
            },
            view: {
                fontCss: setFontCss
            }
        };
        // 初始化 tree 数据
        treeObj = $.fn.zTree.init($('#roleZtree'), setting);

        // 设置样式
        function setFontCss(treeId, treeNode) {
            return treeNode.valid == false ? {color: "red"} : {};
        };

        $('#roleModal').modal('show');
    }

    // 保存角色
    $('#roleSave-btn').click(function () {
        var nodes = treeObj.getCheckedNodes(true);
        var roleStr = "";
        $.map(nodes, function (item, index) {
            roleStr += "," + item.id;
        });

        $.post('${pageContext.request.contextPath}/common/user/roleSave', {
            'userId': userId,
            'roleStr': roleStr.substr(1)
        }, function (data) {
            $('#roleModal').modal('hide');
            $.alert(data.msg);
        });

    });

    // 添加
    function addAction() {
        index_Tab.addTab("新增用户", "common/user/addOrEditPage");
    }

    // 编辑
    function editAction() {
        var rows = $table.bootstrapTable('getSelections');
        if (rows.length == 0) {
            $.confirm({
                title: false,
                content: '请至少选择一条记录！',
                autoClose: 'cancel|3000',
                backgroundDismiss: true,
                buttons: {
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }
            });
        } else {
            index_Tab.addTab(rows[0].userName + " - 用户资料", "common/user/addOrEditPage?userID=" + rows[0].userId);
        }
    }



    // 删除
    function deleteAction() {
        var rows = $table.bootstrapTable('getSelections');
        if (rows.length == 0) {
            $.confirm({
                title: false,
                content: '请选择一条记录！',
                autoClose: 'cancel|3000',
                backgroundDismiss: true,
                buttons: {
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }
            });
        } else {
            var deleteId = rows[0].userId;
            var deleteCode = rows[0].userCode;
            $.confirm({
                type: 'red',
                animationSpeed: 300,
                title: false,
                content: '确认删除该用户吗？',
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/common/user/delete",
                                type: "post",
                                data: {
                                    userId: deleteId,
                                    userCode: deleteCode,
                                },
                                success: function (data) {
                                    if (!data.success) {
                                        $.alert("删除失败");
                                    }
                                }
                            });
                            $("#table").bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/common/user/list'});
                        }
                    },
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }
            });
        }
    }

    // 用户角色
    function roleAction() {
        var rows = $table.bootstrapTable('getSelections');
        if (rows.length == 0) {
            $.confirm({
                title: false,
                content: '请选择一条记录！',
                autoClose: 'cancel|3000',
                backgroundDismiss: true,
                buttons: {
                    cancel: {
                        text: '取消',
                        btnClass: 'waves-effect waves-button'
                    }
                }
            });
        } else {
            var row = rows[0];
            if ('admin' == row.userType) {
                $.alert('对不起，您不能编辑管理员的角色！');
            } else {
                userId = row.userId;
                $('#roleModalTitle').html('用户[' + row.userName + ']拥有的角色');
                loadRoleTree();
            }
        }
    }

    //window.parent慎用
    var top_tabs = $("#tabs", window.parent.document);//window.parent.document.getElementById("");

    // 子页面下调用选项卡对象
    var index_Tab = {
        addTab: function (title, url) {
            var index = url.replace(/\./g, '_').replace(/\//g, '_').replace(/:/g, '_').replace(/\?/g, '_').replace(/,/g, '_').replace(/=/g, '_').replace(/&/g, '_');
            // 如果存在选项卡，则激活，否则创建新选项卡
            if ($('#tab_' + index, window.parent.document).length == 0) {
                // 添加选项卡
                $('.content_tab li', window.parent.document).removeClass('cur');
                var tab = '<li id="tab_' + index + '" data-index="' + index + '" class="cur"><a class="waves-effect waves-light">' + title + '</a></li>';//<i class="zmdi zmdi-close"></i><
                $('.content_tab>ul', window.parent.document).append(tab);
                // 添加iframe
                $('.iframe', window.parent.document).removeClass('cur');
                var iframe = '<div id="iframe_' + index + '" class="iframe cur"><iframe class="tab_iframe" src="' + url + '" width="100%" frameborder="0" scrolling="auto" onload="changeFrameHeight(this)"></iframe></div>';
                $('.content_main', window.parent.document).append(iframe);
                initScrollShow();
                $('.content_tab>ul', window.parent.document).animate({scrollLeft: window.parent.document.getElementById('tabs').scrollWidth - window.parent.document.getElementById('tabs').clientWidth}, 200, function () {
                    initScrollState();
                });
            } else {
                $('#tab_' + index, window.parent.document).trigger('click');
            }
        },
        closeTab: function ($item) {
            var closeable = $item.data('closeable');
            if (closeable != false) {
                // 如果当前时激活状态则关闭后激活左边选项卡
                if ($item.hasClass('cur')) {
                    $item.prev().trigger('click');
                }
                // 关闭当前选项卡
                var index = $item.data('index');
                $('#iframe_' + index).remove();
                $item.remove();
            }
            initScrollShow();
        }
    }

    function initScrollShow() {
        if (window.parent.document.getElementById('tabs').scrollWidth > window.parent.document.getElementById('tabs').clientWidth) {
            $('.content_tab', window.parent.document).addClass('scroll');
        } else {
            $('.content_tab', window.parent.document).removeClass('scroll');
        }
    }

    function initScrollState() {
        if ($('.content_tab>ul', window.parent.document).scrollLeft() == 0) {
            $('.tab_left>a', window.parent.document).removeClass('active');
        } else {
            $('.tab_left>a', window.parent.document).addClass('active');
        }
        if (($('.content_tab>ul', window.parent.document).scrollLeft() + window.parent.document.getElementById('tabs').clientWidth) >= window.parent.document.getElementById('tabs').scrollWidth) {
            $('.tab_right>a', window.parent.document).removeClass('active');
        } else {
            $('.tab_right>a', window.parent.document).addClass('active');
        }
    }
</script>

</html>