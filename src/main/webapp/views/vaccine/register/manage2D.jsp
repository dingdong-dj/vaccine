<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登记列表</title>
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
        <table id="table"></table>
    </div>
</div>

</body>
</html>
<script type="text/javascript">


    var $table = $('#table');


    $(function () {


        $table.bsTable({
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
            url: '${pageContext.request.contextPath}/vaccine/register/list',
            // 请求后台的URL
            columns: [{
                field: 'state',
                checkbox: true
            },
                {
                    field: 'sysno',
                    title: '系统编码',
                    align: 'center',
                    visible: false
                },
                {
                    field: 'bookDt',
                    title: '登记日期',
                    align: 'center'
                },
                {
                    field: 'cardNo',
                    title: '就诊卡号',
                    align: 'center'
                },
                {
                    field: 'cardInno',
                    title: '卡内码',
                    visible:false,
                    align: 'center'
                },
                {
                    field: 'blhNo',
                    title: '院内病历号',
                    align: 'center'
                },
                {
                    field: 'patName',
                    title: '患者姓名',
                    align: 'center'
                },
                {
                    field: 'patSex',
                    title: '患者性别',
                    align: 'center',
                    formatter: function(value, row, index) {
                        if (value == "f") {
                            return '<span class="label label-success">女</span>';
                        } else {
                            return '<span class="label label-info">男</span>';
                        }
                    }
                },
                {
                    field: 'patAge',
                    title: '患者年龄',
                    align: 'center'
                },
                {
                    field: 'patOccu',
                    title: '患者职业',
                    align: 'center'
                },
                {
                    field: 'patAdd',
                    title: '患者地址',
                    align: 'center'
                },
                {
                    field: 'patTel',
                    title: '患者联系电话',
                    align: 'center'
                },
                {
                    field: 'vaCode',
                    title: '接种疫苗种类',
                    align: 'center',
                    formatter: function(value, row, index) {
                        switch (value) {
                            case "hdcv":
                                return '<span class="label label-info">狂犬疫苗</span>';
                                break;
                            case "fy":
                                return '<span class="label label-info">肺炎疫苗</span>';
                                break;
                            case "lg":
                                return '<span class="label label-info">流感疫苗</span>';
                                break;
                            case "yg":
                                return '<span class="label label-info">乙肝疫苗</span>';
                                break;
                            case "hpv":
                                return '<span class="label label-info">宫颈疫苗</span>';
                                break;
                        }
                    }
                },
                {
                    field: 'vaDoc',
                    title: '填报医生',
                    align: 'center'
                },
                {
                    field: 'hospNo',
                    title: '医院代码',
                    visible:false,
                    align: 'center'
                }]
        });
    });

    // 新增登记数据
    function createAction() {
        index_Tab.addTab("患者登记", "vaccine/register/addOrEditPage");
    }

    // 查看登记记录数据
    function updateAction() {
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
            index_Tab.addTab(rows[0].patName + " - 患者登记", "vaccine/register/addOrEditPage?sysno=" + rows[0].sysno);
        }
    }

    // 删除登记数据
    function deleteAction() {
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
            var sysno = rows[0].sysno;
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
                                url: "${pageContext.request.contextPath}/vaccine/register/delete",
                                type: "post",
                                data: {
                                    sysno: sysno
                                },
                                success: function (data) {
                                    if (!data.success) {
                                        $.alert(data.msg);
                                    }
                                }
                            });
                            $("#table").bootstrapTable('refresh', {url: '${pageContext.request.contextPath}/vaccine/register/list'});
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