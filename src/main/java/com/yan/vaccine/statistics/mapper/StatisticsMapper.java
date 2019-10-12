package com.yan.vaccine.statistics.mapper;

import com.yan.vaccine.statistics.model.RabiesCodeFormDoc;
import com.yan.vaccine.statistics.model.RabiesOutStatistics;

import java.util.List;
import java.util.Map;

/**
 * 项目名称：yan-demo
 * 类名称：UnionMapper
 * 类描述：
 * 创建人：lxk
 * 创建时间：2018-10-12 16:55
 * 修改人：
 * 修改时间：
 * 修改备注：
 **/
public interface StatisticsMapper {
    //时间段内开出狂犬疫苗概览
    List<RabiesOutStatistics> rabiesUsePeriod (Map<String, Object> condition);

    //狂犬疫苗未注射疫苗统计数据
    List<RabiesOutStatistics> residualVaccine (Map<String, Object> condition);

    //犬伤患者统计数据（医生）
    List<RabiesCodeFormDoc> rabiesCodeD (Map<String, Object> condition);

    //时间段内开出狂犬疫苗数量
    int rabiesOutPeriodNum(Map<String, Object> condition);

    //狂犬疫苗未注射疫苗统计数量
    int residualVaccineNum(Map<String, Object> condition);

    //时间段内使用狂犬疫苗数量
    int rabiesUsePeriodNum(Map<String, Object> condition);
}
