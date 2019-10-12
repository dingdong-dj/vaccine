<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>数据列表</title>
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

        var showEnum;
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=show",
            async: false,
            type: "post",
            data: {},
            success: function (data) {
                if (data.success) {
                    var list = data.enumList;
                    if (list) {
                        showEnum = list;
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });


        //绘制表格
        $planTable.bsTable({
            toolbar: '#toolbar',
            url: '${pageContext.request.contextPath}/vaccine/plan/list',
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
                    field: 'state',
                    checkbox: true
                },{
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
                },
                {
                    field: 'sysno',
                    title: '系统编码',
                    align: 'center',
                    visible: false
                },
                {
                    field: 'lineNo',
                    title: '行号',
                    align: 'center',
                    visible: false
                },
                {
                    field: 'vaName',
                    title: '疫苗名称',
                    align: 'center'

                },
                {
                    field: 'planDt',
                    title: '计划日期',
                    align: 'center'

                },
                {
                    field: 'execDt',
                    title: '接种日期',
                    align: 'center'
                },
                {
                    field: 'batchNo',
                    title: '疫苗批次',
                    align: 'center'

                },
                {
                    field: "manufNo",
                    title: "生厂厂家",
                    align: 'center',
                    visible: false
                },
                {
                    field: 'manufName',
                    title: '生厂厂家名',
                    align: 'center'
                },
                {
                    field: 'vaHosp',
                    title: '接种医院编号',
                    align: 'center',
                    visible: false

                },
                {
                    field: 'vaHospname',
                    title: '接种医院名称',
                    align: 'center'

                },
                {
                    field: 'vaOper',
                    title: '接种人',
                    align: 'center'

                },
                {
                    field: 'drugBarcode',
                    title: '药品监管码',
                    align: 'center'

                },
                {
                    field: "vaLeft",
                    title: "存苗",
                    align: 'center'
                },
                {
                    field: "statusFlag",
                    title: "状态",
                    align: 'center',
                    formatter: function(value, row, index) {
                        switch (value) {
                            case "init":
                                return '<span class="label label-info">初始</span>';
                                break;
                            case "done":
                                return '<span class="label label-success">完成</span>';
                                break;
                            case "cancel":
                                return '<span class="label label-deny">终止</span>';
                                break;
                        }
                    }
                },
                {
                    field: "feedback",
                    title: "异常反应",
                    align: 'center',
                    formatter: function(value, row, index) {
                        if (value) {
                            for (var i = 0; i < showEnum.length; i++) {
                                if (showEnum[i].ecode == value) {
                                    return '<span class="label label-info">showEnum[i].ename</span>';
                                }
                            }
                        }
                    }
                },
                {
                    field: 'remarks',
                    title: '备注',
                    align: 'center',
                    editable: {
                        type: 'textarea',
                        title: '备注',
                        showbuttons: false
                    }
                },
            ]
        });


    });

</script>