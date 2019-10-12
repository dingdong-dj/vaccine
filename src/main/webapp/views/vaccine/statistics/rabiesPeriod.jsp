<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>狂犬疫苗开出/使用</title>
</head>
<body>
<div id="main">
    <div id="toolbar">
        <a class="waves-effect btn btn-info btn-primary" style="float: left">起始：</a>
        <div class="input-group date form_date col-md-2" style="float: left">
            <input id="startDate" name="startDate" class="form-control" size="2" type="text"
                   placeholder="请选择日期"> <span
                class="input-group-addon"><span
                class="glyphicon glyphicon-remove"></span></span> <span
                class="input-group-addon"><span
                class="glyphicon glyphicon-calendar"></span></span>
        </div>
        <script type="text/javascript">
            //  日历组件选择
            $('.form_date').datetimepicker({
                language: 'zh-CN',
                format: "yyyy-mm-dd",
                todayBtn: true,
                autoclose: true,
                startView: 2,
                minView: 2
            });
        </script>
        <a class="waves-effect btn btn-info btn-primary"style="float: left;margin-left: 20px">结束：</a>
        <div class="input-group date form_date col-md-2" style="float: left">
            <input id="endDate" name="endDate" class="form-control" size="2" type="text"
                   placeholder="请选择日期"> <span
                class="input-group-addon"><span
                class="glyphicon glyphicon-remove"></span></span> <span
                class="input-group-addon"><span
                class="glyphicon glyphicon-calendar"></span></span>
        </div>
        <script type="text/javascript">
            //  日历组件选择
            $('.form_date').datetimepicker({
                language: 'zh-CN',
                format: "yyyy-mm-dd",
                todayBtn: true,
                autoclose: true,
                startView: 2,
                minView: 2
            });
        </script>
        <a class="waves-effect btn btn-success btn-primary" href="javascript:searchAction();" style="float: left;margin-left: 20px"><i class="zmdi zmdi-edit"></i>&nbsp;&nbsp;统计&nbsp;&nbsp;</a>

        <a style="float: left;margin-left: 20px;font-size: x-large"><i class="zmdi zmdi-account-add"></i></a>
        <a id = "vaAdd" style="float: left;font-size: x-large">开出：</a>
        <a style="float: left;margin-left: 20px;font-size: x-large"><i class="zmdi zmdi-cut"></i></a>
        <a id = "vaUse" style="float: left;font-size: x-large">使用：</a>
        <a style="float: left;margin-left: 20px;font-size: x-large"><i class="zmdi zmdi-balance"></i></a>
        <a id = "vaComputer" style="float: left;font-size: x-large">差额：</a>
    </div>
    <div class="table-responsive">
        <table id="table"></table>
    </div>
</div>

</body>
</html>
<script type="text/javascript">

    //时间组件赋值
    function formatDateTime(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? '0' + m : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        return y + '-' + m + '-' + d;
    };
    var nowDate = new Date();
    var nowDateStr = formatDateTime(nowDate);

    $("#startDate").val(nowDateStr);
    $("#endDate").val(nowDateStr);

    var $table = $('#table');

    $(function () {


        $table.bsTable({
            toolbar: '#toolbar',
            editable: true,
            singleSelect: true,
            search: false,
            detailView: false,
            clickToSelect: true,
            pageNumber: 1,
            //初始化加载第一页，默认第一页
            pageSize: 10,
            //每页的记录行数（*）
            pageList: [10, 15, 20],
            //可供选择的每页的行数（*）
            url: '${pageContext.request.contextPath}/vaccine/statistics/rabiesUsePeriodList',
            // 请求后台的URL
            queryParams: queryParams,
            columns: [{
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
                    title: '注射日期',
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
                    title: '使用疫苗数量',
                    align: 'center'

                }]
        });
    });

    //得到查询的参数
    function queryParams(params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            order: params.order,  //排序
            startDate: $("#startDate").val(),
            endDate:$("#endDate").val(),
            /*pageSize:this.pageSize,
            pageNumber:this.pageNumber,
            projectId: $("#projectId").val(),
            requirement_Id:$("#requirement_Id").val(),
            length: 6*/
        };
        return temp;
    };

    // 统计数据
    function searchAction() {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        if(startDate >endDate){
            $.alert("起始日期大于结束日期，请正确输入日期");
            return;
        }
        $table.bootstrapTable('refresh');
        //数量统计
        calculate(startDate, endDate);

    }
    
    function calculate(startDate, endDate) {
        var addNum = 0;
        var useNum = 0;
        var parNum = 0;

        //获取时间段内开出狂犬疫苗数量
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/statistics/rabiesOutPeriodNum",
            async: false,
            type: "post",
            data: {
                startDate:startDate,
                endDate:endDate
            },
            success: function (data) {
                if (data.success) {
                    addNum = parseInt(data.num);
                    $("#vaAdd")[0].textContent = "开出:" + addNum;
                } else {
                    $.alert(data.msg);
                }
            }
        });

        //获取时间段内使用狂犬疫苗数量
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/statistics/rabiesUsePeriodNum",
            async: false,
            type: "post",
            data: {
                startDate:startDate,
                endDate:endDate
            },
            success: function (data) {
                if (data.success) {
                    useNum = parseInt(data.num);
                    $("#vaUse")[0].textContent = "使用:" + useNum;
                } else {
                    $.alert(data.msg);
                }
            }
        });

        parNum = addNum - useNum;
        $("#vaComputer")[0].textContent = "差额:" + parNum;
    }

    calculate($("#startDate").val(), $("#endDate").val());

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