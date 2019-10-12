package com.yan.vaccine.statistics.controller;

import com.yan.core.annotation.MapperInject;
import com.yan.vaccine.common.mapper.SysEnumMapper;
import com.yan.vaccine.common.model.SysEnum;
import com.yan.vaccine.common.model.SysEnumExample;
import com.yan.vaccine.statistics.mapper.StatisticsMapper;
import com.yan.vaccine.statistics.model.RabiesCodeFormDoc;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目名称：yan-demo
 * 类名称：ExcelController
 * 类描述：
 * 创建人：lxk
 * 创建时间：2018-10-31 15:16
 * 修改人：
 * 修改时间：
 * 修改备注：
 **/
@Controller
@RequestMapping("/vaccine/excel")
public class ExcelController {


    @MapperInject(StatisticsMapper.class)
    private StatisticsMapper statisticsMapper;


    @MapperInject(SysEnumMapper.class)
    private SysEnumMapper sysEnumMapper;

    //下载犬伤患者统计数据EXCEL
    @ResponseBody
    @RequestMapping("/rabiesCodeExcel")
    public void rabiesCodeExcel(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        try {
            if (null == request || null == resp) {
                return;
            }
            List<RabiesCodeFormDoc> listContent;
            Map<String, Object> condition = new HashMap<>();
            listContent = statisticsMapper.rabiesCodeD(condition);
            //生成Excel文件
            rabiesCodeExportExcel(request, resp, listContent);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> result = new HashMap<>();
            result.put("success", false);
            result.put("msg", "导出 EXCEL 文件异常，请重试");
        }
    }

    /**
     * excel导出犬伤患者统计数据
     *
     * @param request
     * @param resp
     * @throws UnsupportedEncodingException
     */
    public void rabiesCodeExportExcel(HttpServletRequest request, HttpServletResponse resp, List<RabiesCodeFormDoc> listContent) throws Exception {

        List<RabiesCodeFormDoc> rCFD = listContent;

        HSSFWorkbook wb = new HSSFWorkbook();
        request.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/x-download");

        String fileName = "浙江省犬伤门诊登记表（绍兴文理附属医院）.xls";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        resp.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        HSSFSheet sheet = wb.createSheet("绍兴文理附属医院");
        //行高
        sheet.setDefaultRowHeight((short) (256));
        //列宽
        sheet.setColumnWidth(0, 20 * 160);
        sheet.setColumnWidth(1, 30 * 160);
        sheet.setColumnWidth(2, 20 * 160);
        sheet.setColumnWidth(3, 20 * 160);
        sheet.setColumnWidth(4, 20 * 160);
        sheet.setColumnWidth(5, 20 * 160);
        sheet.setColumnWidth(6, 80 * 160);
        sheet.setColumnWidth(7, 24 * 160);
        sheet.setColumnWidth(8, 30 * 160);
        sheet.setColumnWidth(9, 20 * 160);
        sheet.setColumnWidth(10, 30 * 160);
        sheet.setColumnWidth(11, 24 * 160);
        sheet.setColumnWidth(12, 48 * 160);
        sheet.setColumnWidth(13, 24 * 160);
        sheet.setColumnWidth(14, 72 * 160);
        sheet.setColumnWidth(15, 24 * 160);
        sheet.setColumnWidth(16, 24 * 160);
        sheet.setColumnWidth(17, 24 * 160);
        sheet.setColumnWidth(18, 24 * 160);
        HSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 16);
        HSSFRow row = sheet.createRow(0);
        sheet.createRow(1);
        sheet.createRow(2);
        sheet.createRow(3);
        sheet.createRow(4);
        sheet.createRow(5);
        sheet.createRow(6);
        sheet.createRow(7);
        sheet.createRow(8);
        sheet.createRow(9);
        sheet.createRow(10);
        sheet.createRow(11);
        sheet.createRow(12);
        sheet.createRow(13);
        sheet.createRow(14);
        sheet.createRow(15);
        sheet.createRow(16);
        sheet.createRow(17);
        sheet.createRow(18);
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//居中
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
        style.setWrapText(true);//设置自动换行
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("编号");
        cell.setCellStyle(style);
        cell = row.createCell(1);
        cell.setCellValue("登记日期");
        cell.setCellStyle(style);
        cell = row.createCell(2);
        cell.setCellValue("患者姓名");
        cell.setCellStyle(style);
        cell = row.createCell(3);
        cell.setCellValue("患者性别");
        cell.setCellStyle(style);
        cell = row.createCell(4);
        cell.setCellValue("患者年龄");
        cell.setCellStyle(style);
        cell = row.createCell(5);
        cell.setCellValue("患者职业");
        cell.setCellStyle(style);
        cell = row.createCell(6);
        cell.setCellValue("患者地址");
        cell.setCellStyle(style);
        cell = row.createCell(7);
        cell.setCellValue("患者联系电话");
        cell.setCellStyle(style);
        cell = row.createCell(8);
        cell.setCellValue("被伤日期");
        cell.setCellStyle(style);
        cell = row.createCell(9);
        cell.setCellValue("被伤地点");
        cell.setCellStyle(style);
        cell = row.createCell(10);
        cell.setCellValue("伤人动物种类");
        cell.setCellStyle(style);
        cell = row.createCell(11);
        cell.setCellValue("暴露等级");
        cell.setCellStyle(style);
        cell = row.createCell(12);
        cell.setCellValue("伤口部位");
        cell.setCellStyle(style);
        cell = row.createCell(13);
        cell.setCellValue("伤口数目");
        cell.setCellStyle(style);
        cell = row.createCell(14);
        cell.setCellValue("伤口处理");
        cell.setCellStyle(style);
        cell = row.createCell(15);
        cell.setCellValue("疫苗厂家");
        cell.setCellStyle(style);
        cell = row.createCell(16);
        cell.setCellValue("疫苗批次");
        cell.setCellStyle(style);
        cell = row.createCell(17);
        cell.setCellValue("蛋白");
        cell.setCellStyle(style);
        cell = row.createCell(18);
        cell.setCellValue("蛋白批次");
        cell.setCellStyle(style);

