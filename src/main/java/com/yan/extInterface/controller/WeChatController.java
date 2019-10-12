package com.yan.extInterface.controller;

import com.yan.common.user.mapper.SysUserMapper;
import com.yan.core.annotation.MapperInject;
import com.yan.core.controller.BaseController;
import com.yan.vaccine.common.mapper.SysEnumMapper;
import com.yan.vaccine.plan.mapper.VaPlanDetMapper;
import com.yan.vaccine.plan.model.VaPlanDet;
import com.yan.vaccine.plan.model.VaPlanDetExample;
import com.yan.vaccine.register.mapper.VaBookingMapper;
import com.yan.vaccine.register.mapper.VaHdcvMstMapper;
import com.yan.vaccine.register.mapper.VaTypeMapper;
import com.yan.vaccine.register.model.VaBooking;
import com.yan.vaccine.register.model.VaBookingExample;
import com.yan.vaccine.register.model.VaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 名称：ProductController<br>
 * <p>
 * 描述：产品信息管理<br>
 *
 * @author >lxk<br>
 * 时间：<br>
 * 2017-09-06 09:13:00<br>
 * 版权：<br>
 * Copyright 2017 <a href="https://gitee.com/LiuSubject" target="_blank">https://gitee.com/LiuSubject</a>. All rights reserved.
 */
@Controller
@RequestMapping("/interface/wechat")
public class WeChatController extends BaseController {

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

    //获取疫苗登记记录（指定患者）
    @RequestMapping(value = "/getRegisterList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getRegisterList(HttpServletRequest request) throws Exception {
        List<VaBooking> list;
        List<VaType> listVa;
        try {
            String cardNo = request.getParameter("cardNo");
            VaBookingExample example = new VaBookingExample();
            VaBookingExample.Criteria criteria = example.createCriteria();
            criteria.andCardNoEqualTo(cardNo);
            list = vaBookingMapper.selectByExample(example);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> result = new HashMap<>();
            result.put("success", false);
            result.put("msg", "获取疫苗登记记录失败");
            return result;
        }

        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        if (list == null) {
            result.put("registerList", new String[0]);
        } else {
            listVa = vaTyvpeMapper.selectByExample(null);
            //将疫苗种类编码转为名称
            for (int i = 0; i < list.size(); i++) {
                int j = 0;
                VaType vt = listVa.get(j);
                VaBooking vb = list.get(i);
                String vaCode = vb.getVaCode();
                while (j < listVa.size() && !vt.getVaCode().equals(vaCode)) {
                    vt = listVa.get(j);
                    j++;
                }
                if (vt.getVaCode().equals(vaCode)) {
                    vb.setVaCode(vt.getVaName());
                }
            }
            result.put("registerList", list);
        }
        result.put("msg", "获取疫苗登记记录成功");
        return result;
    }

    //获取接种记录（指定患者）
    @RequestMapping(value = "/getVaccineList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getVaccineList(HttpServletRequest request) throws Exception {
        List<VaPlanDet> list;
        List<VaType> listVa;
        try {
            String sysno = request.getParameter("sysno");
            VaPlanDetExample example = new VaPlanDetExample();
            VaPlanDetExample.Criteria criteria = example.createCriteria();
            criteria.andSysnoEqualTo(sysno);
            list = vaPlanDetMapper.selectByExample(example);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> result = new HashMap<>();
            result.put("success", false);
            result.put("msg", "获取接种记录失败");
            return result;
        }

        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        if (list == null) {
            result.put("vaccineList", new String[0]);
        } else {
            //将疫苗种类编码转为名称
            for (int i = 0; i < list.size(); i++) {
                VaPlanDet vp = list.get(i);
                switch (vp.getStatusFlag()) {
                    case "init":
                        vp.setStatusFlag("未接种");
                        break;
                    case "done":
                        vp.setStatusFlag("已接种");
                        break;
                    case "cancel":
                        vp.setStatusFlag("终止");
                        break;
                    default:
                        break;
                }
            }
            result.put("vaccineList", list);
        }
        result.put("msg", "获取接种记录成功");
        return result;
    }

}
