<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>

    <title>绍兴文理学院附属医院</title>
    <meta name="renderer" content="webkit">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        body{
            background: white;
            padding:40px 0;
        }
        table,.date{
            width: 90%;
            margin:10px auto;
            font-size: 16px;
            border:1px solid;
        }
        .date{
            text-align:right;
            border:0;
        }
        table td{
            border:1px solid;
            padding:1px 5px 1px 5px;
            text-align: center;
        }
        .title{
            width:8% !important;
        }

        .text{
            width:12% !important;
            font-weight: normal;
        }

        .cTitle{
            width:15% !important;
            font-weight: normal;
        }

        .cText{
            width:17% !important;
            font-weight: normal;
        }

        .fHide{
            display:none;/*第一行单元格隐藏吧*/
            width:6.25% !important;
        }


        .tr_height{
            height:30px;
        }
        @page {
            margin: 0;
        }
    </style>
</head>
<body>
<div class="main-div" style="width:100%">
    <div class="left-div" style="width:75%;float: left;padding-left: 200px">
        <h2 class="text-center" style="margin-bottom:10px;margin-top: 10px">绍兴文理学院附属医院</h2>
        <h3 class="text-center" style="margin-bottom:5px;margin-top: 0px">狂&nbsp;&nbsp;&nbsp;犬&nbsp;&nbsp;&nbsp;病&nbsp;&nbsp;&nbsp;预&nbsp;&nbsp;&nbsp;防&nbsp;&nbsp;&nbsp;处&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;记&nbsp;&nbsp;&nbsp;录</h3>
    </div>
    <div class="right-div" style="width:25%;float: right;padding-left: 80px">
        <img src="${pageContext.request.contextPath}/resources/images/two.jpg" width="100px" height="100px">
    </div>
</div>

