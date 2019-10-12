package com.yan.vaccine.plan.controller;

import com.yan.common.user.mapper.SysUserMapper;
import com.yan.common.user.model.SysUser;
import com.yan.common.user.model.SysUserExample;
import com.yan.core.annotation.MapperInject;
import com.yan.core.controller.BaseController;
import com.yan.core.model.PageModel;
import com.yan.vaccine.common.mapper.SysEnumMapper;
import com.yan.vaccine.plan.mapper.VaPlanDetMapper;
import com.yan.vaccine.plan.model.VaPlanDet;
import com.yan.vaccine.plan.model.VaPlanDetExample;
import com.yan.vaccine.register.mapper.UnionMapper;
import com.yan.vaccine.register.mapper.VaBookingMapper;
import com.yan.vaccine.register.mapper.VaHdcvMstMapper;
import com.yan.vaccine.register.mapper.VaTypeMapper;
import com.yan.vaccine.register.model.UnionVaVp;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("/vaccine/plan")
public class PlanController extends BaseController {

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

	//打开接种计划列表页
	@RequestMapping("/init")
	public String init() {
		return "vaccine/plan/manage2D";
	}

	//打开施治记录列表页
	@RequestMapping("/init2N")
	public String init2N() {
		return "vaccine/plan/manage2N";
	}

	//打开施治记录列表页
	@RequestMapping("/init2A")
	public String init2A() {
		return "vaccine/plan/manage2A";
	}


	//获取免疫接种计划列表数据
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<UnionVaVp> list(int offset, int limit, String search, String sort, String order) {
		this.offsetPage(offset, limit);
		List<UnionVaVp> listU;
		Map<String, Object> condition = new HashMap<>();
		//非空时搜索
		if(search != null){
			condition.put("searchName","%"+ search +"%");
		}else{
			condition.put("searchName","%%");
		}
		listU = unionMapper.searchUnionvavpOrderByBdt(condition);
		return this.resultPage(listU);
	}

	//获取免疫接种计划列表数据(仅查看当前用户相关数据)
	@RequestMapping(value = "/list2N", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<UnionVaVp> list2N(int offset, int limit, String search, String sort, String order) {
		//获取当前用户
		String userCode = SecurityUtils.getSubject().getPrincipals().toString();
		SysUserExample sysUserExample = new SysUserExample();
		SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
		criteriaSysUser.andUserCodeEqualTo(userCode);
		SysUser sysUser = sysUserMapper.selectByExample(sysUserExample).get(0);
		this.offsetPage(offset, limit);
		List<UnionVaVp> listU;
		Map<String, Object> condition = new HashMap<>();
		//非空时搜索
		if(search != null){
			condition.put("searchName","%"+ search +"%");
		}else{
			condition.put("searchName","%%");
		}
		condition.put("execName",sysUser.getUserName());
		listU = unionMapper.searchUnionvavpOrderByEdt(condition);
		return this.resultPage(listU);
	}

	//获取免疫接种计划列表数据(查看所有相关数据)
	@RequestMapping(value = "/list2A", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<UnionVaVp> list2A(int offset, int limit, String search, String sort, String order) {
		this.offsetPage(offset, limit);
		List<UnionVaVp> listU;
		Map<String, Object> condition = new HashMap<>();
		//非空时搜索
		if(search != null){
			condition.put("searchName","%"+ search +"%");
		}else{
			condition.put("searchName","%%");
		}
		listU = unionMapper.searchUnionvavpOrderByEdt(condition);
		return this.resultPage(listU);
	}

	//获取指定疫苗登记记录关联接种计划
	@RequestMapping(value = "/getSpecial", method = RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> getSpecial(String sysno) {
		List<VaPlanDet> list;
		//sysno字段不为空时进行搜索
		if(null != sysno && !sysno.equals("")){
			try {
				VaPlanDetExample example = new VaPlanDetExample();
				VaPlanDetExample.Criteria criteria = example.createCriteria();
				criteria.andSysnoEqualTo(sysno);
				list = vaPlanDetMapper.selectByExample(example);
			} catch (Exception e) {
				e.printStackTrace();
				Map<String, Object> result =new HashMap<>();
				result.put("success",false);
				result.put("msg","获取指定疫苗登记记录关联接种计划失败");
				return result;
			}
		}else{
			list = null;
		}
		Map<String, Object> result =new HashMap<>();
		result.put("success",true);
		result.put("msg","获取指定疫苗登记记录关联接种计划成功");
		result.put("planList",list);
		return result;
	}

}
