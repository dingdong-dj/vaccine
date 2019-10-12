package com.yan.vaccine.statistics.controller;

import com.yan.common.user.mapper.SysUserMapper;
import com.yan.core.annotation.MapperInject;
import com.yan.core.controller.BaseController;
import com.yan.core.model.PageModel;
import com.yan.vaccine.common.mapper.SysEnumMapper;
import com.yan.vaccine.plan.mapper.VaPlanDetMapper;
import com.yan.vaccine.register.mapper.UnionMapper;
import com.yan.vaccine.register.mapper.VaBookingMapper;
import com.yan.vaccine.register.mapper.VaHdcvMstMapper;
import com.yan.vaccine.register.mapper.VaTypeMapper;
import com.yan.vaccine.statistics.mapper.StatisticsMapper;
import com.yan.vaccine.statistics.model.RabiesCodeFormDoc;
import com.yan.vaccine.statistics.model.RabiesOutStatistics;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 名称：ProductController<br>
 *
 * 描述：产品信息管理<br>
 *
 * @author >lxk<br>
 * 时间：<br>
 * 2017-09-06 09:13:00<br>
 * 版权：<br>
 * Copyright 2017 <a href="https://gitee.com/LiuSubject" target="_blank">https://gitee.com/LiuSubject</a>. All rights reserved.
 */
@Controller
@RequestMapping("/vaccine/statistics")
public class StatisticsController extends BaseController {

	@MapperInject(VaBookingMapper.class)
	private VaBookingMapper vaBookingMapper;

	@MapperInject(VaHdcvMstMapper.class)
	private VaHdcvMstMapper vaHdcvMstMapper;

	@MapperInject(VaTypeMapper.class)
	private VaTypeMapper vaTyvpeMapper;

	@MapperInject(SysEnumMapper.class)
	private SysEnumMapper sysEnumMapper;

	@MapperInject(VaPlanDetMapper.class)
	private VaPlanDetMapper vaPlanDetMapper;

	@MapperInject(SysUserMapper.class)
	private SysUserMapper sysUserMapper;

	@MapperInject(UnionMapper.class)
	private UnionMapper unionMapper;

	@MapperInject(StatisticsMapper.class)
	private StatisticsMapper statisticsMapper;

	//打开时间段内开出/使用狂犬疫苗概览页
	@RequestMapping("/rabiesPeriodPage")
	public String rabiesOutPeriodPage() {
		return "vaccine/statistics/rabiesPeriod";
	}

	//打开狂犬疫苗未注射疫苗统计页
	@RequestMapping("/residualVaccinePage")
	public String residualVaccinePage() {
		return "vaccine/statistics/residualVaccine";
	}

	//打开犬伤患者统计页)(医生 接种计划列限制修改页)
	@RequestMapping("/rabiesCodePage")
	public String rabiesCodePage() {
		return "vaccine/statistics/rabiesCodeD";
	}

	//打开犬伤患者统计页（护士 接种计划列限制修改页）
	@RequestMapping("/rabiesCodeNPage")
	public String rabiesCodeNPage() {
		return "vaccine/statistics/rabiesCodeN";
	}

	//打开犬伤患者统计页（护士 接种计划无限制修改页）
	@RequestMapping("/rabiesCodeAPage")
	public String rabiesCodeAPage() {
		return "vaccine/statistics/rabiesCodeA";
	}