<table style="table-layout: fixed;border: none;">
    <thead>
    </thead>
    <tbody>
    <tr>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
        <td class="fHide"></td>
    </tr>
    <tr class="tr_height">
        <td colspan="2" class="text" >姓名</td>
        <td colspan="4" class="text" >
            ${uvvh0.patName}
        </td>
        <td colspan="2" class="text" >性别</td>
        <td colspan="4" class="text" >
            <c:if test="${uvvh0.patSex == 'm'}">男</c:if>
            <c:if test="${uvvh0.patSex == 'f'}">女</c:if>
        </td>
        <td colspan="2" class="text" >年龄</td>
        <td colspan="4" class="text" ><u>&nbsp;${uvvh0.patAge}&nbsp;</u>岁</td>
        <td colspan="2" class="text" >体重</td>
        <td colspan="4" class="text" ><u>&nbsp;${uvvh0.patWeight}&nbsp;</u>Kg</td>
        <td colspan="4" class="text" >编号</td>
        <td colspan="4" class="text" >${uvvh0.vaSysno}</td>
    </tr>
    <tr class="tr_height">
        <td colspan="12" class="text" style=";text-align: left" id="exposeDate">暴露日期：${uvvh0.hdcvDt}</td>
        <td colspan="12" class="text" style=";text-align: left" id="cureDate">就诊日期：${uvvh0.bookDt}</td>
        <td colspan="8" class="text" style=";text-align: left" id="biteAni"></td>
    </tr>
    <tr class="tr_height">
        <td colspan="20" class="text" style=";text-align: left" id="vaHistory"></td>
        <td colspan="12" class="text" style=";text-align: left" id="bitePart"></td>
    </tr>
    <tr class="tr_height">
        <td colspan="4" class="text" >暴露分级</td>
        <td colspan="28" class="text" style=";text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;${uvvh0.expose}类伤口</td>
    </tr>
    <tr style="height:20px">
        <td colspan="32" class="text" style=";font-weight: bold;font-size: xx-small;text-align: left">* 确认为Ⅱ级暴露者且免疫功能低下的，或一动物伤多人，或Ⅱ级暴露位于头面部者且致伤动物不能确定健康时，按照Ⅲ级暴露处置</td>
    </tr>
    <tr class="tr_height">
        <td colspan="16" class="text" style=";text-align: left" id="biteDeal"></td>
        <td colspan="16" class="text" style=";text-align: left">

            <c:if test="${uvvh0.vaProtein == '0' }">2.患者无需注射狂犬病免疫球蛋白针</c:if>
            <c:if test="${uvvh0.vaProtein == null || uvvh0.vaProtein == ''}">2.患者拒绝注射狂犬病免疫球蛋白针</c:if>
            <c:if test="${uvvh0.vaProtein != null && uvvh0.vaProtein != '0' && uvvh0.vaProtein != ''}">2.本院注射狂犬病免疫球蛋白针<u>&nbsp;&nbsp;${uvvh0.vaProtein}&nbsp;&nbsp;</u>单位</c:if>
        </td>
    </tr>
    <tr class="tr_height">
        <td colspan="26" class="text" style=";text-align: left" id="vaccineFacName"></td>
        <td colspan="6" class="text" style=";text-align: left">
            <c:if test="${uvvh0.vaOffsite == 'Y'}">4.&nbsp;√&nbsp;异地注射</c:if>
            <c:if test="${uvvh0.vaOffsite != 'Y'}">4.&nbsp;×&nbsp;异地注射</c:if>
        </td>
    </tr>
    <tr class="tr_height">
        <td colspan="32" class="text" style=";text-align: left">
            5.我已了解以上事项，并已核对疫苗种类无误，所接种疫苗在有效期内。
        </td>
    </tr>
    <tr class="tr_height">
        <td colspan="32" class="text" style=";text-align: left">
            病人签名：
        </td>
    </tr>
    <tr class="tr_height">
        <td colspan="16" class="text" style=";text-align: left" >狂免批号：${uvvh0.vaProteinNo}</td>
        <td colspan="16" class="text" style=";text-align: left" id="ProteinPart">狂免注射部位：</td>
    </tr>
    <tr class="tr_height">
        <td colspan="32" class="text" style=";font-weight: bold">人用狂犬病疫苗接种卡</td>
    </tr>
    <tr class="tr_height">
        <td colspan="7">针次</td>
        <td colspan="5">
            第一针<u>&nbsp;&nbsp;<c:if test="${times4Day.size() > 0}">${times4Day.get(0)}</c:if>&nbsp;&nbsp;</u>支
        </td>
        <td colspan="5">
            第二针<u>&nbsp;&nbsp;<c:if test="${times4Day.size() > 1}">${times4Day.get(1)}</c:if>&nbsp;&nbsp;</u>支
        </td>
        <td colspan="5">
            第三针<u>&nbsp;&nbsp;<c:if test="${times4Day.size() > 2}">${times4Day.get(2)}</c:if>&nbsp;&nbsp;</u>支
        </td>
        <td colspan="5">
            第四针<u>&nbsp;&nbsp;<c:if test="${times4Day.size() > 3}">${times4Day.get(3)}</c:if>&nbsp;&nbsp;</u>支
        </td>
        <td colspan="5">
            第五针<u>&nbsp;&nbsp;<c:if test="${times4Day.size() > 4}">${times4Day.get(4)}</c:if>&nbsp;&nbsp;</u>支
        </td>
    </tr>
    <tr class="tr_height">
        <td colspan="7">程序接种日期</td>
        <td colspan="5">${uvvh0.planDt}</td>
        <td colspan="5">${uvvh1.planDt}</td>
        <td colspan="5">${uvvh2.planDt}</td>
        <td colspan="5">${uvvh3.planDt}</td>
        <td colspan="5">${uvvh4.planDt}</td>
    </tr>
    <tr class="tr_height">
        <td colspan="7">实际接种日期</td>
        <td colspan="5">${uvvh0.execDt}</td>
        <td colspan="5">${uvvh1.execDt}</td>
        <td colspan="5">${uvvh2.execDt}</td>
        <td colspan="5">${uvvh3.execDt}</td>
        <td colspan="5">${uvvh4.execDt}</td>
    </tr>
    <tr class="tr_height">
        <td colspan="7">狂犬病疫苗批号</td>
        <td colspan="5">${uvvh0.batchNo}</td>
        <td colspan="5">${uvvh1.batchNo}</td>
        <td colspan="5">${uvvh2.batchNo}</td>
        <td colspan="5">${uvvh3.batchNo}</td>
        <td colspan="5">${uvvh4.batchNo}</td>
    </tr>
    <tr class="tr_height">
        <td colspan="7">接种者签名</td>
        <td colspan="5">${uvvh0.vaOper}</td>
        <td colspan="5">${uvvh1.vaOper}</td>
        <td colspan="5">${uvvh2.vaOper}</td>
        <td colspan="5">${uvvh3.vaOper}</td>
        <td colspan="5">${uvvh4.vaOper}</td>
    </tr>
    <tr class="tr_height">
        <td colspan="7">存&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;苗</td>
        <td colspan="5">${uvvh0.vaLeft}</td>
        <td colspan="5">${uvvh1.vaLeft}</td>
        <td colspan="5">${uvvh2.vaLeft}</td>
        <td colspan="5">${uvvh3.vaLeft}</td>
        <td colspan="5">${uvvh4.vaLeft}</td>
    </tr>
    <tr class="tr_height">
        <td colspan="12"style="text-align: left">受种者(监护人)签名：</td>
        <td colspan="6"style="text-align: left">日期：${uvvh0.bookDt}</td>
        <td colspan="8"style="text-align: left">医生签名：${uvvh0.vaDoc}</td>
        <td colspan="6"style="text-align: left">日期：${uvvh0.bookDt}</td>
    </tr>
    <tr class="tr_height">
        <td colspan="32" class="text" style="text-align: left;font-size: 12px;border: none">
            <h5 style="text-align: center;font-weight: bold">预防狂犬病告知书</h5>
            狂犬病是由狂犬病病毒引起的急性传染病，主要由携带狂犬病毒的犬、猫、家畜（猪、牛、马等）和野兽等温血动物咬伤所致。当人被感染狂犬病病毒的动物咬伤、抓伤及舔舐伤口或粘膜后，其唾液所含病毒经伤口或粘膜进入人体，一旦引起发病，病死率100%。潜伏期一般为30-90天，或更长。进行有效的预防措施，可明显减低狂犬病的发病率。
            <br>一、被可疑动物咬伤后，应立即正确处理伤口，应用肥皂水、清水或自来水反复彻底冲洗伤口15分钟以上，再用碘伏消毒伤口。根据需要注射抗狂犬病血清/狂犬病人免疫球蛋白和严格按照要求全程接种狂犬病疫苗，则能大大减少发病风险。抗狂犬病血清/狂犬病人免疫球蛋白能特异地中和狂犬病病毒，可立即起效。狂犬病疫苗接种后可刺激机体产生抗狂犬病病毒的保护性抗体。为安全有效地使用狂犬病疫苗和抗狂犬病血清/狂犬病人免疫球蛋白，在您使用之前我们将有关信息告知于您，您可以根据自己的具体情况决定是否使用。
            <br>二、疫苗须2-8℃冷藏，切忌冷冻, 犬伤后所购的狂犬病疫苗可由犬伤门诊保存，保存最长时间为2个月，逾期作报废处理。<u>严格按照预约日期接种疫苗，原则上不得改期，延期注射7天以上者全程重新注射。期间切忌海鲜、碳酸饮料、烟酒、浓茶、辣椒等刺激性食物，避免剧烈运动及剧烈劳动。</u>
            <br>三、狂犬病疫苗和狂犬病免疫球蛋白系生物制剂，可以明显减少发病机会，但仍有可能效果欠佳，发生狂犬病或继发各种感染。狂犬病疫苗：个别人接种后可产生不同程度不良反应。如：注射部位局部反应（疼痛、红肿、硬结等）；皮疹和荨麻疹等过敏反应；发热或全身不适等全身反应。狂犬病人免疫球蛋白：一般无不良反应，少数人有红肿、疼痛感，无需特殊处理可自行恢复。<u>接种后留观30分钟</u>，如出现轻微反应，一般无需特殊处理。特殊情况可电话咨询接种单位，必要时可赴医院诊治。
            <br>四、造成免疫失败的常见原因主要是：未及时正确采取预防措施；不按规定方式注射疫苗；自身免疫应答能力低下或过敏体质无法接种疫苗；使用非正规疫苗；接种期间使用免疫抑制剂或进食碳酸饮料、烟酒、浓茶、海鲜、辣椒等刺激性食物。
            <br><u>五、狂犬病疫苗和狂犬病人免疫球蛋白属于公民自费、自愿接种疫苗。本院复诊注射时间系（7:00至21:00）</u>。
            <br><u>六、本院采取开一针打一次的就诊流程</u>。
            <br><strong style="font-size: 14px">注：本知情同意书一式两份(受种者和接种单位各持1份)，凭单注射，诸妥再保管3年。</strong>
            <br><strong style="font-size: 14px">（关于狂犬疫苗及狂犬病免疫球蛋白注射相关事宜最终解释权归绍兴市疾控中心）</strong>
            <br><strong style="font-size: 14px">咨询电话：0575-88293273、0575-88293271</strong>
        </td>
    </tr>
    </tbody>
