package com.yan.common.timeTask;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.kevinsawicki.http.HttpRequest;
import com.yan.core.annotation.MapperInject;
import com.yan.vaccine.plan.mapper.VaPlanDetMapper;
import com.yan.vaccine.plan.model.VaPlanDet;
import com.yan.vaccine.plan.model.VaPlanDetExample;
import com.yan.vaccine.register.mapper.VaBookingMapper;
import com.yan.vaccine.register.model.VaBooking;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目名称：yan-demo
 * 类名称：SendCardNo
 * 类描述：定时发送当日需接种患者信息
 * 创建人：lxk
 * 创建时间：2018-09-28 10:39
 * 修改人：
 * 修改时间：
 * 修改备注：
 **/
@Component
public class SendCardNo {


    @MapperInject(VaPlanDetMapper.class)
    private VaPlanDetMapper vaPlanDetMapper;

    @MapperInject(VaBookingMapper.class)
    private VaBookingMapper vaBookingMapper;

    public boolean sendSingle = false;

    //移动平台服务地址
    public String MobileServiceURL = "http://localhost:8080/exInterface/receiveCardList";

    @Bean
    public TaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
        taskScheduler.setPoolSize(50);
        return taskScheduler;
    }


    //第一次尝试（8:00）
    @Scheduled(cron = "0 0 8 * * ?")
    public void SendCardNo() throws Exception {
        try {
            //生成起始时间
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime ldt4T = LocalDateTime.now();
            LocalDateTime ldt4B = ldt4T.plusDays(1);
            //当天提醒
            String Date4T = ldt4T.format(dtf);
            //前一日提醒
            String Date4B = ldt4B.format(dtf);

            //查询每日及前一日
            List<VaPlanDet> listP;
            VaPlanDetExample example = new VaPlanDetExample();
            VaPlanDetExample.Criteria criteria4T = example.createCriteria();
            criteria4T.andPlanDtEqualTo(Date4T).andStatusFlagEqualTo("init");
            VaPlanDetExample.Criteria criteria4B = example.createCriteria();
            criteria4B.andPlanDtEqualTo(Date4B).andStatusFlagEqualTo("init");
            example.or(criteria4B);
            listP = vaPlanDetMapper.selectByExample(example);

            //封装信息对象
            JSONArray ja = new JSONArray();
            for (int i = 0; i < listP.size(); i++) {
                VaPlanDet vp = listP.get(i);
                VaBooking vb = vaBookingMapper.selectByPrimaryKey(vp.getSysno());
                String vaName = "";
                switch (vb.getVaCode()) {
                    case "fy":
                        vaName = "肺炎疫苗";
                        break;
                    case "hdcv":
                        vaName = "狂犬疫苗";
                        break;
                    case "hpv":
                        vaName = "宫颈疫苗";
                        break;
                    case "lg":
                        vaName = "流感疫苗";
                        break;
                    case "yg":
                        vaName = "乙肝疫苗";
                        break;
                    default:
                        break;
                }
                JSONObject jo = new JSONObject();
                jo.put("CN", vb.getCardNo());
                jo.put("VN", vaName);
                jo.put("DATE",vp.getPlanDt());
                ja.add(jo);
            }
            //发送请求
            Map<String, Object> data = new HashMap<>();
            data.put("dataList", JSON.toJSONString(ja));
            HttpRequest httpRequest = HttpRequest.post(MobileServiceURL, null, Boolean.TRUE).form(data);
            String result = httpRequest.body().toString();
            JSONObject jResultTrue = returnProcessing(result);
            if (jResultTrue.getBooleanValue("success")) {
                System.out.println(ldt4T.toString());
                System.out.println("第一次，需接种患者数据发送成功");
                //标记成功
                sendSingle = true;
            } else {
                System.out.println(ldt4T.toString());
                System.out.println("第一次，需接种患者数据发送失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            String curName = Thread.currentThread().getName();
            System.out.println("当前时间:" + LocalDateTime.now() + "  任务1对应的线程名: " + curName);
            System.out.println("异常");
            System.out.println("第一次，需接种患者数据发送失败");
        }
    }

    //第二次尝试（8:10）
    @Scheduled(cron = "0 10 8 * * ?")
    public void SendCardNo2() throws Exception {
        try {
            //判断是否已发送成功，成功则不再尝试发送
            if (sendSingle) {
                return;
            }
            //生成起始时间
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime ldt = LocalDateTime.now();
            String Date = ldt.format(dtf);

            //查询每日
            List<VaPlanDet> listP;
            VaPlanDetExample example = new VaPlanDetExample();
            VaPlanDetExample.Criteria criteria = example.createCriteria();
            criteria.andPlanDtEqualTo(Date).andStatusFlagEqualTo("init");
            listP = vaPlanDetMapper.selectByExample(example);

            //封装信息对象
            JSONArray ja = new JSONArray();
            for (int i = 0; i < listP.size(); i++) {
                VaPlanDet vp = listP.get(i);
                VaBooking vb = vaBookingMapper.selectByPrimaryKey(vp.getSysno());
                String vaName = "";
                switch (vb.getVaCode()) {
                    case "fy":
                        vaName = "肺炎疫苗";
                        break;
                    case "hdcv":
                        vaName = "狂犬疫苗";
                        break;
                    case "hpv":
                        vaName = "宫颈疫苗";
                        break;
                    case "lg":
                        vaName = "流感疫苗";
                        break;
                    case "yg":
                        vaName = "乙肝疫苗";
                        break;
                    default:
                        break;
                }
                JSONObject jo = new JSONObject();
                jo.put("CN", vb.getCardNo());
                jo.put("VN", vaName);
                ja.add(jo);
            }
            //发送请求
            Map<String, Object> data = new HashMap<>();
            data.put("dataList", JSON.toJSONString(ja));
            HttpRequest httpRequest = HttpRequest.post(MobileServiceURL, null, Boolean.TRUE).form(data);
            String result = httpRequest.body().toString();
            JSONObject jResultTrue = returnProcessing(result);
            if (jResultTrue.getBooleanValue("success")) {
                System.out.println(ldt.toString());
                System.out.println("第二次，需接种患者数据发送成功");
                //标记成功
                sendSingle = true;
            } else {
                System.out.println(ldt.toString());
                System.out.println("第二次，需接种患者数据发送失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            String curName = Thread.currentThread().getName();
            System.out.println("当前时间:" + LocalDateTime.now() + "  任务2对应的线程名: " + curName);
            System.out.println("异常");
            System.out.println("第二次，需接种患者数据发送失败");
        }
    }

    //第三尝试（8:20）
    @Scheduled(cron = "0 20 8 * * ?")
    public void SendCardNo3() throws Exception {
        try {
            //判断是否已发送成功，成功则不再尝试发送
            if (sendSingle) {
                return;
            }
            //生成起始时间
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime ldt = LocalDateTime.now();
            String Date = ldt.format(dtf);

            //查询每日接种计划
            List<VaPlanDet> listP;
            VaPlanDetExample example = new VaPlanDetExample();
            VaPlanDetExample.Criteria criteria = example.createCriteria();
            criteria.andPlanDtEqualTo(Date).andStatusFlagEqualTo("init");
            listP = vaPlanDetMapper.selectByExample(example);

            //封装信息对象
            JSONArray ja = new JSONArray();
            for (int i = 0; i < listP.size(); i++) {
                VaPlanDet vp = listP.get(i);
                VaBooking vb = vaBookingMapper.selectByPrimaryKey(vp.getSysno());
                String vaName = "";
                switch (vb.getVaCode()) {
                    case "fy":
                        vaName = "肺炎疫苗";
                        break;
                    case "hdcv":
                        vaName = "狂犬疫苗";
                        break;
                    case "hpv":
                        vaName = "宫颈疫苗";
                        break;
                    case "lg":
                        vaName = "流感疫苗";
                        break;
                    case "yg":
                        vaName = "乙肝疫苗";
                        break;
                    default:
                        break;
                }
                JSONObject jo = new JSONObject();
                jo.put("CN", vb.getCardNo());
                jo.put("VN", vaName);
                ja.add(jo);
            }
            //发送请求
            Map<String, Object> data = new HashMap<>();
            data.put("dataList", JSON.toJSONString(ja));
            HttpRequest httpRequest = HttpRequest.post(MobileServiceURL, null, Boolean.TRUE).form(data);
            String result = httpRequest.body().toString();
            JSONObject jResultTrue = returnProcessing(result);
            if (jResultTrue.getBooleanValue("success")) {
                System.out.println(ldt.toString());
                System.out.println("第三次，需接种患者数据发送成功");
            } else {
                System.out.println(ldt.toString());
                System.out.println("第三次，需接种患者数据发送失败");
            }
            //无论是否成功，发送状态初始化
            sendSingle = false;
        } catch (Exception e) {
            e.printStackTrace();
            String curName = Thread.currentThread().getName();
            System.out.println("当前时间:" + LocalDateTime.now() + "  任务3对应的线程名: " + curName);
            System.out.println("异常");
            System.out.println("第三次，需接种患者数据发送失败");
        }
    }

    //返回字串处理
    public JSONObject returnProcessing(String str) throws Exception {
        try {
            JSONObject jResultTrue = JSON.parseObject(str);
            return jResultTrue;

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

    }
}
