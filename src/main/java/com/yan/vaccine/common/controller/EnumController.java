package com.yan.vaccine.common.controller;

import com.yan.common.user.mapper.SysUserMapper;
import com.yan.core.annotation.MapperInject;
import com.yan.core.controller.BaseController;
import com.yan.core.model.PageModel;
import com.yan.vaccine.common.mapper.SysEnumMapper;
import com.yan.vaccine.common.model.SysEnum;
import com.yan.vaccine.common.model.SysEnumExample;
import com.yan.vaccine.plan.mapper.VaPlanDetMapper;
import com.yan.vaccine.register.mapper.VaBookingMapper;
import com.yan.vaccine.register.mapper.VaHdcvMstMapper;
import com.yan.vaccine.register.mapper.VaTypeMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@RequestMapping("/vaccine/enum")
public class EnumController extends BaseController {

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

	//打开字典管理列表页
	@RequestMapping("/enumPage")
	public String init() {
		return "vaccine/enum/manage";
	}

	//获取字典管理列表数据
	@RequestMapping(value = "/enumList", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<SysEnum> list(int offset, int limit, String search, String sort, String order) {
		this.offsetPage(offset, limit);
		List<SysEnum> list;
		//search字段不为空时进行搜索
		if(null != search && !search.equals("")){
			SysEnumExample example = new SysEnumExample();
			SysEnumExample.Criteria criteria = example.createCriteria();
			criteria.andEnameLike("%"+search+"%");
			list = sysEnumMapper.selectByExample(example);
		}else{
			list = sysEnumMapper.selectByExample(null);
		}
		return this.resultPage(list);
	}

	//删除字典
	@RequestMapping(value = "/delete", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request) throws Exception {
		try {
			Map<String, Object> result =new HashMap<>();

			String attributes = "";
			String msg = "删除字典记录成功";
			boolean success = false;
			String etype = request.getParameter("etype");
			String ecode = request.getParameter("ecode");
			SysEnumExample example = new SysEnumExample();
			SysEnumExample.Criteria criteria = example.createCriteria();
			criteria.andEtypeEqualTo(etype).andEcodeEqualTo(ecode);
			int i = sysEnumMapper.deleteByExample(example);
			if(0 == i){
				Map<String, Object> mapN =new HashMap<>();
				mapN.put("success",false);
				mapN.put("msg", "字典记录不存在");
				return mapN;
			}
			result.put("success", true);
			result.put("msg", msg);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> mapE =new HashMap<>();
			mapE.put("success",false);
			mapE.put("msg", "删除字典记录失败");
			return mapE;
		}
	}

	//打开增/改字典记录页
	@RequestMapping("/addOrEditPage")
	public String addOrEditPage(String etype ,String ecode, Model model) {
		SysEnum sysEnum = new SysEnum();
		try {
			SysEnumExample example = new SysEnumExample();
			SysEnumExample.Criteria criteria = example.createCriteria();
			criteria.andEtypeEqualTo(etype).andEcodeEqualTo(ecode);
			sysEnum = sysEnumMapper.selectByExample(example).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("sysEnum",sysEnum);
		return "vaccine/enum/addOrEdit";
	}

	//增/改字典记录
	@RequestMapping(value = "/createOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createOrUpdate(HttpServletRequest request) throws Exception {
		try {
			Map<String, Object> result =new HashMap<>();
			SysEnum sysEnum = new SysEnum();
			String etype = request.getParameter("etype");
			String ecode = request.getParameter("ecode");
			String ename = request.getParameter("ename");
			String useFlag = request.getParameter("useFlag");
			sysEnum.setEname(ename);
			sysEnum.setEtype(etype);
			sysEnum.setEcode(ecode);
			sysEnum.setUseFlag(useFlag);

			SysEnum find;
			SysEnumExample example = new SysEnumExample();
			SysEnumExample.Criteria criteria = example.createCriteria();
			criteria.andEtypeEqualTo(etype).andEcodeEqualTo(ecode);
			List<SysEnum> findList= sysEnumMapper.selectByExample(example);
			if(findList.size() != 0){
				sysEnumMapper.deleteByExample(example);
				sysEnumMapper.insert(sysEnum);
			}else{
				sysEnumMapper.insert(sysEnum);
			}
			result.put("success", true);
			result.put("msg", "字典记录保存成功");
			return result;

		}catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> mapE =new HashMap<>();
			mapE.put("success",false);
			mapE.put("msg","字典记录保存失败");
			return mapE;
		}
	}

}
