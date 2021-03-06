<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>患者登记</title>
</head>
<style>

    .fixed-table-toolbar {
        display: none;
    }

    .fixed-table-pagination {
        display: none;
    }

    .fixed-table-pagination {
        display: none;
    }

    .fixed-table-container {
        height: initial;
    }

</style>
<body>
<div id="main" style=";background: #fff;left: 15%;">
    <div class="container col-md-12"
         style="margin-top: 30px; margin-left: 50px; display: table;">
        <form id="dataForm" method="post">
            <div class="row" style="margin-top: 10px; margin-bottom: 10px; display: none">
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="sysno" name="sysno"
                               value="${vaBooking.sysno}" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 5px; margin-bottom: 5px;">
                <div class="col-md-2"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">登记日期：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="bookDt" name="bookDt"
                               value="${vaBooking.bookDt}" class="form-control"
                               placeholder="登记日期" readonly/>
                    </div>
                    <%--<div class="input-group date form_date col-md-16">
                        <input id="bookDt" name="bookDt" class="form-control" size="16" type="text"
                               placeholder="请选择日期" readonly> <span
                            class="input-group-addon"><span
                            class="glyphicon glyphicon-remove"></span></span> <span
                            class="input-group-addon"><span
                            class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <script type="text/javascript">
                        //  日历组件选择
                        $(".form_datetime").datetimepicker({
                            language: 'zh-CN',
                            format: "yyyy-mm-dd hh:ii",
                            autoclose: true,
                            todayBtn: true,
                            minuteStep: 10
                        });
                        $('.form_date').datetimepicker({
                            language: 'zh-CN',
                            format: "yyyy-mm-dd",
                            todayBtn: true,
                            autoclose: true,
                            startView: 2,
                            minView: 2
                        });
                    </script>--%>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">就诊卡号：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="cardNo" name="cardNo"
                               value="${vaBooking.cardNo}" class="form-control"
                               placeholder="就诊卡号" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;display: none;">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">卡内码：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="cardInno" name="cardInno"
                               value="${vaBooking.cardInno}" class="form-control"
                               placeholder="卡内码"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">院内病历号：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="blhNo" name="blhNo"
                               value="${vaBooking.blhNo}" class="form-control"
                               placeholder="院内病历号" readonly/>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">患者姓名：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="patName" name="patName"
                               value="${vaBooking.patName}" class="form-control"
                               placeholder="患者姓名" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">患者性别：</label>
                </div>
                <div class="col-md-3">
                    <select id="patSex" name="patSex" class="selectpicker">
                        <option value="m">男</option>
                        <option value="f">女</option>
                    </select>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">患者年龄：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="patAge" name="patAge"
                               value="${vaBooking.patAge}" class="form-control"
                               placeholder="患者年龄" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">患者职业：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="patOccu" name="patOccu"
                               value="${vaBooking.patOccu}" class="form-control"
                               placeholder="患者职业" readonly/>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">患者地址：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="patAdd" name="patAdd"
                               value="${vaBooking.patAdd}" class="form-control"
                               placeholder="患者地址" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">患者联系电话：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="patTel" name="patTel"
                               value="${vaBooking.patTel}" class="form-control"
                               placeholder="患者联系电话" readonly/>
                    </div>
                </div>

                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">填报医生：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="vaDoc" name="vaDoc"
                               value="${vaBooking.vaDoc}" class="form-control"
                               placeholder="填报医生" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">接种疫苗种类：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <%--<input type="text" id="vaCode" name="vaCode"
                               value="${vaBooking.vaCode}" class="form-control"
                               placeholder="接种疫苗种类"/>--%>
                        <select class="selectpicker" name="vaCode" id="vaCode">
                        </select>
                    </div>
                </div>
                <div id="openSecondery" class="col-md-3"
                     style="line-height: 26px; vertical-align: middle;display:none;">
                    <span class="label label-primary" style="font-size: 1.2rem">狂犬病登记附表</span>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                <div class="main-container" id="tryLoad" style="display:none">
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px; display: none">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">医院代码：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="hospNo" name="hospNo"
                               value="${vaBooking.hospNo}" class="form-control"
                               placeholder="医院代码"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="form-group  col-md-11" style="text-align: center">
                    <div style="margin:10px 0px 10px 5px">
                        <label style="margin-top: 5px; font-size: 1.5rem;"></label>
                        <button type="button" class="btn btn-default" style="float:right;margin:0 0 0 0"
                                id="planUpdate">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                    </div>
                    <table id="formTable" class="table"></table>
                </div>
            </div>
        </form>


    </div>
