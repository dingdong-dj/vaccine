package com.yan.common.user.controller;

import com.yan.common.user.mapper.SysUserMapper;
import com.yan.common.user.mapper.UserRoleRelMapper;
import com.yan.common.user.model.*;
import com.yan.core.annotation.MapperInject;
import com.yan.core.controller.BaseController;
import com.yan.core.model.MsgModel;
import com.yan.core.model.PageModel;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 名称：UserController<br>
 *
 * 描述：用户管理模块<br>
 *
 * @author >lxk<br>
 * 时间：<br>
 * 2017-09-07 15:43:05<br>
 * 版权：<br>
 * Copyright 2017 <a href="https://gitee.com/LiuSubject" target="_blank">https://gitee.com/LiuSubject</a>. All rights reserved.
 */
@Controller
@RequestMapping("/common/user")
public class UserController extends BaseController {

	@MapperInject(SysUserMapper.class)
	private SysUserMapper mapper;


	@MapperInject(SysUserMapper.class)
	private SysUserMapper mapperSysUser;

	@RequestMapping("/manage")
	public String manage() {
		return "common/user/manage";
	}

	//打开增/改用户资料页
	@RequestMapping("/addOrEditPage")
	public String addOrEditPage(String userID,Model model) {
		SysUser sysUser = new SysUser();
		if(null == userID){
			model.addAttribute("sysUser",sysUser);
			return "common/user/addOrEdit";
		}
		if(userID.equals("self")){
			//获取当前用户
			String userCode = SecurityUtils.getSubject().getPrincipals().toString();
			SysUserExample sysUserExample = new SysUserExample();
			SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
			criteriaSysUser.andUserCodeEqualTo(userCode);
			sysUser = mapperSysUser.selectByExample(sysUserExample).get(0);
		}else if(!userID.equals("")){
			SysUserExample example = new SysUserExample();
			SysUserExample.Criteria criteria = example.createCriteria();
			criteria.andUserIdEqualTo(userID);
			sysUser = mapper.selectByExample(example).get(0);

		}
		model.addAttribute("sysUser",sysUser);
		return "common/user/addOrEdit";
	}

	//用户列表
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public PageModel<SysUser> list(int offset, int limit, String search, String sort, String order) {
		//获取当前用户
		String userCode = SecurityUtils.getSubject().getPrincipals().toString();
		SysUserExample sysUserExample = new SysUserExample();
		SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
		criteriaSysUser.andUserCodeEqualTo(userCode);
		SysUser sysUser = mapperSysUser.selectByExample(sysUserExample).get(0);

		this.offsetPage(offset, limit);
		List<SysUser> list;
		//search字段不为空时进行搜索
		if(null != search && !search.equals("")){
			SysUserExample example = new SysUserExample();
			SysUserExample.Criteria criteria = example.createCriteria();
			//普通管理员只可查看自己所在医院的用户
			if(sysUser.getUserCode().equals("admin")){
				criteria.andUserNameLike("%"+search+"%");
			}else{
				criteria.andUserNameLike("%"+search+"%").andUserHospEqualTo(sysUser.getUserHosp());
			}
			list = mapper.selectByExample(example);
		}else{
			SysUserExample example = new SysUserExample();
			SysUserExample.Criteria criteria = example.createCriteria();
			//普通管理员只可查看自己所在医院的用户
			if(sysUser.getUserCode().equals("admin")){
				list = mapper.selectByExample(null);
			}else{
				criteria.andUserHospEqualTo(sysUser.getUserHosp());
				list = mapper.selectByExample(example);
			}
		}
		return this.resultPage(list);
	}

	/**
	 * 用户对应角色保存方法<br>
	 *
	 * @param userId 用户Id
	 * @param roleStr 角色列表字符串
	 * @return MsgModel 消息模型
	 */
	@RequestMapping(value = "/roleSave", method = RequestMethod.POST)
	@ResponseBody
	public MsgModel roleSave(String userId, String roleStr) {
		List<String> roleIds = Arrays.asList(roleStr.split(","));
		UserRoleRelMapper mapper = this.getMapper(UserRoleRelMapper.class);

		// 先清除历史数据
		UserRoleRelExample example = new UserRoleRelExample();
		example.createCriteria().andUserIdEqualTo(userId);
		mapper.deleteByExample(example);

		// 添加
		for (String roleId : roleIds) {
			if (!this.isNull(roleId.trim())) {
				UserRoleRel userRoleRel = new UserRoleRel();
				userRoleRel.setRelId(this.getUUID());
				userRoleRel.setUserId(userId);
				userRoleRel.setRoleId(roleId);
				mapper.insertSelective(userRoleRel);
			}
		}
		return this.resultMsg("保存成功");
	}

