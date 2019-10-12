<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>余苗统计</title>
</head>
<body>
<div id="main">
    <div id="toolbar">
        <a style="float: left;margin-left: 10px;font-size: x-large"><i class="zmdi zmdi-balance"></i></a>
        <a id = "residualVaccineNum" style="float: left;margin-left: 10px;font-size: x-large">狂犬余苗总计：</a>
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
            url: '${pageContext.request.contextPath}/vaccine/statistics/residualVaccineList',
            // 请求后台的URL
            columns: [
                {
                    field: 'state',
                    checkbox: true
                },
                {
                    field: 'sysno',
                    title: '编号',
                    align: 'center'
                },
                {
                    field: 'bookDt',
                    title: '登记日期',
                    align: 'center'
                },
                {
                    field: 'patName',
                    title: '患者姓名',
                    align: 'center'
                },
                {
                    field: 'batchNo',
                    title: '疫苗批次',
                    align: 'center'
                },
                {
                    field: 'vaNumber',
                    title: '剩余疫苗数量',
                    align: 'center'
                }]
        });
    });

    //获取狂犬疫苗未注射疫苗统计数量
    $.ajax({
        url: "${pageContext.request.contextPath}/vaccine/statistics/residualVaccineNum",
        async: false,
        type: "post",
        data: {
        },
        success: function (data) {
            if (data.success) {
                rNum = parseInt(data.num);
                $("#residualVaccineNum")[0].textContent = "狂犬余苗总计：" + rNum;
            } else {
                $.alert(data.msg);
            }
        }
    });

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