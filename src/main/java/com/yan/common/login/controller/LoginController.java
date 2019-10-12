package com.yan.common.login.controller;

import com.yan.common.login.model.LoginModel;
import com.yan.common.login.model.LoginUser;
import com.yan.common.user.mapper.SysUserMapper;
import com.yan.common.user.model.SysUser;
import com.yan.common.user.model.SysUserExample;
import com.yan.core.annotation.MapperInject;
import com.yan.core.controller.BaseController;
import com.yan.core.persistence.DelegateMapper;
import com.yan.vaccine.hosp.mapper.VaHospMapper;
import com.yan.vaccine.hosp.model.VaHosp;
import com.yan.vaccine.hosp.model.VaHospExample;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 名称：LoginController<br>
 *
 * 描述：登录模块<br>
 *
 * @author >lxk<br>
 * 时间：<br>
 * 2017-08-22 12:52:52<br>
 * 版权：<br>
 * Copyright 2017 <a href="https://gitee.com/LiuSubject" target="_blank">https://gitee.com/LiuSubject</a>. All rights reserved.
 */
@Controller
@RequestMapping("/common/login")
public class LoginController extends BaseController {
	
	@MapperInject
	private DelegateMapper delegateMapper;

	@MapperInject(VaHospMapper.class)
	private VaHospMapper vaHospMapper;

	@MapperInject(SysUserMapper.class)
	private SysUserMapper sysUserMapper;
	
	/**
	 * 登录方法<br>
	 *
	 * @param username 用户名
	 * @param password 密码
	 * @param remember 是否记住密码（写入cookie）
	 * @return LoginModel 登录模型
	 */
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	@ResponseBody
	public LoginModel signin(String username, String password, boolean remember) {
		
		Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userCode", username);
        paramMap.put("userPassword", password);
        
        LoginUser loginUser = delegateMapper.selectOne("com.yan.common.login.mapper.LoginCustomMapper.getLoginUser", paramMap);
        
        if(this.isNull(loginUser))
        	return new LoginModel(0, "用户名、密码不正确！");
        
        if(Boolean.FALSE.equals(loginUser.getUserValid()))
			return new LoginModel(0, "该用户已失效！");
        
        List<Map<String, Object>> userRoles = delegateMapper.selectList("com.yan.common.login.mapper.LoginCustomMapper.getUserRoles", loginUser.getUserId());
        if(!this.isNull(userRoles))
        	loginUser.setUserRoles(userRoles);
        
        
        System.out.println("Lxk -> Log 输出：" + loginUser);
        		
		try{
			Subject subject = SecurityUtils.getSubject();
			if(!subject.isAuthenticated()) { // 当前用户是否已通过身份验证
				UsernamePasswordToken token = new UsernamePasswordToken(username, password, remember);
	            // 使用 shiro 来验证
	            subject.login(token);//验证角色和权限
	            this.getSession().setAttribute("user", loginUser);
			}

			//获取用户所属医院
			String userCode = SecurityUtils.getSubject().getPrincipals().toString();
			SysUserExample sysUserExample = new SysUserExample();
			SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
			criteriaSysUser.andUserCodeEqualTo(userCode);
			SysUser sysUser = sysUserMapper.selectByExample(sysUserExample).get(0);

			VaHospExample vaHospExample = new VaHospExample();
			VaHospExample.Criteria criteria = vaHospExample.createCriteria();
			criteria.andHospNoEqualTo(sysUser.getUserHosp());
			VaHosp vaHosp = vaHospMapper.selectByExample(vaHospExample).get(0);
			this.getSession().setAttribute("vaHosp", vaHosp);

			return new LoginModel(1, "/", remember);
        }catch(AuthenticationException e){
        	e.printStackTrace();
        	return new LoginModel(0, "登录失败，未知异常！");
        }
	}

	/**
	 * 退出登录（注销方法）<br>
	 *
	 * @return String 重定向登录页面
	 */
	@RequestMapping("/signout")
	public String signout() {
		Subject subject = SecurityUtils.getSubject();
        subject.logout();
        //this.getSession().invalidate();
		return "redirect:/login";
	}

}