</div>
</body>
<script type="text/javascript">
    var $registerTable = $('#formTable');
    $(function () {


        <c:if test="${vaBooking.sysno == null || vaBooking.sysno == ''}">
        //随机字符串（30位）
        var randomString = Math.random().toString(36).substr(2) + Math.random().toString(36).substr(2) + Math.random().toString(36).substr(2);
        //ID前台生成
        $("#sysno").val(randomString);
        </c:if>

        // 生产厂家数据缓存
        var manufCache;

        //绘制表格
        $registerTable.bsTable({
            toolbar: '#toolbar',
            singleSelect: true,
            search: true,
            height: 0,
            idField: 'lineNo',
            clickToSelect: true,
            detailView: false,
            pagination: false,
            //是否开启分页（*）
            pageNumber: 1,
            //初始化加载第一页，默认第一页
            pageSize: 8,
            //每页的记录行数（*）
            sidePagination: "client",
            //分页方式：client客户端分页，server服务端分页（*）
            columns: [
                {
                    field: 'Number',
                    title: '',
                    //visible:false,
                    formatter: function (value, row, index) {
                        return index + 1;
                    }
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
                    align: 'center',
                    editable: {
                        type: 'select',
                        title: '疫苗名称',
                        mode: 'inline',
                        showbuttons: false,
                        source: function () {
                            var result = [];
                            $.ajax({
                                url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=vaName",
                                async: false,
                                type: "post",
                                data: {},
                                success: function (data) {
                                    if (data.success) {
                                        var list = data.enumList;
                                        if (list) {
                                            $.each(list,
                                                function (key, value) {
                                                    result.push({
                                                        value: value.ecode,
                                                        text: value.ename
                                                    });
                                                });
                                        }
                                    } else {
                                        $.alert(data.msg);
                                    }
                                }
                            });
                            return result;
                        },
                        validate: function (v) {
                            if (!v) {
                                validateCheck = false;
                                return '生产厂家不能为空';
                            }

                        }
                    }
                },
                {
                    field: 'planDt',
                    title: '计划日期',
                    disabled: true,
                    align: 'center'
                },
                {
                    field: 'execDt',
                    title: '接种日期',
                    align: 'center',
                    editable: {
                        type: 'date',
                        title: '接种日期',
                        showbuttons: false,
                        validate: function (v) {
                            if (!v) {
                                validateCheck = false;
                                return '接种日期不能为空';
                            }

                        }
                    }
                },
                {
                    field: 'batchNo',
                    title: '疫苗批次',
                    align: 'center',
                    editable: {
                        type: 'text',
                        clear: false,
                        //onblur:'ignore',
                        onblur: 'submit',
                        showbuttons: false,
                        mode: 'inline',
                        validate: function (v) {
                            if (!v) {
                                validateCheck = false;
                                return '疫苗批次不能为空';
                            }

                        }
                    }
                },
                {
                    field: "manufNo",
                    title: "生产厂家",
                    align: 'center',
                    editable: {
                        type: 'select',
                        title: '生产厂家',
                        mode: 'inline',
                        showbuttons: false,
                        source: function () {
                            var result = [];
                            $.ajax({
                                url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=factory",
                                async: false,
                                type: "post",
                                data: {},
                                success: function (data) {
                                    if (data.success) {
                                        var list = data.enumList;
                                        manufCache = list;
                                        if (list) {
                                            $.each(list,
                                                function (key, value) {
                                                    result.push({
                                                        value: value.ecode,
                                                        text: value.ename
                                                    });
                                                });
                                        }
                                    } else {
                                        $.alert(data.msg);
                                    }
                                }
                            });
                            return result;
                        },
                        validate: function (v) {
                            if (!v) {
                                validateCheck = false;
                                return '生产厂家不能为空';
                            }

                        }
                    }
                },
                {
                    field: 'manufName',
                    title: '生产厂家名称',
                    align: 'center',
                    visible: false,
                    editable: {
                        type: 'text',
                        clear: false,
                        //onblur:'ignore',
                        showbuttons: false,

                        mode: 'inline'
                    }
                },
                {
                    field: 'vaHosp',
                    title: '接种医院编号',
                    align: 'center',
                    visible: false,
                    editable: {
                        type: 'text',
                        clear: false,
                        //onblur:'ignore',
                        showbuttons: false,

                        mode: 'inline'
                    }
                },
                {
                    field: 'vaHospname',
                    title: '接种医院名称',
                    visible: false,
                    align: 'center',
                    editable: {
                        type: 'text',
                        clear: false,
                        //onblur:'ignore',
                        showbuttons: false,

                        mode: 'inline'
                    }
                },
                {
                    field: 'vaOper',
                    title: '接种人',
                    align: 'center',
                    editable: {
                        type: 'text',
                        clear: false,
                        onblur: 'submit',
                        //onblur:'ignore',
                        showbuttons: false,

                        mode: 'inline',
                        validate: function (v) {
                            if (!v) {
                                validateCheck = false;
                                return '接种人不能为空';
                            }

                        }
                    }
                },
                {
                    field: 'drugBarcode',
                    title: '药品监管码',
                    align: 'center',
                    editable: {
                        type: 'text',
                        clear: false,
                        //onblur:'ignore',
                        onblur: 'submit',
                        showbuttons: false,

                        mode: 'inline'
                    }
                },
                {
                    field: "vaLeft",
                    title: "存苗",
                    align: 'center',
                    visible: false
                },
                {
                    field: "statusFlag",
                    title: "状态",
                    align: 'center',
                    editable: {
                        type: 'select',
                        title: '状态',
                        showbuttons: false,

                        mode: 'inline',
                        source: [
                            {
                                value: "init",
                                text: "初始",
                                disabled: true
                            },
                            {
                                value: "done",
                                text: "完成接种"
                            },
                            {
                                value: "cancel",
                                text: "终止接种"
                            }],
                        validate: function (v) {
                            if (!v) {
                                validateCheck = false;
                                return '状态不能为空';
                            }

                        }
                    }
                },
                {
                    field: "feedback",
                    title: "异常反应",
                    align: 'center',
                    editable: {
                        type: 'select',
                        title: '异常反应',
                        showbuttons: false,

                        mode: 'inline',
                        source: function () {
                            var result = [];
                            $.ajax({
                                url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=show",
                                async: false,
                                type: "post",
                                data: {},
                                success: function (data) {
                                    if (data.success) {
                                        var list = data.enumList;
                                        if (list) {
                                            $.each(list,
                                                function (key, value) {
                                                    result.push({
                                                        value: value.ecode,
                                                        text: value.ename
                                                    });
                                                });
                                        }
                                    } else {
                                        $.alert(data.msg);
                                    }
                                }
                            });
                            return result;
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
                        onblur: 'submit',
                        showbuttons: false
                    }
                },
            ],
            onEditableSave: function (field, row, oldValue, $element) {
                if (field == "execDt") {
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    vaOperChange(index);
                    planDtAllChange(row.execDt, row.planDt, index);
                }

                /*if (field == "planDt") {
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    planDtAllChange2N(row.planDt, oldValue, index);
                }*/

                if(field == "batchNo"){
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    /*if(index == 0){
                        batchNoAllChange(row.batchNo);
                    }*/
                    vaOperChange(index);
                }

                if (field == "manufNo") {
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    if (index == 0) {
                        manufNoAllChange(row.manufNo);
                    } else {
                        manufNoChange(row.manufNo, index);
                    }
                    vaOperChange(index);
                }

                if (field == "vaName") {
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    if (index == 0) {
                        vaNameAllChange(row.vaName);
                    }
                }
            }
        });

        //表格列联动（载入接种人，更改状态值）
        function vaOperChange(index) {
            $registerTable.bootstrapTable('updateCell', {
                index: index,
                field: 'vaOper',
                value: '${sysUser.userName}'
            });

            $registerTable.bootstrapTable('updateCell', {
                index: index,
                field: 'statusFlag',
                value: 'done'
            });
        }

        //更改计划日期自动计算
        function planDtAllChange(nVal, oVal, index) {
            var nowData = $registerTable.bootstrapTable('getData');
            //防止修改的是最后一条数据
            if (nowData.length <= index + 1) {
                return;
            }
            //如果下一行执行日期小于下一行计划日期，则不进行计算
            if (typeof (nowData[index + 1]) != "undefined" && nowData[index + 1].execDt != "" && nowData[index + 1].planDt > nowData[index + 1].execDt) {
                return;
            }
            var days = calcuDateDiff(nVal, oVal);
            for (var i = index; i < nowData.length; i++) {
                if (typeof (nowData[i + 1]) != "undefined") {
                    //一天两针，自动更改执行日期,并跳过下一行的日期计算
                    if (nowData[i + 1].planDt == nowData[i].planDt) {
                        nowData[i + 1].execDt = nVal;
                    } else {
                        var oDate = convertDateFromString(nowData[i + 1].planDt);
                        var newDateStr = formatDateTime(new Date(oDate.setDate(oDate.getDate() + days)));
                        nowData[i + 1].planDt = newDateStr;
                    }
                }
            }
            $registerTable.bootstrapTable('load', nowData);
        }

        //更改计划日期自动计算
        function planDtAllChange2N(nVal, oVal, index) {
            var nowData = $registerTable.bootstrapTable('getData');
            //防止修改的是最后一条数据
            if (nowData.length <= index + 1) {
                return;
            }
            //如果下一行计划日期小于本行计划日期，则不进行计算
            if (typeof (nowData[index+1]) != "undefined" && nowData[index+1].planDt < oVal ){
                return;
            }
            var days = calcuDateDiff(nVal, oVal);
            for (var i = index + 1; i < nowData.length; i++) {
                var oDate = convertDateFromString(nowData[i].planDt);
                var newDateStr = formatDateTime(new Date(oDate.setDate(oDate.getDate() + days)));
                nowData[i].planDt = newDateStr;
            }
            $registerTable.bootstrapTable('load', nowData);
        }

        //字符串转日期
        function convertDateFromString(dateString) {
            if (dateString) {
                var date = new Date(dateString.replace(/-/, "/"))
                return date;
            }
        }

        //计算相差天数
        function calcuDateDiff(nVal, oVal) {
            var nDate = convertDateFromString(nVal);
            var oDate = convertDateFromString(oVal);
            var times = nDate.getTime() - oDate.getTime();
            var days = parseInt(times / (1000 * 60 * 60 * 24));
            return days;
            s
        }

        //date转String
        function formatDateTime(date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? '0' + m : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            return y + '-' + m + '-' + d;
        };

        //更改所有疫苗名称
        function vaNameAllChange(nVaName) {
            var nowData = $registerTable.bootstrapTable('getData');
            for (var i = 0; i < nowData.length; i++) {
                nowData[i].vaName = nVaName;
            }
            $registerTable.bootstrapTable('load', nowData);
        }

        //更改所有批次号
        function batchNoAllChange(nbatchNo) {
            var nowData = $registerTable.bootstrapTable('getData');
            for (var i = 0; i < nowData.length; i++) {
                nowData[i].batchNo = nbatchNo;
            }
            $registerTable.bootstrapTable('load', nowData);
        }

        //更改所有厂家编号(同时更改厂家名称)
        function manufNoAllChange(nManufNo) {
            var nowData = $registerTable.bootstrapTable('getData');
            //获取厂家名称
            var nManufName;
            for (var i = 0; i < manufCache.length; i++) {
                if (manufCache[i].ecode == nManufNo) {
                    nManufName = manufCache[i].ename;
                }
            }
            //刷新数据
            for (var i = 0; i < nowData.length; i++) {
                nowData[i].manufNo = nManufNo;
                nowData[i].manufName = nManufName;
            }
            $registerTable.bootstrapTable('load', nowData);
        }

        //表格列联动（与生产厂家编号关联）
        function manufNoChange(value, index) {
            var manufNameChange;
            for (var i = 0; i < manufCache.length; i++) {
                if (manufCache[i].ecode == value) {
                    manufNameChange = manufCache[i].ename;
                }
            }
            $registerTable.bootstrapTable('updateCell', {
                index: index,
                field: 'manufName',
                value: manufNameChange
            });
        }


        <c:if test="${vaBooking.vaCode == 'hdcv'}">
        loadSecondary();
        </c:if>

        // 性别下拉框赋值
        $('#patSex').selectpicker('val', '${vaBooking.patSex}');

        //接种计划表单验证通过标志
        var validateCheck = true;


        //施治记录更新
        $('#planUpdate').click(function () {
            var jsonPlanList = $registerTable.bootstrapTable('getData');
            var jsonPlanListData = JSON.stringify(jsonPlanList);
            var checkmsg = "请填报关键项数据：";
            //接种计划表单验证
            for (var i = 0; i < jsonPlanList.length; i++) {
                //只对更改过接种日期的数据进行验证
                if (jsonPlanList[i].execDt != '') {
                    if (jsonPlanList[i].vaName == '') {
                        validateCheck = false;
                        checkmsg += "疫苗名称、";
                    }
                    if (jsonPlanList[i].manufNo == '') {
                        validateCheck = false;
                        checkmsg += "生产厂家、";
                    }
                    if (jsonPlanList[i].batchNo == '') {
                        validateCheck = false;
                        checkmsg += "疫苗批次、";
                    }
                    if (jsonPlanList[i].vaOper == '') {
                        validateCheck = false;
                        checkmsg += "接种人、";
                    }
                    if (jsonPlanList[i].statusFlag == '') {
                        validateCheck = false;
                        checkmsg += "接种状态";
                    }
                }
                if (!validateCheck) {
                    $.alert(checkmsg);
                    validateCheck = true;
                    return;
                }
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/vaccine/register/updateplan",
                type: "post",
                data: {
                    planData: jsonPlanListData,
                },
                success: function (data) {
                    if (!data.success) {
                        $.alert(data.msg);
                    } else {
                        $.alert(data.msg);
                    }
                }
            });
        })


        //如果有接种计划则载入，如无则载入预设值
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/registerConfirm",
            type: "post",
            data: {
                sysno: $("#sysno").val()
            },
            success: function (data) {
                if (!data.success) {
                    $.alert(data.msg);

                } else {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/vaccine/plan/getSpecial",
                        type: "post",
                        data: {
                            sysno: $("#sysno").val()
                        },
                        success: function (data) {
                            if (!data.success) {
                                $.alert("该患者免疫接种计划获取失败，请检查");
                            } else {
                                $registerTable.bootstrapTable('load', data.planList);

                            }
                        }
                    });
                }
            }
        });


        //网页打开时疫苗列表选项动态加载
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getVaCode",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    $("#vaCode").find("option").remove();
                    var list = data.vaCodeTypeList;
                    if (list) {
                        for (var i = 0; i < list.length; i++) {
                            var optionString = "";
                            optionString = "<option value=\""
                                + list[i].vaCode + "\">"
                                + list[i].vaName + "</option>";
                            $("#vaCode").append(optionString);

                        }
                        $("#vaCode").selectpicker('refresh');
                        //疫苗下拉框赋值
                        $("#vaCode").selectpicker('val', '${vaBooking.vaCode}');
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });


        //打开次级登记页面
        /*$("#openSecondery").click(function () {
            $.ajax({
                url: "\${pageContext.request.contextPath}/vaccine/register/registerConfirm",
                type: "post",
                data: {
                    sysno: $("#sysno").val()
                },
                success: function (data) {
                    if (!data.success) {
                        $.alert(data.msg);
                    } else {
                        index_Tab.addTab($("#patName").val() + " - 狂犬病登记记录", "vaccine/register/secondaryAddOrEditPage2N?sysno=" + $("#sysno").val());
                    }
                }
            });

        });*/


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

        //加载后回调
        function getCallback(data, show) {
            $("#tryLoad").html(data);
            show();
        }

        //显示附表
        function secondaryShow() {
            $("#tryLoad").show("normal", "swing");
            $("#openSecondery").show("normal", "swing");
        }

        //隐藏附表
        function secondaryhide() {
            $("#tryLoad").hide("normal", "swing");
            $("#openSecondery").hide("normal", "swing");
        }

        //加载附表数据并显示
        function loadSecondary() {
            $.get('${pageContext.request.contextPath}/vaccine/register/secondaryAddOrEditPage2N?sysno=' + $("#sysno").val(), function (data) {
                getCallback(data, secondaryShow);
            });
        }

    });


    //选择器重绘
    $(".selectpicker").selectpicker({
        width: 'auto'
    });

    //选择器禁用
    $('.selectpicker').prop('disabled', true);

</script>
</html>