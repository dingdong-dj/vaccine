<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>--%>
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css"
      rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-select-1.12.4-dist/css/bootstrap-select.min.css"
      rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-datetimepicker-dist/css/bootstrap-datetimepicker.min.css"
      rel="stylesheet">


<%--<script src="${pageContext.request.contextPath}/resources/plugins/jquery-3.2.1.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-select-1.12.4-dist/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-select-1.12.4-dist/js/i18n/defaults-zh_CN.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-datetimepicker-dist/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-datetimepicker-dist/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>狂犬病患者登记</title>
</head>
<style>
    .btn {
        margin: 0 8rem 0 8rem;
    }
</style>
<body>
<div id="secondaryMain">
    <div class="container col-md-11"
         style="margin-top: 30px; margin-left: 50px; display: table;">
        <form id="secondaryDataForm" method="post">
            <div class="row" style="margin-top: 10px; margin-bottom: 10px; display: none">
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="secondarySysno" name="secondarySysno"
                               value="${vaHdcvMst.sysno}" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 5px; margin-bottom: 5px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">记录编号：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="vaSysno" name="vaSysno"
                               value="${vaHdcvMst.vaSysno}" class="form-control"
                               placeholder="记录编号" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">狂免批号：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="vaProteinNo" name="vaProteinNo"
                               value="${vaHdcvMst.vaProteinNo}" class="form-control"
                               placeholder="狂免批号" readonly/>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">狂免注射部位：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="form-group">
                            <select class="selectpicker" name="vaProteinPart" id="vaProteinPart" readonly>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 5px; margin-bottom: 5px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">患者体重（Kg）：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="patWeight" name="patWeight"
                               value="${vaHdcvMst.patWeight}" class="form-control"
                               placeholder="患者体重（Kg）" readonly/>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">免疫球蛋白单位：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="vaProtein" name="vaProtein"
                               value="${vaHdcvMst.vaProtein}" class="form-control"
                               placeholder="免疫球蛋白单位" readonly/>
                        <input type="hidden" id="vaProteinFac" name="vaProteinFac" value="${vaHdcvMst.vaProteinFac}">
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">既往接种史：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <select class="selectpicker" name="vaHistory" id="vaHistory">
                        </select>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">异地注射：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <select class="selectpicker" name="vaOffsite" id="vaOffsite">
                            <option value="Y">是</option>
                            <option value="N" selected>否</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 5px; margin-bottom: 5px;">
                <div class="col-md-2"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">暴露日期：</label>
                </div>
                <div class="col-md-3">
                    <input type="text" id="hdcvDt" name="hdcvDt"
                           value="${vaHdcvMst.hdcvDt}" class="form-control"
                           placeholder="暴露日期" readonly/>
                    <%--<div class="input-group date form_date col-md-16">
                        <input id="hdcvDt" name="hdcvDt" class="form-control" size="16" type="text"
                               placeholder="请选择日期" readonly> <span
                            class="input-group-addon"><span
                            class="glyphicon glyphicon-remove"></span></span> <span
                            class="input-group-addon"><span
                            class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <script type="text/javascript">
                        //	日历组件选择
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
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">暴露地点：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="hdcvAdd" name="hdcvAdd"
                               value="${vaHdcvMst.hdcvAdd}" class="form-control"
                               placeholder="暴露地点" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">伤人动物：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <select class="selectpicker" name="dogType" id="dogType">
                        </select>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">暴露等级：</label>
                </div>
                <div class="col-md-3">
                    <select id="expose" name="expose" class="selectpicker" readonly>
                        <option value="I">I级</option>
                        <option value="II">II级</option>
                        <option value="III">III级</option>
                    </select>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">伤口部位：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <select class="selectpicker" name="cutPart" id="cutPart" multiple>
                        </select>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">伤口数目：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <select class="selectpicker" name="cutNo" id="cutNo">
                        </select>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">伤口处理：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <select class="selectpicker" name="cutDeal" id="cutDeal" multiple>
                        </select>
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;  display: none">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">医院代码：</label>
                </div>
                <%--<div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="secondaryHospNo" name="secondaryHospNo"
                               value="${vaHdcvMst.hospNo}" class="form-control"
                               placeholder="医院代码" readonly/>
                    </div>
                </div>--%>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">备注：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <textarea type="text" class="form-control" rows="2" id="remarks" name="remarks"
                                  placeholder="请输入描述" readonly>${vaHdcvMst.remarks}</textarea>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; display: none">
                <div class="form-group" style="text-align: center">
                    <button class="btn btn-success btn-lg" type="button" id="secondaryFormSubmit">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {

        // 暴露等级、治疗方式、异地注射、蛋白注射部位下拉框赋值
        $('#expose').selectpicker('val', '${vaHdcvMst.expose}');
        $('#cutDeal').selectpicker('val', '${vaHdcvMst.cutDeal}'.split(","));
        $('#vaOffsite').selectpicker('val', '${vaHdcvMst.vaOffsite}');
        $('#vaProteinPart').selectpicker('val', '${vaHdcvMst.vaProteinPart}'.split(","));

        //伤人动物下拉框选项动态加载
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=dogBreed",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    $("#dogType").find("option").remove();
                    var list = data.enumList;
                    if (list) {
                        for (var i = 0; i < list.length; i++) {
                            var optionString = "";
                            optionString = "<option value=\""
                                + list[i].ecode + "\">"
                                + list[i].ename + "</option>";
                            $("#dogType").append(optionString);

                        }
                        $("#dogType").selectpicker('refresh');
                        //伤人动物下拉框赋值
                        $("#dogType").selectpicker('val', '${vaHdcvMst.dogType}');
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });

        //伤口部位（狂免注射部位）下拉框选项动态加载
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=woundSite",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    $("#cutPart").find("option").remove();
                    $("#vaProteinPart").find("option").remove();
                    var list = data.enumList;
                    if (list) {
                        for (var i = 0; i < list.length; i++) {
                            var optionString = "";
                            optionString = "<option value=\""
                                + list[i].ecode + "\">"
                                + list[i].ename + "</option>";
                            $("#cutPart").append(optionString);
                            $("#vaProteinPart").append(optionString);
                        }
                        $("#cutPart").selectpicker('refresh');
                        $("#vaProteinPart").selectpicker('refresh');
                        //伤口部位（狂免注射部位）下拉框赋值
                        $("#cutPart").selectpicker('val', '${vaHdcvMst.cutPart}'.split(","));
                        $("#vaProteinPart").selectpicker('val', '${vaHdcvMst.vaProteinPart}'.split(","));
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });

        //既往接种史下拉框选项动态加载
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=vaHistory",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    $("#vaHistory").find("option").remove();
                    var list = data.enumList;
                    if (list) {
                        for (var i = 0; i < list.length; i++) {
                            var optionString = "";
                            optionString = "<option value=\""
                                + list[i].ecode + "\">"
                                + list[i].ename + "</option>";
                            $("#vaHistory").append(optionString);

                        }
                        $("#vaHistory").selectpicker('refresh');
                        //既往接种史下拉框赋值
                        $("#vaHistory").selectpicker('val', '${vaHdcvMst.vaHistory}');
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });


        //伤口数量下拉框选项动态加载
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=woundNum",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    $("#cutNo").find("option").remove();
                    var list = data.enumList;
                    if (list) {
                        for (var i = 0; i < list.length; i++) {
                            var optionString = "";
                            optionString = "<option value=\""
                                + list[i].ecode + "\">"
                                + list[i].ename + "</option>";
                            $("#cutNo").append(optionString);

                        }
                        $("#cutNo").selectpicker('refresh');
                        //伤口数量下拉框赋值
                        $("#cutNo").selectpicker('val', '${vaHdcvMst.cutNo}');
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });

        //伤口处理下拉框选项动态加载
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=woundTreat",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    $("#cutDeal").find("option").remove();
                    var list = data.enumList;
                    if (list) {
                        for (var i = 0; i < list.length; i++) {
                            var optionString = "";
                            optionString = "<option value=\""
                                + list[i].ecode + "\">"
                                + list[i].ename + "</option>";
                            $("#cutDeal").append(optionString);

                        }
                        $("#cutDeal").selectpicker('refresh');
                        //伤口数量下拉框赋值
                        $('#cutDeal').selectpicker('val', '${vaHdcvMst.cutDeal}'.split(","));
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });

        function secondarySubmit() {
            $.ajax({
                url: "${pageContext.request.contextPath}/vaccine/register/secondaryCreateOrEdit",
                type: "post",
                data: {
                    sysno: $("#secondarySysno").val(),
                    hdcvDt: $("#hdcvDt").val(),
                    hdcvAdd: $("#hdcvAdd").val(),
                    dogType: $("#dogType").val(),
                    expose: $("#expose").val(),
                    cutPart: $("#cutPart").val().toString(),
                    cutNo: $("#cutNo").val(),
                    cutDeal: $("#cutDeal").val().toString(),
                    hospNo: $("#secondaryHospNo").val(),
                    remarks: $("#remarks").val(),
                    patWeight: $("#patWeight").val(),
                    vaProtein: $("#vaProtein").val(),
                    vaHistory: $("#vaHistory").val(),
                    vaOffsite: $("#vaOffsite").val(),
                    vaSysno: $("#vaSysno").val(),
                    vaProteinNo: $("#vaProteinNo").val(),
                    vaProteinPart: $("#vaProteinPart").val().toString(),
                    vaProteinFac:$("#vaProteinFac").val()
                },
                success: function (data) {
                    if (!data.success) {
                        $.alert(data.msg);
                    } else {
                        $.alert(data.msg);
                    }
                    index_Tab.closeTab($(this));
                }
            });
        }


        //防止数据重复提交
        $("#secondaryFormSubmit").click("click", function () {
            secondarySubmit();
        });

    });

    //选择器重绘
    $(".selectpicker").selectpicker({
        width: 'auto'
    });

    //选择器禁用
    $('.selectpicker').prop('disabled', true);


</script>
</html>