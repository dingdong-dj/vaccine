<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>犬伤患者</title>
</head>
<style>

    .fixed-table-container {
        height: initial;
    }

</style>
<body>
<div id="main">
    <div id="planTableBar">
    </div>
    <div class="table-responsive">
        <table id="planTable"></table>
    </div>
</div>

</body>
</html>
<script type="text/javascript">


    var $planTable = $('#planTable');
    $(function () {

        var animalEnum;
        //伤人动物列表
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnumS?type=dogBreed&descK=ecode&sortK=asc",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    animalEnum = data.enumList;
                    $planTable.bootstrapTable('refresh')
                }else{
                    $.alert(data.msg)
                }
            }
        });

        var partEnum;
        //伤口部位列表
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=woundSite",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    partEnum = data.enumList;
                    $planTable.bootstrapTable('refresh')
                }else{
                    $.alert(data.msg)
                }
            }
        });

        var dealEnum;
        //伤口处理列表
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=woundTreat",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    dealEnum = data.enumList;
                    $planTable.bootstrapTable('refresh')
                }else{
                    $.alert(data.msg)
                }
            }
        });


        //绘制表格
        $planTable.bsTable({
            toolbar: '#toolbar',
            url: '${pageContext.request.contextPath}/vaccine/statistics/rabiesCodeDList',
            singleSelect: true,
            search: true,
            height: 0,
            idField: 'lineNo',
            clickToSelect: true,
            detailView: false,
            pagination: true,
            //是否开启分页（*）
            pageNumber: 1,
            //初始化加载第一页，默认第一页
            pageSize: 10,
            //每页的记录行数（*）
            pageList: [10, 15, 20],
            //可供选择的每页的行数（*）
            columns: [
                {
                    field: 'sysno',
                    title: '系统编码',
                    align: 'center',
                    visible: false
                },
                {
                    field: 'vaSysno',
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
                    field: 'hdcvDt',
                    title: '被伤日期',
                    align: 'center'
                },
                {
                    field: 'hdcvAdd',
                    title: '被伤地点',
                    align: 'center'
                },
                {
                    field: 'dogType',
                    title: '伤人动物种类',
                    align: 'center',
                    formatter: function(value, row, index) {
                        for(var i = 0; i < animalEnum.length; i++){
                            if(animalEnum[i].ecode == value){
                                return animalEnum[i].ename;
                            }
                        }
                    }
                },
                {
                    field: 'expose',
                    title: '暴露等级',
                    align: 'center'
                },
                {
                    field: 'cutPart',
                    title: '伤口部位',
                    align: 'center',
                    formatter: function(value, row, index) {
                        var partL = value.split(",");
                        var partText = "";
                        for(var i = 0; i < partL.length; i++){
                            for(var j = 0; j < partEnum.length; j++){
                                if(partEnum[j].ecode == partL[i]){
                                    partText += partEnum[j].ename;
                                    partText += " ";
                                }
                            }
                        }
                        return partText;
                    }
                },
                {
                    field: 'cutNo',
                    title: '伤口数目',
                    align: 'center',
                    formatter: function(value, row, index) {
                        if (value == "1") {
                            return '<span class="label label-info">1处</span>';
                        } else if (value == "N") {
                            return '<span class="label label-info">多处</span>';
                        } else {
                            return '<span class="label label-info">未知</span>';
                        }
                    }
                },
                {
                    field: 'cutDeal',
                    title: '伤口处理',
                    align: 'center',
                    formatter: function(value, row, index) {
                        var dealL = value.split(",");
                        var dealText = "";
                        for(var i = 0; i < dealL.length; i++){
                            for(var j = 0; j < dealEnum.length; j++){
                                if(dealEnum[j].ecode == dealL[i]){
                                    dealText += dealEnum[j].ename;
                                    dealText += " ";
                                }
                            }
                        }
                        return dealText;
                    }
                },
                {
                    field: 'manufName',
                    title: '疫苗厂家',
                    align: 'center'

                },
                {
                    field: 'batchNo',
                    title: '疫苗批次',
                    align: 'center'

                },
                {
                    field: 'vaProtein',
                    title: '蛋白',
                    align: 'center',
                    formatter: function(value, row, index) {
                        console.log(row);
                        if(value == ""){
                            return '<span class="label label-danger">拒绝注射</span>';
                        }else if(value == "0"){
                            return '<span class="label label-success">无需注射</span>';
                        }else if(value != "" && value !="0"){
                            return '<span class="label label-info">'+row.vaProteinFac+'</span>';
                        }else{
                            return value;
                        }
                    }

                },
                {
                    field: 'vaProteinNo',
                    title: '蛋白批次',
                    align: 'center'

                }],
            onDblClickRow: function (row) {
                index_Tab.addTab(row.patName + " - 登记记录", "vaccine/register/addOrEditPage2N?sysno=" + row.sysno);
            }
        });
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