	//获取时间段内使用狂犬疫苗列表数据
	@RequestMapping(value = "/rabiesUsePeriodList", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<RabiesOutStatistics> rabiesOutPeriodList(int offset, int limit, String search, String sort, String order, String startDate, String endDate) {
		this.offsetPage(offset, limit);
		List<RabiesOutStatistics> listR;
		Map<String, Object> condition = new HashMap<>();
		//非空时搜索
		if(search != null){
			condition.put("searchName","%"+ search +"%");
		}else{
			condition.put("searchName","%%");
		}
		condition.put("startDate",startDate);
		condition.put("endDate",endDate);
		listR = statisticsMapper.rabiesUsePeriod(condition);
		return this.resultPage(listR);
	}

	//犬伤患者统计数据（医生）
	@RequestMapping(value = "/rabiesCodeDList", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<RabiesCodeFormDoc> rabiesCodeDList(int offset, int limit, String search, String sort, String order, String startDate, String endDate) {
		this.offsetPage(offset, limit);
		List<RabiesCodeFormDoc> listRCD;
		Map<String, Object> condition = new HashMap<>();
		//非空时搜索
		if(search != null && !search.equals("")){
			//判断是编号还是人名
			Pattern pattern = Pattern.compile("[0-9]*");
			Matcher isNum = pattern.matcher(search);
			boolean isMatch = isNum.matches();
			if(isMatch){
				condition.put("searchCode","%"+ search +"%");
			}else{
				condition.put("searchName","%"+ search +"%");
			}
		}
		listRCD = statisticsMapper.rabiesCodeD(condition);
		return this.resultPage(listRCD);
	}

	//获取狂犬疫苗未注射疫苗统计数据
	@RequestMapping(value = "/residualVaccineList", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<RabiesOutStatistics> residualVaccineList(int offset, int limit, String search, String sort, String order, String startDate, String endDate) {
		this.offsetPage(offset, limit);
		List<RabiesOutStatistics> listR;
		Map<String, Object> condition = new HashMap<>();
		//非空时搜索
		if(search != null){
			condition.put("searchName","%"+ search +"%");
		}else{
			condition.put("searchName","%%");
		}
		listR = statisticsMapper.residualVaccine(condition);
		return this.resultPage(listR);
	}

	//获取时间段内开出狂犬疫苗数量
	@RequestMapping(value = "/rabiesOutPeriodNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>  rabiesOutPeriodNum(String search, String startDate, String endDate) {
		Map<String, Object> result =new HashMap<>();
		try {
			Integer num;
			Map<String, Object> condition = new HashMap<>();
			//非空时搜索
			if(search != null){
                condition.put("searchName","%"+ search +"%");
            }else{
                condition.put("searchName","%%");
            }
            //补位
			condition.put("startDate",startDate + " 00:00");
			condition.put("endDate",endDate  + " 24:00");
			num = statisticsMapper.rabiesOutPeriodNum(condition);
			result.put("success", true);
			result.put("msg", "时间段内开出狂犬疫苗数量查询成功");
			result.put("num",num);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "时间段内开出狂犬疫苗数量查询失败");
		}
		return result;
	}

	//获取狂犬疫苗未注射疫苗统计数量
	@RequestMapping(value = "/residualVaccineNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>  residualVaccineNum(String search) {
		Map<String, Object> result =new HashMap<>();
		try {
			Integer num;
			Map<String, Object> condition = new HashMap<>();
			//非空时搜索
			if(search != null){
				condition.put("searchName","%"+ search +"%");
			}else{
				condition.put("searchName","%%");
			}
			num = statisticsMapper.residualVaccineNum(condition);
			result.put("success", true);
			result.put("msg", "获取狂犬疫苗未注射疫苗统计数量成功");
			result.put("num",num);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "获取狂犬疫苗未注射疫苗统计数量失败");
		}
		return result;
	}

	//获取时间段内使用狂犬疫苗数量
	@RequestMapping(value = "/rabiesUsePeriodNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>  rabiesUsePeriodNum(String search, String startDate, String endDate) {
		Map<String, Object> result =new HashMap<>();
		try {
			Integer num;
			Map<String, Object> condition = new HashMap<>();
			//非空时搜索
			if(search != null){
				condition.put("searchName","%"+ search +"%");
			}else{
				condition.put("searchName","%%");
			}
			condition.put("startDate",startDate);
			condition.put("endDate",endDate);
			num = statisticsMapper.rabiesUsePeriodNum(condition);
			result.put("success", true);
			result.put("msg", "时间段内开使用狂犬疫苗数量查询成功");
			result.put("num",num);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "时间段内使用狂犬疫苗数量查询失败");
		}
		return result;
	}

}