</table>
<div class="text-center">
    <button class="btn btn-primary" type="button" id="printRabies">打印</button>
</div>
</body>
<script type="text/javascript">

/*    //时间精确到秒
    function formatDateTime(date) {
        var hours = date.getHours();
        var minutes = date.getMinutes();
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var seconds = date.getSeconds();
        seconds = seconds < 10 ? '0' + seconds : seconds;
        return ' ' + hours + ':' + minutes + ':' + seconds;
    };
    var nowDate = new Date();
    var nowDateStr = formatDateTime(nowDate);
    $("#exposeDate")[0].textContent += nowDateStr;
    $("#cureDate")[0].textContent += nowDateStr;*/



    //动物列表
    var biteAnimalL;
    $.ajax({
        url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=dogBreed",
        async: false,
        type: "post",
        data: {},
        success: function (data) {
            if (data.success) {
                var list = data.enumList;
                if (list) {
                    biteAnimalL = list;
                }
            } else {
                $.alert(data.msg);
            }
        }
    });

    //部位列表
    var bitePartL;
    $.ajax({
        url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=woundSite",
        async: false,
        type: "post",
        data: {},
        success: function (data) {
            if (data.success) {
                var list = data.enumList;
                if (list) {
                    bitePartL = list;
                }
            } else {
                $.alert(data.msg);
            }
        }
    });

    //处理列表
    var biteDealL;
    $.ajax({
        url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=woundTreat",
        async: false,
        type: "post",
        data: {},
        success: function (data) {
            if (data.success) {
                var list = data.enumList;
                if (list) {
                    biteDealL = list;
                }
            } else {
                $.alert(data.msg);
            }
        }
    });

    //疫苗名称
    var vaNameL;
    $.ajax({
        url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=vaName",
        async: false,
        type: "post",
        data: {},
        success: function (data) {
            if (data.success) {
                var list = data.enumList;
                if (list) {
                    vaNameL = list;
                }
            } else {
                $.alert(data.msg);
            }
        }
    });

    //既往接种史
    var vaHistoryL;
    $.ajax({
        url: "${pageContext.request.contextPath}/vaccine/register/getEnum?type=vaHistory",
        async: false,
        type: "post",
        data: {},
        success: function (data) {
            if (data.success) {
                var list = data.enumList;
                if (list) {
                    vaHistoryL = list;
                }
            } else {
                $.alert(data.msg);
            }
        }
    });


    //编码转为中文
    function coed2Name() {
        var vaFactoryN = "${uvvh0.manufName}";
        var biteAnimalN = "";
        var bitePartN = "";
        var ProteinPartN = "";
        var biteDealN = "";
        var vaNameN = "";
        var vaHistoryN = "";

        var biteAnimalC = "${uvvh0.dogType}";
        var bitePartC = "${uvvh0.cutPart}".split(",");
        var ProteinPartC = "${uvvh0.vaProteinPart}".split(",");
        var biteDealC = "${uvvh0.cutDeal}".split(",");
        var vaNameC = "${uvvh0.vaName}";
        var vaHistoryC = "${uvvh0.vaHistory}";

        var i =0;
        while(biteAnimalC != biteAnimalL[i].ecode && i < biteAnimalL.length - 1){
            i++;biteAnimalL
        }
        if(biteAnimalC == biteAnimalL[i].ecode){
            biteAnimalN = biteAnimalL[i].ename;
        }
        i =0;

        for(var no = 0; no < bitePartC.length; no++){
            while(bitePartC[no] != bitePartL[i].ecode && i < bitePartL.length  - 1){
                i++;
            }
            if(bitePartC[no] == bitePartL[i].ecode){
                bitePartN += "√ "
                bitePartN += bitePartL[i].ename;
                bitePartN += " "
            }
        }

        i=0;
        for(var no = 0; no < ProteinPartC.length; no++){
            while(ProteinPartC[no] != bitePartL[i].ecode && i < bitePartL.length  - 1){
                i++;
            }
            if(ProteinPartC[no] == bitePartL[i].ecode){
                ProteinPartN += "√ "
                ProteinPartN += bitePartL[i].ename;
                ProteinPartN += " "
            }
        }
        // while(ProteinPartC != bitePartL[i].ecode && i < bitePartL.length  - 1){
        //     i++;
        // }
        // if(ProteinPartC == bitePartL[i].ecode){
        //     ProteinPartN = bitePartL[i].ename;
        // }
        i =0;

        for(var no = 0; no < biteDealC.length; no++){
            while(biteDealC[no] != biteDealL[i].ecode && i < biteDealL.length  - 1){
                i++;
            }
            if(biteDealC[no] == biteDealL[i].ecode){
                biteDealN += "√ "
                biteDealN += biteDealL[i].ename;
                biteDealN += "  "
            }
        }

        i =0;
        while(vaNameC != vaNameL[i].ecode && i < vaNameL.length  - 1){
            i++;
        }
        if(vaNameC == vaNameL[i].ecode){
            vaNameN = vaNameL[i].ename;
        }
        i =0;

        while(vaHistoryC != vaHistoryL[i].ecode && i < vaHistoryL.length  - 1){
            i++;
        }
        if(vaHistoryC == vaHistoryL[i].ecode){
            vaHistoryN = vaHistoryL[i].ename;
        }
        i =0;


        $("#biteAni")[0].textContent = "伤人动物："+biteAnimalN;
        $("#vaHistory")[0].textContent = "既往接种史："+vaHistoryN;
        $("#bitePart")[0].textContent = "咬伤部位："+bitePartN;
        $("#ProteinPart")[0].textContent = "狂免注射部位："+ProteinPartN;
        $("#biteDeal")[0].textContent = "1.本院处理伤口："+biteDealN;
        if(vaFactoryN != ""){
            $("#vaccineFacName")[0].textContent = "3.本院接种狂犬病疫苗："+vaFactoryN+"（"+vaNameN+"）"+"("+ '\xa0\xa0\xa0\xa0\xa0\xa0\xa0\xa0' +")元/支";
        }else{
            $("#vaccineFacName")[0].textContent = "3.本院接种狂犬病疫苗：";
        }
    }

    coed2Name();

    $(function() {
        $("#printRabies").click(function(){
            if (confirm("确定打印？")){
                //隐藏打印按钮
                $(this).hide();
                window.print();
            }
            //显示打印按钮
            $(this).show();
        });
    });
</script>
</html>