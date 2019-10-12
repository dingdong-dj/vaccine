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
                    <div class="input-group date form_date col-md-16">
                        <input id="bookDt" name="bookDt" class="form-control" size="16" type="text"
                               placeholder="请选择日期" readonly> <span
                            class="input-group-addon"><span
                            class="glyphicon glyphicon-remove"></span></span> <span
                            class="input-group-addon"><span
                            class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <script type="text/javascript">
                        //  日历组件选择
                        $(".form_date").datetimepicker({
                            language: 'zh-CN',
                            format: "yyyy-mm-dd hh:ii",
                            autoclose: true,
                            todayBtn: true,
                            minuteStep: 5
                        });
                        /*$('.form_date').datetimepicker({
                            language: 'zh-CN',
                            format: "yyyy-mm-dd",
                            todayBtn: true,
                            autoclose: true,
                            startView: 2,
                            minView: 2
                        });*/
                    </script>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">就诊卡号：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="cardNo" name="cardNo"
                               value="${vaBooking.cardNo}" class="form-control"
                               placeholder="就诊卡号"/>
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
                               placeholder="院内病历号"/>
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
                               placeholder="患者姓名"/>
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
                               placeholder="患者年龄"/>
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
                               placeholder="患者职业"/>
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
                               placeholder="患者地址"/>
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
                               placeholder="患者联系电话"/>
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
                               placeholder="填报医生"/>
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
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                <div class="main-container" id="tryLoad" style="display:none">
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div id="openSecondary" class="col-md-6"
                     style="line-height: 26px; vertical-align: middle;display:none;">
                    <div class="col-md-3 text-left"
                         style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                        <label style="margin-top: 5px; font-size: 14px; color: grey;">种法：</label>
                    </div>
                    <%--<span class="label label-primary" style="font-size: 1.2rem">狂犬病登记附表</span>--%>
                    <div class="col-md-3">
                        <select id="contacts" name="contacts" class="selectpicker">
                            <option value="2">2针法</option>
                            <option value="3">3针法</option>
                            <option value="3.1">预防3针法（0 7 21）</option>
                            <option value="3.2">预防3针法（0 7 28）</option>
                            <option value="4" selected>4针法</option>
                            <option value="5">5针法</option>
                            <option value="6">6针法</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div id="openCervixSecondary" class="col-md-6"
                     style="line-height: 26px; vertical-align: middle;display:none;">
                    <div class="col-md-3 text-left"
                         style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                        <label style="margin-top: 5px; font-size: 14px; color: grey;">种法：</label>
                    </div>
                    <%--<span class="label label-primary" style="font-size: 1.2rem">狂犬病登记附表</span>--%>
                    <div class="col-md-3">
                        <select id="contactsCervix" name="contactsCervix" class="selectpicker">
                            <option value="2">双价</option>
                            <option value="4">四价</option>
                        </select>
                    </div>
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
                        <label style="margin-top: 5px; font-size: 1.5rem;">接种计划</label>
                        <button type="button" class="btn btn-default" style="float:right;margin:0 0 0 0"
                                id="tableRemoveData">
                            <span class="glyphicon glyphicon-remove"></span>
                        </button>
                        <button type="button" class="btn btn-default" style="float:right;margin:0 0 0 0"
                                id="tableAddData">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                    </div>
                    <table id="formTable" class="table"></table>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="form-group  col-md-11" style="text-align: center">
                    <div class="form-group" style="text-align: center">
                        <button class="btn btn-success btn-lg" type="button" id="registerFormSubmit">提交</button>
                    </div>
                    <div class="form-group" style="text-align: center;display: none" id="registerFPD">
                        <button class="btn btn-info btn-lg" type="button" id="registerFormPrint">狂犬病预防处理记录打印预览</button>
                    </div>
                </div>
            </div>
        </form>


    </div>
