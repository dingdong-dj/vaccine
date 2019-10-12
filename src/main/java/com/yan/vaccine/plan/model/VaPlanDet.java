package com.yan.vaccine.plan.model;

import java.io.Serializable;

public class VaPlanDet extends VaPlanDetKey implements Serializable {
    
    private String vaName;

    private String planDt;

    private String execDt;

    private String batchNo;

    private String manufNo;

    private String manufName;

    private String vaHosp;

    private String vaHospname;

    private String vaOper;

    private String drugBarcode;

    private String vaLeft;

    private String statusFlag;

    private String feedback;

    private String remarks;

    private static final long serialVersionUID = 1L;

    
    public String getVaName() {
        return vaName;
    }

    
    public void setVaName(String vaName) {
        this.vaName = vaName == null ? null : vaName.trim();
    }

    
    public String getPlanDt() {
        return planDt;
    }

    
    public void setPlanDt(String planDt) {
        this.planDt = planDt == null ? null : planDt.trim();
    }

    
    public String getExecDt() {
        return execDt;
    }

    
    public void setExecDt(String execDt) {
        this.execDt = execDt == null ? null : execDt.trim();
    }

    
    public String getBatchNo() {
        return batchNo;
    }

    
    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo == null ? null : batchNo.trim();
    }

    
    public String getManufNo() {
        return manufNo;
    }

    
    public void setManufNo(String manufNo) {
        this.manufNo = manufNo == null ? null : manufNo.trim();
    }

    
    public String getManufName() {
        return manufName;
    }

    
    public void setManufName(String manufName) {
        this.manufName = manufName == null ? null : manufName.trim();
    }

    
    public String getVaHosp() {
        return vaHosp;
    }

    
    public void setVaHosp(String vaHosp) {
        this.vaHosp = vaHosp == null ? null : vaHosp.trim();
    }

    
    public String getVaHospname() {
        return vaHospname;
    }

    
    public void setVaHospname(String vaHospname) {
        this.vaHospname = vaHospname == null ? null : vaHospname.trim();
    }

    
    public String getVaOper() {
        return vaOper;
    }

    
    public void setVaOper(String vaOper) {
        this.vaOper = vaOper == null ? null : vaOper.trim();
    }

    
    public String getDrugBarcode() {
        return drugBarcode;
    }

    
    public void setDrugBarcode(String drugBarcode) {
        this.drugBarcode = drugBarcode == null ? null : drugBarcode.trim();
    }

    
    public String getVaLeft() {
        return vaLeft;
    }

    
    public void setVaLeft(String vaLeft) {
        this.vaLeft = vaLeft == null ? null : vaLeft.trim();
    }

    
    public String getStatusFlag() {
        return statusFlag;
    }

    
    public void setStatusFlag(String statusFlag) {
        this.statusFlag = statusFlag == null ? null : statusFlag.trim();
    }

    
    public String getFeedback() {
        return feedback;
    }

    
    public void setFeedback(String feedback) {
        this.feedback = feedback == null ? null : feedback.trim();
    }

    
    public String getRemarks() {
        return remarks;
    }

    
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", vaName=").append(vaName);
        sb.append(", planDt=").append(planDt);
        sb.append(", execDt=").append(execDt);
        sb.append(", batchNo=").append(batchNo);
        sb.append(", manufNo=").append(manufNo);
        sb.append(", manufName=").append(manufName);
        sb.append(", vaHosp=").append(vaHosp);
        sb.append(", vaHospname=").append(vaHospname);
        sb.append(", vaOper=").append(vaOper);
        sb.append(", drugBarcode=").append(drugBarcode);
        sb.append(", vaLeft=").append(vaLeft);
        sb.append(", statusFlag=").append(statusFlag);
        sb.append(", feedback=").append(feedback);
        sb.append(", remarks=").append(remarks);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}