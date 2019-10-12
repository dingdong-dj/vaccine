<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/global.jsp" %>
<%@ include file="/common/include_common.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户添加修改页</title>
</head>
<body>
<div id="main" style=";background: #fff;left: 15%;">
    <div class="container col-md-12"
         style="margin-top: 30px; margin-left: 50px; display: table;">
        <form id="dataForm" method="post">
            <div class="row" style="margin-top: 10px; margin-bottom: 10px; display: none">
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="userId" name="userId"
                               value="${sysUser.userId}" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px; display: none">
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="userValid" name="userValid"
                               value="1" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 5px; margin-bottom: 5px;">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">医院：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <select id="userHosp" name="userHosp" class="selectpicker">
                        </select>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">类别：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <select id="userType" name="userType" class="selectpicker">
                            <option value="doctor">医生</option>
                            <option value="nurse">护士</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">科室：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="userDept" name="userDept"
                               value="${sysUser.userDept}" class="form-control"
                               placeholder="科室"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">工号：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="userCode" name="userCode"
                               value="${sysUser.userCode}" class="form-control"
                               placeholder="工号"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">姓名：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="userName" name="userName"
                               value="${sysUser.userName}" class="form-control"
                               placeholder="姓名"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="col-md-4 text-left"
                     style="background-color: #FFEEDD; line-height: 26px; vertical-align: middle;">
                    <label style="margin-top: 5px; font-size: 14px; color: grey;">密码：</label>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <input type="text" id="userPassword" name="userPassword"
                               value="${sysUser.userPassword}" class="form-control"
                               placeholder="密码"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="form-group  col-md-11" style="text-align: center">
                    <div class="form-group" style="text-align: center">
                        <button class="btn btn-success btn-lg" type="button" id="userFormSubmit">提交</button>
                    </div>
                </div>
            </div>
        </form>


    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {

        // 类别下拉框赋值
        $('#userType').selectpicker('val', '${sysUser.userType}');

        //网页打开时医院列表选项动态加载
        $.ajax({
            url: "${pageContext.request.contextPath}/vaccine/register/getHospList",
            async: true,
            data: {},
            success: function (data) {
                if (data.success) {
                    $("#userHosp").find("option").remove();
                    var list = data.hospList;
                    if (list) {
                        for (var i = 0; i < list.length; i++) {
                            var optionString = "";
                            optionString = "<option value=\""
                                + list[i].hospNo + "\">"
                                + list[i].hospName + "</option>";
                            $("#userHosp").append(optionString);

                        }
                        $("#userHosp").selectpicker('refresh');
                        //疫苗下拉框赋值
                        $("#userHosp").selectpicker('val', '${sysUser.userHosp}');
                    }
                } else {
                    $.alert(data.msg);
                }
            }
        });
//必填项检查
        function formCheck() {
            if ($("#userHosp").val() == null) {
                $.alert("用户医院不能为空");
                return false;
            }

            if ($("#userType").val() == "") {
                $.alert("用户类别不能为空");
                return false;
            }

            if ($("#userDept").val() == "") {
                $.alert("用户科室不能为空");
                return false;
            }

            if ($("#userCode").val() == null) {
                $.alert("用户工号不能为空");
                return false;
            }

            if ($("#userName").val() == null) {
                $.alert("用户姓名不能为空");
                return false;
            }

            if ($("#userPassword").val() == null) {
                $.alert("用户密码不能为空");
                return false;
            }
            return true;
        }


        function createOrUpdate() {
            if (!formCheck()) {
                return;
            }
            var un = $("#userCode").val();
            var pd = $("#userPassword").val();
            //密码加密
            var pwd = Encrypting(un,pd);
            if($("#userId").val() == ""){
                $.ajax({
                    url: "${pageContext.request.contextPath}/common/user/add",
                    type: "post",
                    data: {
                        userHosp: $("#userHosp").val(),
                        userDept: $("#userDept").val(),
                        userCode: un,
                        userPassword: pwd,
                        userName: $("#userName").val(),
                        userType: $("#userType").val(),
                        userValid: $("#userValid").val()
                    },
                    success: function (data) {
                        if (!data.success) {
                            $.alert("保存失败");
                        }else{
                            $.alert(data.msg);
                        }
                    }
                });
            }else{
                $.ajax({
                    url: "${pageContext.request.contextPath}/common/user/update",
                    type: "post",
                    data: {
                        userId: $("#userId").val(),
                        userHosp: $("#userHosp").val(),
                        userDept: $("#userDept").val(),
                        userCode: un,
                        userPassword: pwd,
                        userName: $("#userName").val(),
                        userType: $("#userType").val(),
                        userValid: $("#userValid").val()
                    },
                    success: function (data) {
                        if (!data.success) {
                            $.alert("保存失败");
                        }else{
                            $.alert(data.msg);
                        }
                    }
                });
            }
        }

        //防止数据重复创建
        if (document.URL.toString().indexOf("?") == -1) {
            $("#userFormSubmit").one("click", function () {
                createOrUpdate();
            });
        } else {
            $("#userFormSubmit").click(function () {
                createOrUpdate();
            });
        }
    });

</script>
</html>