</div>
</body>
<script type="text/javascript">
    var $registerTable = $('#formTable');
    $(function () {

        //随机数
        function rand(min, max) {
            return Math.floor(Math.random() * (max - min)) + min;
        }


        <c:if test="${vaBooking.sysno == null || vaBooking.sysno == ''}">
        //随机字符串（30位）
        var randomString = rand(100000000, 999999999);
        //ID前台生成
        $("#sysno").val(randomString);
        </c:if>

        <c:if test="${vaBooking.vaDoc == null || vaBooking.vaDoc == ''}">
        //填报人默认为当前用户
        $("#vaDoc").val("${sysUser.userName}");
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
                /*{field: 'state', checkbox: true},*/
                {
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
                        showbuttons: false,
                        mode: 'inline',
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
                        }

                    }
                },
                {
                    field: 'planDt',
                    title: '计划日期',
                    align: 'center',
                    editable: {
                        type: 'date',
                        title: '计划日期',
                        showbuttons: false,
                        validate: function (v) {
                            if (!v) return '计划日期不能为空';

                        }
                    }
                },
                {
                    field: 'execDt',
                    title: '接种日期',
                    align: 'center',
                    editable: {
                        type: 'date',
                        disabled: true,
                        title: '接种日期'
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
                        showbuttons: false,
                        disabled: true,

                        mode: 'inline'
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
                        }
                    }
                },
                {
                    field: 'manufName',
                    title: '生产厂家名称',
                    visible: false,
                    align: 'center',
                    editable: {
                        type: 'text',
                        clear: false,
                        //onblur:'ignore',
                        disabled: true,
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
                        disabled: true,
                        showbuttons: false,

                        mode: 'inline'
                    }
                },
                {
                    field: 'vaHospname',
                    title: '接种医院名称',
                    align: 'center',
                    visible: false,
                    editable: {
                        type: 'text',
                        clear: false,
                        //onblur:'ignore',
                        disabled: true,
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
                        //onblur:'ignore',
                        disabled: true,
                        showbuttons: false,

                        mode: 'inline'
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
                        disabled: true,
                        showbuttons: false,

                        mode: 'inline'
                    }
                },
                {
                    field: "vaLeft",
                    title: "存苗",
                    align: 'center',
                    editable: {
                        type: 'text',
                        clear: false,
                        onblur: 'submit',
                        showbuttons: false,

                        mode: 'inline'
                    }
                },
                {
                    field: "statusFlag",
                    title: "状态",
                    align: 'center',
                    editable: {
                        type: 'select',
                        title: '状态',
                        disabled: true,
                        source: [{
                            value: "init",
                            text: "初始"
                        },
                            {
                                value: "done",
                                text: "完成接种"
                            },
                            {
                                value: "cancel",
                                text: "终止接种"
                            }]
                    }
                },
                {
                    field: "feedback",
                    title: "异常反应",
                    align: 'center',
                    editable: {
                        type: 'select',
                        title: '异常反应',
                        mode: 'inline',
                        disabled: true,
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

                /*if(field == "batchNo"){
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    if(index == 0){
                        batchNoAllChange(row.batchNo);
                    }
                }*/

                if (field == "planDt") {
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    planDtAllChange(row.planDt, oldValue, index);
                }

                if (field == "manufNo") {
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    if (index == 0) {
                        manufNoAllChange(row.manufNo);
                    } else {
                        manufNoChange(row.manufNo, index);
                    }
                }

                if (field == "vaName") {
                    var index = parseInt($element.parent().parent()[0].rowIndex) - 1;
                    if (index == 0) {
                        vaNameAllChange(row.vaName);
                    }
                }
            }
        });

        <c:if test="${vaBooking.vaCode == 'hdcv'}">
        loadSecondary();
        </c:if>

        <c:if test="${vaBooking.vaCode == 'hpv'}">
        secondaryCervixShow();
        </c:if>


        //更改所有疫苗名称
        function vaNameAllChange(nVaName) {
            var nowData = $registerTable.bootstrapTable('getData');
            for (var i = 0; i < nowData.length; i++) {
                nowData[i].vaName = nVaName;
            }
            $registerTable.bootstrapTable('load', nowData);
        }

        //更改计划日期自动计算
        function planDtAllChange(nVal, oVal, index) {
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
            return days;s
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

        // 性别下拉框赋值
        $('#patSex').selectpicker('val', '${vaBooking.patSex}');

        //时间组件赋值
        function formatDateTime(date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? '0' + m : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            return y + '-' + m + '-' + d;
        };

        //时间精确到分
        function formatDateTime2(date) {
            var hours = date.getHours();
            hours = hours < 10 ? '0' + hours : hours;
            var minutes = date.getMinutes();
            minutes = minutes < 10 ? '0' + minutes : minutes;
            return ' ' + hours + ':' + minutes;
        };

        var nowDate = new Date();
        var nowDateStr = formatDateTime(nowDate);
        var nowDateHM = formatDateTime2(nowDate)
        $("#bookDt").val('${vaBooking.bookDt}');
        <c:if test="${vaBooking.bookDt == null || vaBooking.bookDt == ''}">
        var longTime = nowDateStr + nowDateHM;
        $("#bookDt").val(longTime);
        </c:if>


        //接种计划预设值
        var planModel = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '',
                "manufName": '',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '',
                "manufName": '',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '',
                "manufName": '',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStr21 = nowDateStr;
        var nowDateStr22 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 3)));


        //接种计划(狂犬病2针)预设值
        var planModel2 = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '0001',
                "planDt": nowDateStr21,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '0001',
                "planDt": nowDateStr22,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStr31 = nowDateStr;
        var nowDateStr32 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 3)));
        var nowDateStr33 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 7)));


        //接种计划(狂犬病2针)预设值
        var planModel3 = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '0001',
                "planDt": nowDateStr31,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '0001',
                "planDt": nowDateStr32,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '0001',
                "planDt": nowDateStr33,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStr311 = nowDateStr;
        var nowDateStr312 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 7)));
        var nowDateStr313 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 21)));


        //接种计划(狂犬病2针)预设值
        var planModel31 = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '0001',
                "planDt": nowDateStr311,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '0001',
                "planDt": nowDateStr312,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '0001',
                "planDt": nowDateStr313,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStr321 = nowDateStr;
        var nowDateStr322 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 7)));
        var nowDateStr323 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 28)));


        //接种计划(狂犬病2针)预设值
        var planModel32 = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '0001',
                "planDt": nowDateStr321,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '0001',
                "planDt": nowDateStr322,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '0001',
                "planDt": nowDateStr323,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStr42 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 7)));
        var nowDateStr43 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 21)));


        //接种计划(狂犬病四针)预设值
        var planModel4 = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '0001',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '0001',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '0001',
                "planDt": nowDateStr42,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 4,
                "vaName": '0001',
                "planDt": nowDateStr43,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStr52 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 3)));
        var nowDateStr53 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 7)));
        var nowDateStr54 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 14)));
        var nowDateStr55 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 28)));

        //接种计划（狂犬病5针）预设值
        var planModel5 = [
            {
                "sysno": $("#sysno").val(),

                "lineNo": 1,
                "vaName": '0002',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0002',
                "manufName": '成都康华',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '0002',
                "planDt": nowDateStr52,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0002',
                "manufName": '成都康华',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '0002',
                "planDt": nowDateStr53,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0002',
                "manufName": '成都康华',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 4,
                "vaName": '0002',
                "planDt": nowDateStr54,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0002',
                "manufName": '成都康华',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 5,
                "vaName": '0002',
                "planDt": nowDateStr55,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0002',
                "manufName": '成都康华',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStr62 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 3)));
        var nowDateStr63 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 7)));
        var nowDateStr64 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 14)));
        var nowDateStr65 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 28)));

        //接种计划（狂犬病6针）预设值
        var planModel6 = [
            {
                "sysno": $("#sysno").val(),

                "lineNo": 1,
                "vaName": '0001',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            },
            {
                "sysno": $("#sysno").val(),

                "lineNo": 2,
                "vaName": '0001',
                "planDt": nowDateStr,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '0001',
                "planDt": nowDateStr62,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 4,
                "vaName": '0001',
                "planDt": nowDateStr63,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 5,
                "vaName": '0001',
                "planDt": nowDateStr64,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 6,
                "vaName": '0001',
                "planDt": nowDateStr65,
                "execDt": '',
                "batchNo": '',
                "manufNo": '0001',
                "manufName": '辽宁成大',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStrfy1 = nowDateStr;

        //接种计划(肺炎1针)预设值
        var planModelfy = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": 'uaeb6grv31',
                "planDt": nowDateStrfy1,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'cnwcpw82u8h',
                "manufName": '美国默沙东',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStrlg1 = nowDateStr;

        //接种计划(流感1针)预设值
        var planModellg = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '69xdq3vgb0p',
                "planDt": nowDateStrlg1,
                "execDt": '',
                "batchNo": '',
                "manufNo": '89m4sqwlcf',
                "manufName": '深圳赛诺菲巴斯',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStryg1 = nowDateStr;
        var nowDateStryg2 = formatDateTime(new Date(new Date().setDate(new Date().getMonth() + 1)));
        var nowDateStryg3 = formatDateTime(new Date(new Date().setDate(new Date().getMonth() + 6)));

        //接种计划(乙肝3针)预设值
        var planModelyg = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '7uatmumqpeo',
                "planDt": nowDateStrlg1,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'tt7rs5kewwd',
                "manufName": '深圳康泰生物',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '7uatmumqpeo',
                "planDt": nowDateStryg2,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'tt7rs5kewwd',
                "manufName": '深圳康泰生物',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '7uatmumqpeo',
                "planDt": nowDateStryg3,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'tt7rs5kewwd',
                "manufName": '深圳康泰生物',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]

        var nowDateStrC21 = nowDateStr;
        var nowDateStrC22 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 30)));
        var nowDateStrC23 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 180)));


        //接种计划(宫颈疫苗双价)预设值
        var planModelC2 = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": 'aqkdoc6trgi',
                "planDt": nowDateStrC21,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'h44bt1pgw8',
                "manufName": '葛兰素史克',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": 'aqkdoc6trgi',
                "planDt": nowDateStrC22,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'h44bt1pgw8',
                "manufName": '葛兰素史克',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": 'aqkdoc6trgi',
                "planDt": nowDateStrC23,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'h44bt1pgw8',
                "manufName": '葛兰素史克',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]
        var nowDateStrC41 = nowDateStr;
        var nowDateStrC42 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 60)));
        var nowDateStrC43 = formatDateTime(new Date(new Date().setDate(new Date().getDate() + 180)));


        //接种计划(宫颈疫苗双价)预设值
        var planModelC4 = [
            {
                "sysno": $("#sysno").val(),
                "lineNo": 1,
                "vaName": '9t55souwxrq',
                "planDt": nowDateStrC41,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'amywkx2izo7',
                "manufName": '默沙东',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 2,
                "vaName": '9t55souwxrq',
                "planDt": nowDateStrC42,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'amywkx2izo7',
                "manufName": '默沙东',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }, {
                "sysno": $("#sysno").val(),
                "lineNo": 3,
                "vaName": '9t55souwxrq',
                "planDt": nowDateStrC43,
                "execDt": '',
                "batchNo": '',
                "manufNo": 'amywkx2izo7',
                "manufName": '默沙东',
                "vaHosp": '001',
                "vaHospname": '绍兴文理学院附属医院',
                "vaOper": '',
                "drugBarcode": '',
                "vaLeft": '',
                "statusFlag": 'init',
                "feedback": '',
                "remarks": '',
            }
        ]


        //狂犬疫苗注射法更改事件
        $("#contacts").change(function () {
            var contacts = document.getElementById("contacts").value;
            switch (contacts) {
                case "2":
                    var dataJson = JSON.parse(JSON.stringify(planModel2));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "3":
                    var dataJson = JSON.parse(JSON.stringify(planModel3));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "3.1":
                    var dataJson = JSON.parse(JSON.stringify(planModel31));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "3.2":
                    var dataJson = JSON.parse(JSON.stringify(planModel32));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "4":
                    var dataJson = JSON.parse(JSON.stringify(planModel4));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "5":
                    var dataJson = JSON.parse(JSON.stringify(planModel5));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "6":
                    var dataJson = JSON.parse(JSON.stringify(planModel6));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                default:
                    break;
            }
        });

        //宫颈疫苗注射法更改事件
        $("#contactsCervix").change(function () {
            var contacts = document.getElementById("contactsCervix").value;
            switch (contacts) {
                case "2":
                    var dataJson = JSON.parse(JSON.stringify(planModelC2));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "4":
                    var dataJson = JSON.parse(JSON.stringify(planModelC4));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                default:
                    break;
            }
        });

        //通过FastTime计算年龄
        function timestampToAges(timestamp) {
            var birDate = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            var nowDate = new Date();
            var bir = birDate.getFullYear();
            var now = nowDate.getFullYear();
            var age = now - bir;
            return age
        }

        //卡号输入框载入病人信息
        $("#cardNo").change(function () {
            //向三方接口发起请求
            $.ajax({
                url: "http://192.168.1.150:8080/WeChatWebApp/exInterface/searchByNo",
                async: true,
                data: {
                    CardNo: $("#cardNo").val()
                },
                success: function (data) {
                    var paint = data.paint;
                    if (data.success) {
                        $("#cardInno")[0].value = paint.cardInno;
                        $("#blhNo")[0].value = paint.blhNo;
                        $("#patName")[0].value = paint.patName;
                        // 性别下拉框赋值
                        if (paint.patSex == "m") {
                            $('#patSex').selectpicker('val', 'm');
                        } else if (paint.patSex == "f") {
                            $('#patSex').selectpicker('val', 'f');
                        }
                        ;
                        $("#patAge")[0].value = timestampToAges(paint.patAge);
                        $("#patOccu")[0].value = paint.patOccu;
                        $("#patAdd")[0].value = paint.patAdd;
                        $("#patTel")[0].value = paint.patTel;
                    } else {
                        $.confirm({
                            title: false,
                            content: data.msg,
                            autoClose: 'cancel|1000',
                            backgroundDismiss: true,
                            buttons: {
                                cancel: {
                                    text: '取消',
                                    btnClass: 'waves-effect waves-button'
                                }
                            }
                        });
                        //清空数据
                        $("#cardInno")[0].value = "";
                        $("#blhNo")[0].value = "";
                        $("#patName")[0].value = "";
                        // 性别下拉框赋值
                        $('#patSex').selectpicker('val', 'm');
                        $("#patAge")[0].value = "";
                        $("#patOccu")[0].value = "";
                        $("#patAdd")[0].value = "";
                        $("#patTel")[0].value = "";
                    }
                }
            });
        });


        //表格添加数据
        $('#tableAddData').click(function () {
            var nowData = $registerTable.bootstrapTable('getData');
            var addLineNo = 1;
            if (0 < nowData.length) {
                addLineNo = parseInt(nowData[nowData.length - 1].lineNo) + 1 || 1;
            }
            var data = {
                sysno: $("#sysno").val(),
                lineNo: addLineNo,
                vaName: '',
                planDt: nowDateStr,
                execDt: '',
                batchNo: '',
                manufNo: '',
                manufName: '',
                vaHosp: '001',
                vaHospname: '华卫医院',
                vaOper: '',
                drugBarcode: '',
                vaLeft: '',
                statusFlag: 'init',
                feedback: '',
                remarks: '',
            };
            $registerTable.bootstrapTable('append', data);
        });

        //表格移除数据
        $('#tableRemoveData').click(function () {
            var rows = $registerTable.bootstrapTable('getSelections');
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
                $.confirm({
                    type: 'red',
                    animationSpeed: 300,
                    title: false,
                    content: '确认删除数据吗？',
                    buttons: {
                        confirm: {
                            text: '确认',
                            btnClass: 'waves-effect waves-button',
                            action: function () {
                                for (var i = 0; i < rows.length; i++) {
                                    $registerTable.bootstrapTable('remove', {
                                        field: 'lineNo',
                                        values: [rows[i].lineNo]
                                    });
                                }
                            }
                        },
                        cancel: {
                            text: '取消',
                            btnClass: 'waves-effect waves-button'
                        }
                    }
                });
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
                        //默认狂犬疫苗
                        if ($("#vaCode").val() == null) {
                            $("#vaCode").selectpicker('val', 'hdcv');
                            loadSecondary();
                        }

                        if ($("#vaCode").val() == "hpv") {
                            secondaryCervixShow();
                        }
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });

        //如果有接种计划则载入，如无则载入预设值
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/registerConfirm",
            type: "post",
            data: {
                sysno: $("#sysno").val()
            },
            success: function (data) {
                if (!data.success) {
                    //默认载入狂犬疫苗4针法
                    var dataJson = JSON.parse(JSON.stringify(planModel4));
                    $registerTable.bootstrapTable('load', dataJson);

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
                                $registerTable.bootstrapTable({height: $(window).height() * 0.3});

                            }
                        }
                    });
                }
            }
        });

        //必填项检查
        function formCheck() {
            if ($("#cardNo").val() == "") {
                $.alert("就诊卡号不能为空");
                return false;
            }

            if ($("#blhNo").val() == "") {
                $.alert("病历号不能为空");
                return false;
            }

            if ($("#patName").val() == "") {
                $.alert("病人姓名不能为空");
                return false;
            }

            if ($("#patTel").val() == "") {
                $.alert("联系电话不能为空");
                return false;
            }

            if ($("#vaCode").val() == null) {
                $.alert("请选择接种疫苗种类");
                return false;
            }

            return true;
        }


        function createOrUpdate() {
            if (!formCheck()) {
                return;
            }
            var vaType = document.getElementById("vaCode").value;
            //删除狂犬疫苗相关记录
            if ("hdcv" != vaType) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/vaccine/register/secondaryDelete",
                    type: "post",
                    data: {
                        sysno: $("#sysno").val()
                    },
                    success: function (data) {
                        if (!data.success) {
                            $.alert(data.msg);
                        }
                    }
                });
            }

            var jsonPlanList = JSON.stringify($registerTable.bootstrapTable('getData'));
            $.ajax({
                url: "${pageContext.request.contextPath}/vaccine/register/createOrUpdate",
                type: "post",
                data: {
                    sysno: $("#sysno").val(),
                    bookDt: $("#bookDt").val(),
                    cardNo: $("#cardNo").val(),
                    cardInno: $("#cardInno").val(),
                    blhNo: $("#blhNo").val(),
                    patName: $("#patName").val(),
                    patSex: $("#patSex").val(),
                    patAge: $("#patAge").val(),
                    patOccu: $("#patOccu").val(),
                    patAdd: $("#patAdd").val(),
                    patTel: $("#patTel").val(),
                    vaCode: $("#vaCode").val(),
                    vaDoc: $("#vaDoc").val(),
                    hospNo: $("#hospNo").val(),
                    planData: jsonPlanList,
                },
                success: function (data) {
                    if (!data.success) {
                        $.alert(data.msg);
                    } else {
                        $.alert(data.msg);
                        var vaType = document.getElementById("vaCode").value;
                        if ("hdcv" == vaType) {
                            $('#secondaryFormSubmit').trigger("click");
                        }
                    }
                }
            });
        }


        //附表填报提示
        function secondaryCheck() {
            if ($("#openSecondary").css("display") != "none") {
                $.confirm({
                    title: false,
                    content: '注意附表是否填写及提交',
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
            }
        }

        //防止数据重复创建
        $("#registerFormSubmit").click(function () {
            createOrUpdate();
        });

        //打印处理函数
        $("#registerFormPrint").click(function () {
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
                        index_Tab.addTab("狂犬病预防处理记录打印预览", "vaccine/register/printVaVpHdForm?sysno=" + $("#sysno").val());
                    }
                }
            });

        });


        //疫苗种类更改事件
        $("#vaCode").change(function () {
            var vaType = document.getElementById("vaCode").value;
            switch (vaType) {
                case "hdcv":
                    loadSecondary();
                    var dataJson = JSON.parse(JSON.stringify(planModel5));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "fy":
                    var dataJson = JSON.parse(JSON.stringify(planModelfy));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "lg":
                    var dataJson = JSON.parse(JSON.stringify(planModellg));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "yg":
                    var dataJson = JSON.parse(JSON.stringify(planModelyg));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                case "hpv":
                    secondaryCervixShow();
                    var dataJson = JSON.parse(JSON.stringify(planModelC2));
                    $registerTable.bootstrapTable('load', dataJson);
                    break;
                default:
                    break;
            }

            if ("hdcv" != vaType) {
                secondaryhide();//隐藏狂犬疫次级表单div
            }

            if ("hpv" != vaType) {
                secondaryCervixhide();//隐藏宫颈疫苗种法选项
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

        //加载后回调
        function getCallback(data, show) {
            $("#tryLoad").html(data);
            show();
        }

        //显示附表(狂犬)
        function secondaryShow() {
            $("#tryLoad").show("normal", "swing");
            $("#openSecondary").show("normal", "swing");
            $("#registerFPD").show("normal", "swing");
        }

        //显示选项（宫颈）
        function secondaryCervixShow() {
            $("#openCervixSecondary").show("normal", "swing");
        }

        //隐藏附表(狂犬)
        function secondaryhide() {
            $("#tryLoad").hide("normal", "swing");
            $("#openSecondary").hide("normal", "swing");
            $("#registerFPD").hide("normal", "swing");
        }

        function secondaryCervixhide() {
            $("#openCervixSecondary").hide("normal", "swing");
        }

        //加载附表(狂犬)数据并显示
        function loadSecondary() {
            $.get('${pageContext.request.contextPath}/vaccine/register/secondaryAddOrEditPage?sysno=' + $("#sysno").val(), function (data) {
                getCallback(data, secondaryShow);
            });
        }
    });

    //选择器重绘
    $(".selectpicker").selectpicker({
        width: 'auto'
    });

</script>
</html>