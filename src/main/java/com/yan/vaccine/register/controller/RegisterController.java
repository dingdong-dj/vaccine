package com.yan.vaccine.register.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yan.common.user.mapper.SysUserMapper;
import com.yan.common.user.model.SysUser;
import com.yan.common.user.model.SysUserExample;
import com.yan.core.annotation.MapperInject;
import com.yan.core.controller.BaseController;
import com.yan.core.model.PageModel;
import com.yan.vaccine.common.mapper.SysEnumMapper;
import com.yan.vaccine.common.model.SysEnum;
import com.yan.vaccine.common.model.SysEnumExample;
import com.yan.vaccine.hosp.mapper.VaHospMapper;
import com.yan.vaccine.hosp.model.VaHosp;
import com.yan.vaccine.plan.mapper.VaPlanDetMapper;
import com.yan.vaccine.plan.model.VaPlanDet;
import com.yan.vaccine.plan.model.VaPlanDetExample;
import com.yan.vaccine.register.mapper.UnionMapper;
import com.yan.vaccine.register.mapper.VaBookingMapper;
import com.yan.vaccine.register.mapper.VaHdcvMstMapper;
import com.yan.vaccine.register.mapper.VaTypeMapper;
import com.yan.vaccine.register.model.*;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.NoTransactionException;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
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
@RequestMapping("/vaccine/register")
public class RegisterController extends BaseController {

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

    @MapperInject(VaHospMapper.class)
    private VaHospMapper vaHospMapper;

    @MapperInject(UnionMapper.class)
    private UnionMapper unionMapper;

    // 犬伤编号起始
    private static int VANO = 898983;

    //打开疫苗登记记录列表页（医生）
    @RequestMapping("/init")
    public String init() {
        return "vaccine/register/manage2D";
    }


    @RequestMapping("/init2N")
    public String init2N() {
        return "vaccine/register/manage2N";
    }

    @RequestMapping("/init2A")
    public String init2A() {
        return "vaccine/register/manage2A";
    }

    @RequestMapping("/init2P")
    public String init2P() {
        return "vaccine/register/manage2P";
    }


