<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>字典管理</title>
</head>
<body>
<div id="main">
    <div id="toolbar">
        <a class="waves-effect btn btn-info btn-sm" href="javascript:createAction();"><i class="zmdi zmdi-plus"></i>
            新增记录</a>
        <a class="waves-effect btn btn-warning btn-sm" href="javascript:updateAction();"><i class="zmdi zmdi-edit"></i>
            编辑记录</a>
        <a class="waves-effect btn btn-danger btn-sm" href="javascript:deleteAction();"><i class="zmdi zmdi-delete"></i>
            删除记录</a>
    </div>
    <div class="table-responsive">
        <table id="enumTable"></table>
    </div>
</div>

</body>
</html>
<script type="text/javascript">


    var $enumTable = $('#enumTable');


    $(function () {


        $enumTable.bsTable({
            toolbar: '#toolbar',
            editable: true,
            singleSelect: true,
            search: true,
            detailView: false,
            clickToSelect: true,
            pageNumber: 1,
            //初始化加载第一页，默认第一页
            pageSize: 10,
            //每页的记录行数（*）
            pageList: [10, 15, 20],
            //可供选择的每页的行数（*）
            url: '${pageContext.request.contextPath}/vaccine/enum/enumList',
            // 请求后台的URL
            columns: [{
                field: 'state',
                checkbox: true
            },
                {
                    field: 'etype',
                    title: '字典类型',
                    align: 'center',
                    formatter: function(value, row, index) {
                        if (value == "dogBreed") {
                            return '<span class="label label-info">伤人动物</span>';
                        } else if (value == "factory") {
                            return '<span class="label label-info">疫苗厂家</span>';
                        } else if (value == "show") {
                            return '<span class="label label-info">异常反应</span>';
                        } else if (value == "woundNum") {
                            return '<span class="label label-info">伤口数量</span>';
                        } else if (value == "woundSite") {
                            return '<span class="label label-info">伤口部位</span>';
                        } else if (value == "woundTreat") {
                            return '<span class="label label-info">伤口处理</span>';
                        } else if (value == "vaName") {
                            return '<span class="label label-info">疫苗名称</span>';
                        } else if (value == "proteinNo") {
                            return '<span class="label label-info">蛋白批号</span>';
                        } else{
                            return '<span class="label label-info">'+value+'</span>';
                        }
                    }
                },
                {
                    field: 'ecode',
                    title: '字典编码',
                    align: 'center'
                },
                {
                    field: 'ename',
                    title: '字典名称',
                    align: 'center'
                },
                {
                    field: 'useFlag',
                    title: '启用标识',
                    align: 'center',
                    formatter: function(value, row, index) {
                        if (value == "Y") {
                            return '<span class="label label-success">已启用</span>';
                        } else {
                            return '<span class="label label-info">未启用</span>';
                        }
                    }
                }]
        });
    });

    // 新增字典数据
    function createAction() {
        index_Tab.addTab("字典录入", "vaccine/enum/addOrEditPage");
    }

    // 查看字典记录数据
    function updateAction() {
        var rows = $enumTable.bootstrapTable('getSelections');
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
            index_Tab.addTab("字典修改", "vaccine/enum/addOrEditPage?etype=" + rows[0].etype +"&ecode=" + rows[0].ecode);
        }
    }

    // 删除字典数据
    function deleteAction() {
        var rows = $enumTable.bootstrapTable('getSelections');
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
            var etype = rows[0].etype;
            var ecode = rows[0].ecode;
            $.confirm({
                type: 'red',
                animationSpeed: 300,
                title: false,
                content: '确认删除该记录吗？',
                buttons: {
                    confirm: {
                        text: '确认',
                        btnClass: 'waves-effect waves-button',
                        action: function () {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/vaccine/enum/delete",
                                type: "post",
                                data: {
                                    etype: etype,
                                    ecode: ecode
                                },
                                success: function (data) {
                                    $.alert(data.msg);
                                }
                            });
                            $("#table").bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/vaccine/enum/enumList'});
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