	//新增用户
	@RequestMapping(value = "/add", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request) throws Exception {
		try {
			Map<String, Object> result =new HashMap<>();

			String attributes = "";
			String msg = "保存用户失败，请检查！";
			boolean success = false;
			SysUser sysUser = new SysUser();
			String userHosp = request.getParameter("userHosp");
			String userDept = request.getParameter("userDept");
			String userCode = request.getParameter("userCode");
			String userPassword = request.getParameter("userPassword");
			String userName = request.getParameter("userName");
			String userType = request.getParameter("userType");
			short userValid = Short.parseShort(request.getParameter("userValid"));

			sysUser.setUserId(this.getUUID());
			sysUser.setUserHosp(userHosp);
			sysUser.setUserDept(userDept);
			sysUser.setUserCode(userCode);
			sysUser.setUserPassword(userPassword);
			sysUser.setUserName(userName);
			sysUser.setUserType(userType);
			sysUser.setUserValid(userValid);
			mapper.insert(sysUser);

			result.put("success", true);
			result.put("msg", "保存成功");
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> mapE =new HashMap<>();
			mapE.put("success",false);
			mapE.put("msg", "保存用户失败，请检查！");
			return mapE;
		}
	}

	//修改用户
	@RequestMapping(value = "/update", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request) throws Exception {
		try {
			Map<String, Object> result =new HashMap<>();

			String attributes = "";
			String msg = "编辑用户成功";
			boolean success = false;
			SysUser sysUser = new SysUser();
			String userId = request.getParameter("userId");
			String userHosp = request.getParameter("userHosp");
			String userDept = request.getParameter("userDept");
			String userCode = request.getParameter("userCode");
			String userPassword = request.getParameter("userPassword");
			String userName = request.getParameter("userName");
			String userType = request.getParameter("userType");
			short userValid = Short.parseShort(request.getParameter("userValid"));

			sysUser.setUserId(userId);
			sysUser.setUserHosp(userHosp);
			sysUser.setUserDept(userDept);
			sysUser.setUserCode(userCode);
			sysUser.setUserPassword(userPassword);
			sysUser.setUserName(userName);
			sysUser.setUserType(userType);
			sysUser.setUserValid(userValid);
			mapper.updateByPrimaryKey(sysUser);

			result.put("success", true);
			result.put("msg", "保存成功");
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> mapE =new HashMap<>();
			mapE.put("success",false);
			mapE.put("msg", "编辑用户失败");
			return mapE;
		}
	}

	//删除用户
    @RequestMapping(value = "/delete", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> delete(HttpServletRequest request) throws Exception {
        try {
            Map<String, Object> result =new HashMap<>();

            String attributes = "";
            String msg = "删除用户成功";
            boolean success = false;
            SysUserKey sysUserKey = new SysUserKey();
            String userId = request.getParameter("userId");
            String userCode = request.getParameter("userCode");
            sysUserKey.setUserId(userId);
            sysUserKey.setUserCode(userCode);
            int i = mapper.deleteByPrimaryKey(sysUserKey);
            if(0 == i){
                Map<String, Object> mapN =new HashMap<>();
                mapN.put("success",false);
                mapN.put("msg", "用户不存在");
                return mapN;
            }
            result.put("success", true);
            result.put("msg", true);
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> mapE =new HashMap<>();
            mapE.put("success",false);
            mapE.put("msg", "删除用户失败");
            return mapE;
        }
    }

	@RequestMapping("/upload")
	@ResponseBody
	public String upload(HttpServletRequest request) {
		List<String> fileNames = this.fileUpLoad(request);
		System.out.println(fileNames);
		return "success";
	}

}