    @RequestMapping("/printVaVpHdForm")
    public String printForm(String sysno, Model model) {
        List<UnionVaVpHd> listVaVpHd;
        Map<String, Object> condition = new HashMap<>();
        //非空时搜索
        if (sysno != null) {
            condition.put("sysno", sysno);
        } else {
            return "vaccine/printForm/print";
        }
        try {
            listVaVpHd = unionMapper.searchUnionVaVpHdBySysno(condition);
            //生成每日针次(合并同日疫苗)
            List<Integer> times4Day = timesVaVpHd4Day(listVaVpHd);
            if (times4Day.size() > 0) {
                model.addAttribute("times4Day", times4Day);
            }
            //仅注射蛋白
            if (listVaVpHd.size() == 0) {
                listVaVpHd = unionMapper.searchUnionVaHdBySysno(condition);
            }
            // 去重(合并同日疫苗)
            List<UnionVaVpHd> listVaVpHdNo2 = new ArrayList<>();
            listVaVpHd.stream().forEach(
                    vvh -> {
                        if (!listVaVpHdNo2.contains(vvh)) {
                            listVaVpHdNo2.add(vvh);
                        }
                    }
            );

            for (int i = 0; i < listVaVpHdNo2.size(); i++) {
                UnionVaVpHd uvvh = listVaVpHdNo2.get(i);
                model.addAttribute("uvvh" + i, uvvh);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "vaccine/printForm/printVaVpHdForm";
    }

    //狂犬疫苗每日针次计算
    public List<Integer> timesVaVpHd4Day(List<UnionVaVpHd> listVaVpHd) {
        List<Integer> times4VaVpHdDay = new ArrayList<>();
        for (int i = 0; i < listVaVpHd.size(); ) {
            int times = 1;
            for (int j = i + 1; j < listVaVpHd.size(); j++) {
                if (listVaVpHd.get(i).equals(listVaVpHd.get(j))) {
                    times++;
                    i++;
                }
            }
            times4VaVpHdDay.add(times);
            i++;
        }
        return times4VaVpHdDay;
    }


    //打开增/改疫苗登记记录页
    @RequestMapping("/addOrEditPage")
    public String addOrEditPage(String sysno, Model model) {
        //获取当前用户
        String userCode = SecurityUtils.getSubject().getPrincipals().toString();
        SysUserExample sysUserExample = new SysUserExample();
        SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
        criteriaSysUser.andUserCodeEqualTo(userCode);
        SysUser sysUser = sysUserMapper.selectByExample(sysUserExample).get(0);

        VaBooking vaBooking = new VaBooking();
        if (null != sysno && !sysno.equals("")) {
            vaBooking = vaBookingMapper.selectByPrimaryKey(sysno);
        } else {
        }

        model.addAttribute("vaBooking", vaBooking);
        model.addAttribute("sysUser", sysUser);
        return "vaccine/register/addOrEdit";
    }

    //打开增/改疫苗登记记录页(接种计划列限制修改页)
    @RequestMapping("/addOrEditPage2N")
    public String addOrEditPage2N(String sysno, Model model) {
        //获取当前用户
        String userCode = SecurityUtils.getSubject().getPrincipals().toString();
        SysUserExample sysUserExample = new SysUserExample();
        SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
        criteriaSysUser.andUserCodeEqualTo(userCode);
        SysUser sysUser = sysUserMapper.selectByExample(sysUserExample).get(0);

        VaBooking vaBooking = new VaBooking();
        if (null != sysno && !sysno.equals("")) {
            vaBooking = vaBookingMapper.selectByPrimaryKey(sysno);
        } else {
        }
        model.addAttribute("vaBooking", vaBooking);
        model.addAttribute("sysUser", sysUser);
        return "vaccine/register/addOrEdit2N";
    }

    //打开增/改疫苗登记记录页（接种计划无限制修改页）
    @RequestMapping("/addOrEditPage2A")
    public String addOrEditPage2A(String sysno, Model model) {
        //获取当前用户
        String userCode = SecurityUtils.getSubject().getPrincipals().toString();
        SysUserExample sysUserExample = new SysUserExample();
        SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
        criteriaSysUser.andUserCodeEqualTo(userCode);
        SysUser sysUser = sysUserMapper.selectByExample(sysUserExample).get(0);

        VaBooking vaBooking = new VaBooking();
        if (null != sysno && !sysno.equals("")) {
            vaBooking = vaBookingMapper.selectByPrimaryKey(sysno);
        } else {
        }
        model.addAttribute("vaBooking", vaBooking);
        model.addAttribute("sysUser", sysUser);
        return "vaccine/register/addOrEdit2A";
    }

    //打开增/改疫苗登记记录页(导医台)
    @RequestMapping("/addOrEditPage2P")
    public String addOrEditPage2P(String sysno, Model model) {
        //获取当前用户
        String userCode = SecurityUtils.getSubject().getPrincipals().toString();
        SysUserExample sysUserExample = new SysUserExample();
        SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
        criteriaSysUser.andUserCodeEqualTo(userCode);
        SysUser sysUser = sysUserMapper.selectByExample(sysUserExample).get(0);

        VaBooking vaBooking = new VaBooking();
        if (null != sysno && !sysno.equals("")) {
            vaBooking = vaBookingMapper.selectByPrimaryKey(sysno);
        } else {
        }
        model.addAttribute("vaBooking", vaBooking);
        model.addAttribute("sysUser", sysUser);
        return "vaccine/register/addOrEdit2P";
    }

    //获取疫苗登记记录(医生)
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public PageModel<VaBooking> list(int offset, int limit, String search, String sort, String order) {
        //获取当前用户
        String userCode = SecurityUtils.getSubject().getPrincipals().toString();
        SysUserExample sysUserExample = new SysUserExample();
        SysUserExample.Criteria criteriaSysUser = sysUserExample.createCriteria();
        criteriaSysUser.andUserCodeEqualTo(userCode);
        SysUser sysUser = sysUserMapper.selectByExample(sysUserExample).get(0);

        //只获取当前用户登记过的患者记录
        //PageHelper.offsetPage方法重要提示
        //只有紧跟在offsetPage方法后的第一个Mybatis的查询（Select）方法会被分页。
        this.offsetPage(offset, limit);
        this.orderby("book_dt desc");
        List<VaBooking> list;
        VaBookingExample example = new VaBookingExample();
        VaBookingExample.Criteria criteria = example.createCriteria();
        criteria.andVaDocEqualTo(sysUser.getUserName());
        //search字段不为空时进行搜索
        if (null != search && !search.equals("")) {
            criteria.andPatNameLike("%" + search + "%");
            list = vaBookingMapper.selectByExample(example);
        } else {
            list = vaBookingMapper.selectByExample(example);
        }
        return this.resultPage(list);
    }

    //获取疫苗登记记录(护士)
    @RequestMapping(value = "/list2N", method = RequestMethod.POST)
    @ResponseBody
    public PageModel<VaBooking> list2N(int offset, int limit, String search, String sort, String order) {
        //PageHelper.offsetPage方法重要提示
        //只有紧跟在offsetPage方法后的第一个Mybatis的查询（Select）方法会被分页。
        this.offsetPage(offset, limit);
        this.orderby("book_dt desc");
        List<VaBooking> list;
        VaBookingExample example = new VaBookingExample();
        VaBookingExample.Criteria criteria = example.createCriteria();
        //search字段不为空时进行搜索
        if (null != search && !search.equals("")) {
            criteria.andPatNameLike("%" + search + "%");
            list = vaBookingMapper.selectByExample(example);
        } else {
            list = vaBookingMapper.selectByExample(null);
        }
        return this.resultPage(list);
    }

    //增/改疫苗登记记录
    @RequestMapping(value = "/createOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Map<String, Object> createOrUpdate(HttpServletRequest request) throws Exception {
        try {
            Map<String, Object> result = new HashMap<>();
            VaBooking vaBooking = new VaBooking();
            String sysno = null;
            try {
                sysno = request.getParameter("sysno");
            } catch (Exception e) {
                e.printStackTrace();
                Map<String, Object> mapE = new HashMap<>();
                mapE.put("success", false);
                mapE.put("msg", "无主键，请确认！");
                return mapE;
            }
            String bookDt = request.getParameter("bookDt");
            String cardNo = request.getParameter("cardNo");
            String cardInno = request.getParameter("cardInno");
            String blhNo = request.getParameter("blhNo");
            String patName = request.getParameter("patName");
            String patSex = request.getParameter("patSex");
            String patAge = request.getParameter("patAge");
            String patOccu = request.getParameter("patOccu");
            String patAdd = request.getParameter("patAdd");
            String patTel = request.getParameter("patTel");
            String vaCode = request.getParameter("vaCode");
            String vaDoc = request.getParameter("vaDoc");
            String hospNo = request.getParameter("hospNo");
            vaBooking.setBlhNo(blhNo);
            vaBooking.setBookDt(bookDt);
            vaBooking.setCardInno(cardInno);
            vaBooking.setCardNo(cardNo);
            vaBooking.setHospNo(hospNo);
            vaBooking.setPatAdd(patAdd);
            vaBooking.setPatAge(patAge);
            vaBooking.setPatName(patName);
            vaBooking.setPatOccu(patOccu);
            vaBooking.setPatSex(patSex);
            vaBooking.setPatTel(patTel);
            vaBooking.setVaCode(vaCode);
            vaBooking.setVaDoc(vaDoc);

            if (null != sysno && !sysno.equals("")) {
                vaBooking.setSysno(sysno);
                vaBookingMapper.deleteByPrimaryKey(sysno);
                vaBookingMapper.insert(vaBooking);
            } else {
                vaBooking.setSysno(this.getUUID());
                vaBookingMapper.insert(vaBooking);
            }

            //保存接种计划
            String planListString = request.getParameter("planData");
            JSONArray planList = JSONArray.parseArray(planListString);
            VaPlanDetExample example = new VaPlanDetExample();
            VaPlanDetExample.Criteria criteria = example.createCriteria();
            criteria.andSysnoEqualTo(sysno).andStatusFlagEqualTo("init");
            vaPlanDetMapper.deleteByExample(example);
            for (int i = 0; i < planList.size(); i++) {
                JSONObject planLine = planList.getJSONObject(i);
                VaPlanDet vPD = JSON.parseObject(planLine.toJSONString(), VaPlanDet.class);
                if (vPD.getStatusFlag().equals("init")) {
                    vaPlanDetMapper.insert(vPD);
                } else {
                    vaPlanDetMapper.updateByPrimaryKey(vPD);
                }
            }
            result.put("success", true);
            result.put("msg", "登记主表及接种计划保存成功");
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            } catch (NoTransactionException e1) {
                e1.printStackTrace();
            }
            Map<String, Object> mapE = new HashMap<>();
            mapE.put("success", false);
            mapE.put("msg", "保存登记表及接种计划失败");
            return mapE;
        }
    }

    //更新接种计划
    @RequestMapping(value = "/updateplan", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Map<String, Object> updateplan(HttpServletRequest request) throws Exception {
        try {
            Map<String, Object> result = new HashMap<>();
            String planListString = request.getParameter("planData");
            JSONArray planList = JSONArray.parseArray(planListString);
            for (int i = 0; i < planList.size(); i++) {
                JSONObject planLine = planList.getJSONObject(i);
                VaPlanDet vPD = JSON.parseObject(planLine.toJSONString(), VaPlanDet.class);
                VaPlanDetExample example = new VaPlanDetExample();
                VaPlanDetExample.Criteria criteria = example.createCriteria();
                criteria.andSysnoEqualTo(vPD.getSysno()).andLineNoEqualTo(vPD.getLineNo());
                vaPlanDetMapper.updateByExample(vPD, example);
            }
            result.put("success", true);
            result.put("msg", "保存接种计划成功");
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            } catch (NoTransactionException e1) {
                e1.printStackTrace();
            }
            Map<String, Object> mapE = new HashMap<>();
            mapE.put("success", false);
            mapE.put("msg", "保存接种计划失败");
            return mapE;
        }
    }

    //删除用户
    @RequestMapping(value = "/delete", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> delete(HttpServletRequest request) throws Exception {
        try {
            Map<String, Object> result = new HashMap<>();

            String attributes = "";
            String msg = "删除登记记录成功";
            boolean success = false;
            String sysno = request.getParameter("sysno");
            int i = vaBookingMapper.deleteByPrimaryKey(sysno);
            try {
                vaHdcvMstMapper.deleteByPrimaryKey(sysno);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (0 == i) {
                Map<String, Object> mapN = new HashMap<>();
                mapN.put("success", false);
                mapN.put("msg", "登记记录不存在");
                return mapN;
            }
            result.put("success", true);
            result.put("msg", msg);
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> mapE = new HashMap<>();
            mapE.put("success", false);
            mapE.put("msg", "删除用户失败");
            return mapE;
        }
    }

    //登记主表确认
    @RequestMapping(value = "/registerConfirm", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> registerConfirm(HttpServletRequest request) throws Exception {
        try {
            Map<String, Object> result = new HashMap<>();
            String sysno = request.getParameter("sysno");
            VaBooking vaBooking = vaBookingMapper.selectByPrimaryKey(sysno);
            if (null == vaBooking) {
                Map<String, Object> mapN = new HashMap<>();
                mapN.put("success", false);
                mapN.put("msg", "登记主表不存在，请先保存登记主表");
                return mapN;
            }
            result.put("success", true);
            result.put("msg", "登记主表存在");
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> mapE = new HashMap<>();
            mapE.put("success", false);
            mapE.put("msg", "查询登记主表失败");
            return mapE;
        }
    }

    //获取疫苗种类
    @RequestMapping(value = "/getVaCode")
    @ResponseBody
    public Map<String, Object> getVaCode() {
        try {
            List<VaType> list = vaTyvpeMapper.selectByExample(null);
            Map<String, Object> result = new HashMap<>();
            result.put("msg", "获取疫苗列表成功");
            result.put("success", true);
            result.put("vaCodeTypeList", list);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> mapE = new HashMap<>();
            mapE.put("msg", "获取疫苗列表失败");
            mapE.put("success", false);
            return mapE;
        }
    }

    //打开增/改狂犬疫苗登记记录页
    @RequestMapping("/secondaryAddOrEditPage")
    public String secondaryAddOrEditPage(String sysno, Model model) {
        VaHdcvMst vaHdcvMst = new VaHdcvMst();
        if (null != sysno && !sysno.equals("")) {
            try {
                vaHdcvMst = vaHdcvMstMapper.selectByPrimaryKey(sysno);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (null == vaHdcvMst) {
                vaHdcvMst = new VaHdcvMst();
                vaHdcvMst.setSysno(sysno);
                int nowHave = (int) vaHdcvMstMapper.countByExample(null);
                int nowNo = VANO + nowHave;
                vaHdcvMst.setVaSysno(String.valueOf(nowNo));
            }
        }
        model.addAttribute("vaHdcvMst", vaHdcvMst);
        return "vaccine/register/secondaryAddOrEdit";
    }

    //打开狂犬疫苗登记记录页
    @RequestMapping("/secondaryAddOrEditPage2N")
    public String secondaryAddOrEditPage2N(String sysno, Model model) {
        VaHdcvMst vaHdcvMst = new VaHdcvMst();
        if (null != sysno && !sysno.equals("")) {
            try {
                vaHdcvMst = vaHdcvMstMapper.selectByPrimaryKey(sysno);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (null == vaHdcvMst) {
                vaHdcvMst = new VaHdcvMst();
                vaHdcvMst.setSysno(sysno);
            }
        }
        model.addAttribute("vaHdcvMst", vaHdcvMst);
        return "vaccine/register/secondaryAddOrEdit2N";
    }

    //增/改狂犬疫苗登记记录
    @RequestMapping(value = "/secondaryCreateOrEdit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> secondaryCreateOrEdit(HttpServletRequest request) throws Exception {
        try {
            Map<String, Object> result = new HashMap<>();
            VaHdcvMst vaHdcvMst = new VaHdcvMst();
            String sysno = request.getParameter("sysno");
            VaBooking vb = vaBookingMapper.selectByPrimaryKey(sysno);
            if (vb == null) {
                Map<String, Object> mapE = new HashMap<>();
                mapE.put("success", false);
                mapE.put("msg", "无相关联的登记主表，请确认！");
                return mapE;
            }
            String hdcvDt = request.getParameter("hdcvDt");
            String hdcvAdd = request.getParameter("hdcvAdd");
            String dogType = request.getParameter("dogType");
            String expose = request.getParameter("expose");
            String cutPart = request.getParameter("cutPart");
            String cutNo = request.getParameter("cutNo");
            String cutDeal = request.getParameter("cutDeal");
            String hospNo = request.getParameter("hospNo");
            String remarks = request.getParameter("remarks");
            String patWeight = request.getParameter("patWeight");
            String vaProtein = request.getParameter("vaProtein");
            String vaHistory = request.getParameter("vaHistory");
            String vaOffsite = request.getParameter("vaOffsite");
            String vaSysno = request.getParameter("vaSysno");
            String vaProteinNo = request.getParameter("vaProteinNo");
            String vaProteinPart = request.getParameter("vaProteinPart");
            String vaProteinFac = request.getParameter("vaProteinFac");

            vaHdcvMst.setSysno(sysno);
            vaHdcvMst.setHdcvDt(hdcvDt);
            vaHdcvMst.setHdcvAdd(hdcvAdd);
            vaHdcvMst.setDogType(dogType);
            vaHdcvMst.setExpose(expose);
            vaHdcvMst.setCutPart(cutPart);
            vaHdcvMst.setCutNo(cutNo);
            vaHdcvMst.setCutDeal(cutDeal);
            vaHdcvMst.setHospNo(hospNo);
            vaHdcvMst.setRemarks(remarks);
            vaHdcvMst.setPatWeight(patWeight);
            vaHdcvMst.setVaProtein(vaProtein);
            vaHdcvMst.setVaHistory(vaHistory);
            vaHdcvMst.setVaOffsite(vaOffsite);
            vaHdcvMst.setVaSysno(vaSysno);
            vaHdcvMst.setVaProteinNo(vaProteinNo);
            vaHdcvMst.setVaProteinPart(vaProteinPart);
            if(vaProtein != null && !("").equals(vaProtein) && !("0").equals(vaProtein) ){
                if(vaProteinFac == null || ("").equals(vaProteinFac)){
                    vaHdcvMst.setVaProteinFac("广东双林");//以后如果蛋白厂商修改的话只需要修改这边就行了 写死修改
                }else{
                    vaHdcvMst.setVaProteinFac(vaProteinFac);
                }
            }
            vaHdcvMstMapper.deleteByPrimaryKey(sysno);
            vaHdcvMstMapper.insert(vaHdcvMst);
            result.put("success", true);
            result.put("msg", "保存狂犬疫苗登记记录成功，请检查！");
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> mapE = new HashMap<>();
            mapE.put("msg", "保存狂犬疫苗登记记录失败，请检查！");
            mapE.put("success", false);
            return mapE;
        }
    }
    //删除狂犬疫苗登记记录

    @RequestMapping(value = "/secondaryDelete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> secondaryDelete(HttpServletRequest request) throws Exception {
        try {
            Map<String, Object> result = new HashMap<>();
            String sysno = request.getParameter("sysno");
            vaHdcvMstMapper.deleteByPrimaryKey(sysno);
            result.put("success", true);
            result.put("msg", "删除狂犬疫苗登记记录成功，请检查！");
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> mapE = new HashMap<>();
            mapE.put("msg", "删除狂犬疫苗登记记录失败，请检查！");
            mapE.put("success", false);
            return mapE;
        }
    }


    //字典获取
    @RequestMapping(value = "/getEnum")
    @ResponseBody
    public Map<String, Object> getEnum(String type) {
        try {
            SysEnumExample example = new SysEnumExample();
            SysEnumExample.Criteria criteria = example.createCriteria();
            criteria.andEtypeEqualTo(type).andUseFlagEqualTo("Y");
            List<SysEnum> list = sysEnumMapper.selectByExample(example);
            Map<String, Object> result = new HashMap<>();
            result.put("msg", "字典获取成功");
            result.put("success", true);
            result.put("enumList", list);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> result = new HashMap<>();
            result.put("msg", "字典获取失败");
            result.put("success", false);
            return result;
        }
    }

    //字典获取(需排序)
    @RequestMapping(value = "/getEnumS")
    @ResponseBody
    public Map<String, Object> getEnumS(String type, String descK, String sortK) {
        try {
            String sortS = descK + " " + sortK;
            SysEnumExample example = new SysEnumExample();
            SysEnumExample.Criteria criteria = example.createCriteria();
            criteria.andEtypeEqualTo(type).andUseFlagEqualTo("Y");
            example.setOrderByClause(sortS);
            List<SysEnum> list = sysEnumMapper.selectByExample(example);
            Map<String, Object> result = new HashMap<>();
            result.put("msg", "字典获取成功");
            result.put("success", true);
            result.put("enumList", list);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> result = new HashMap<>();
            result.put("msg", "字典获取失败");
            result.put("success", false);
            return result;
        }
    }

    //字典获取
    @RequestMapping(value = "/getHospList")
    @ResponseBody
    public Map<String, Object> getHospList() {
        try {
            List<VaHosp> list = vaHospMapper.selectByExample(null);
            Map<String, Object> result = new HashMap<>();
            result.put("msg", "医院字典获取成功");
            result.put("success", true);
            result.put("hospList", list);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> result = new HashMap<>();
            result.put("msg", "字典获取失败");
            result.put("success", false);
            return result;
        }
    }
}