        //获取动物种类
        SysEnumExample exampleAnimal = new SysEnumExample();
        SysEnumExample.Criteria criteriaAnimal = exampleAnimal.createCriteria();
        criteriaAnimal.andEtypeEqualTo("dogBreed");
        List<SysEnum> listAnimal = sysEnumMapper.selectByExample(exampleAnimal);

        //获取伤口部位
        SysEnumExample examplePart= new SysEnumExample();
        SysEnumExample.Criteria criteriaPart= examplePart.createCriteria();
        criteriaPart.andEtypeEqualTo("woundSite");
        List<SysEnum> listPart = sysEnumMapper.selectByExample(examplePart);

        //获取伤口处理
        SysEnumExample exampleDeal= new SysEnumExample();
        SysEnumExample.Criteria criteriaDeal= exampleDeal.createCriteria();
        criteriaDeal.andEtypeEqualTo("woundTreat");
        List<SysEnum> listDeal = sysEnumMapper.selectByExample(exampleDeal);

        for (int i = 0; i < rCFD.size(); i++) {
            HSSFRow rowSub = sheet.createRow(i + 1);
            RabiesCodeFormDoc rabiesCodeFormDoc = dealRCFD(rCFD.get(i), listAnimal, listPart, listDeal);
            HSSFCell cellSub = rowSub.createCell(0);
            cellSub.setCellValue(rabiesCodeFormDoc.getVaSysno());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(1);
            cellSub.setCellValue(rabiesCodeFormDoc.getBookDt());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(2);
            cellSub.setCellValue(rabiesCodeFormDoc.getPatName());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(3);
            cellSub.setCellValue(rabiesCodeFormDoc.getPatSex());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(4);
            cellSub.setCellValue(rabiesCodeFormDoc.getPatAge());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(5);
            cellSub.setCellValue(rabiesCodeFormDoc.getPatOccu());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(6);
            cellSub.setCellValue(rabiesCodeFormDoc.getPatAdd());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(7);
            cellSub.setCellValue(rabiesCodeFormDoc.getPatTel());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(8);
            cellSub.setCellValue(rabiesCodeFormDoc.getHdcvDt());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(9);
            cellSub.setCellValue(rabiesCodeFormDoc.getHdcvAdd());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(10);
            cellSub.setCellValue(rabiesCodeFormDoc.getDogType());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(11);
            cellSub.setCellValue(rabiesCodeFormDoc.getExpose());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(12);
            cellSub.setCellValue(rabiesCodeFormDoc.getCutPart());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(13);
            cellSub.setCellValue(rabiesCodeFormDoc.getCutNo());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(14);
            cellSub.setCellValue(rabiesCodeFormDoc.getCutDeal());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(15);
            cellSub.setCellValue(rabiesCodeFormDoc.getManufName());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(16);
            cellSub.setCellValue(rabiesCodeFormDoc.getBatchNo());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(17);
            cellSub.setCellValue(rabiesCodeFormDoc.getVaProtein());
            cellSub.setCellStyle(style);
            cellSub = rowSub.createCell(18);
            cellSub.setCellValue(rabiesCodeFormDoc.getVaProteinNo());
            cellSub.setCellStyle(style);
        }
        try {
            OutputStream out = resp.getOutputStream();
            wb.write(out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    //处理文字
    public RabiesCodeFormDoc dealRCFD(RabiesCodeFormDoc RabiesCodeFormDoc,  List<SysEnum> listAnimal, List<SysEnum> listPart, List<SysEnum> listDeal) {

        //伤人动物
        for(int i = 0; i < listAnimal.size(); i++){
            SysEnum animal = listAnimal.get(i);
            if(RabiesCodeFormDoc.getDogType().equals(animal.getEcode())){
                RabiesCodeFormDoc.setDogType(animal.getEname());
            }
        }

        //伤口部位
        String[] part = RabiesCodeFormDoc.getCutPart().split(",");
        StringBuffer sbPart = new StringBuffer();
        for(int i = 0; i < part.length; i++){
            for(int j = 0; j < listPart.size(); j++){
                SysEnum partE = listPart.get(j);
                if(part[i].toString().equals(partE.getEcode())){
                    sbPart.append(partE.getEname());
                    sbPart.append(" ");
                }
            }
        }
        RabiesCodeFormDoc.setCutPart(sbPart.toString());

        //伤口处理
        String[] deal = RabiesCodeFormDoc.getCutDeal().split(",");
        StringBuffer sbDeal = new StringBuffer();
        for(int i = 0; i < deal.length; i++){
            for(int j = 0; j < listDeal.size(); j++){
                SysEnum dealE = listDeal.get(j);
                if(deal[i].toString().equals(dealE.getEcode())){
                    sbDeal.append(dealE.getEname());
                    sbDeal.append(" ");
                }
            }
        }
        RabiesCodeFormDoc.setCutDeal(sbDeal.toString());

        //性别
        switch (RabiesCodeFormDoc.getPatSex()) {
            case "m":
                RabiesCodeFormDoc.setPatSex("男");
                break;
            case "f":
                RabiesCodeFormDoc.setPatSex("女");
                break;
            default:
                break;
        }

        //伤口数目
        switch (RabiesCodeFormDoc.getCutNo()) {
            case "1":
                RabiesCodeFormDoc.setCutNo("单处");
                break;
            case "N":
                RabiesCodeFormDoc.setCutNo("多处");
                break;
            default:
                break;
        }

        //蛋白注射情况
        switch (RabiesCodeFormDoc.getVaProtein()) {
            case "0":
                RabiesCodeFormDoc.setVaProtein("无需注射");
                break;
            case "":
                RabiesCodeFormDoc.setVaProtein("拒绝注射");
                break;
            default:
                RabiesCodeFormDoc.setVaProtein(RabiesCodeFormDoc.getVaProteinFac());
                break;
        }

        return RabiesCodeFormDoc;
    }
}
