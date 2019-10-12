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
    <title>字典数据管理</title>
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
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">字典类型：</label>
                </div>
                <div class="col-md-3">
                    <select id="etype" name="etype" class="selectpicker">
                        <option value="dogBreed">伤人动物</option>
                        <option value="factory">疫苗厂家</option>
                        <option value="show">异常反应</option>
                        <option value="woundNum">伤口数量</option>
                        <option value="woundSite">伤口部位</option>
                        <option value="woundTreat">伤口处理</option>
                        <option value="vaName">疫苗名称</option>
                    </select>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">字典编码：</label>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="ecode" name="ecode"
                               value="${sysEnum.ecode}" class="form-control"
                               placeholder="字典编码" readonly/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">字典名称：</label>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <input type="text" id="ename" name="ename"
                               value="${sysEnum.ename}" class="form-control"
                               placeholder="字典名称" />
                    </div>
                </div>
                <div class="col-md-2 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">启用标识：</label>
                </div>
                <div class="col-md-4">
                    <select id="useFlag" name="useFlag" class="selectpicker">
                        <option value="Y">启用</option>
                        <option value="N">关闭</option>
                    </select>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="form-group  col-md-11" style="text-align: center">
                    <div class="form-group" style="text-align: center">
                        <button class="btn btn-success btn-lg" type="button" id="enumFormSubmit">提交</button>
                    </div>
                </div>
            </div>
        </form>


    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {

        // 字典类型下拉框赋值
        $('#etype').selectpicker('val', '${sysEnum.etype}');

        // 字典启用标识下拉框赋值
        $('#useFlag').selectpicker('val', '${sysEnum.useFlag}');

        <c:if test="${sysEnum.ecode == null || sysEnum.ecode == ''}">
        //随机字符串（10位）
        var randomString = Math.random().toString(36).substr(2);
        //编码前台生成
        $("#ecode").val(randomString);

        // 字典启用标识创建时默认打开
        $('#useFlag').selectpicker('val', 'Y');
        </c:if>

        //必填项检查
        function formCheck() {
            if ($("#etype").val() == null) {
                $.alert("字典类型不能为空");
                return false;
            }

            if ($("#ecode").val() == "") {
                $.alert("字典编码不能为空");
                return false;
            }

            if ($("#ename").val() == "") {
                $.alert("字典名称不能为空");
                return false;
            }

            if ($("#useFlag").val() == null) {
                $.alert("启用标识不能为空");
                return false;
            }

            return true;
        }


        function createOrUpdate() {
            if (!formCheck()) {
                return;
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/vaccine/enum/createOrUpdate",
                type: "post",
                data: {
                    etype: $("#etype").val(),
                    ecode: $("#ecode").val(),
                    ename: $("#ename").val(),
                    useFlag: $("#useFlag").val()
                },
                success: function (data) {
                    $.alert(data.msg);
                }
            });
        }

        //防止数据重复创建
        $("#enumFormSubmit").click(function () {
            createOrUpdate();
        });

    });

    //选择器重绘
    $(".selectpicker").selectpicker({
        width: 'auto'
    });

</script>
</html>