package com.yan.vaccine.register.model;

import java.io.Serializable;

/**
 * 项目名称：yan-demo
 * 类名称：UnionVaVpHd
 * 类描述：
 * 创建人：lxk
 * 创建时间：2018-10-12 16:56
 * 修改人：
 * 修改时间：
 * 修改备注：
 **/
public class UnionVaVpHd implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.sysno
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String sysnoVa;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.book_dt
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String bookDt;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.card_no
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String cardNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.card_inno
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String cardInno;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.blh_no
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String blhNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.pat_name
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String patName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.pat_sex
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String patSex;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.pat_age
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String patAge;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.pat_occu
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String patOccu;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.pat_add
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String patAdd;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.pat_tel
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String patTel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.va_code
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String vaCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.va_doc
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String vaDoc;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_booking.hosp_no
     *
     * @mbg.generated Fri Aug 03 14:56:45 CST 2018
     */
    private String hospNo;

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

    private String hdcvDt;

    private String hdcvAdd;

    private String dogType;

    private String patWeight;

    private String vaProtein;

    private String expose;

    private String cutPart;

    private String cutNo;

    private String cutDeal;

    private String vaHistory;

    private String vaOffsite;

    private String vaSysno;

    private String vaProteinNo;

    private String vaProteinPart;

    public String getVaSysno() {
        return vaSysno;
    }

    public void setVaSysno(String vaSysno) {
        this.vaSysno = vaSysno;
    }

    public String getVaProteinNo() {
        return vaProteinNo;
    }

    public void setVaProteinNo(String vaProteinNo) {
        this.vaProteinNo = vaProteinNo;
    }

    public String getVaProteinPart() {
        return vaProteinPart;
    }

    public void setVaProteinPart(String vaProteinPart) {
        this.vaProteinPart = vaProteinPart;
    }

    public String getVaHistory() {
        return vaHistory;
    }

    public void setVaHistory(String vaHistory) {
        this.vaHistory = vaHistory;
    }

    public String getVaOffsite() {
        return vaOffsite;
    }

    public void setVaOffsite(String vaOffsite) {
        this.vaOffsite = vaOffsite;
    }

    public String getHdcvDt() {
        return hdcvDt;
    }

    public void setHdcvDt(String hdcvDt) {
        this.hdcvDt = hdcvDt;
    }

    public String getHdcvAdd() {
        return hdcvAdd;
    }

    public void setHdcvAdd(String hdcvAdd) {
        this.hdcvAdd = hdcvAdd;
    }

    public String getDogType() {
        return dogType;
    }

    public void setDogType(String dogType) {
        this.dogType = dogType;
    }

    public String getExpose() {
        return expose;
    }

    public void setExpose(String expose) {
        this.expose = expose;
    }

    public String getCutPart() {
        return cutPart;
    }

    public void setCutPart(String cutPart) {
        this.cutPart = cutPart;
    }

    public String getCutNo() {
        return cutNo;
    }

    public void setCutNo(String cutNo) {
        this.cutNo = cutNo;
    }

    public String getCutDeal() {
        return cutDeal;
    }

    public void setCutDeal(String cutDeal) {
        this.cutDeal = cutDeal;
    }

    public String getSysno() {
        return sysno;
    }

    public void setSysno(String sysno) {
        this.sysno = sysno;
    }

    public Integer getLineNo() {
        return lineNo;
    }

    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }

    public String getVaName() {
        return vaName;
    }

    public void setVaName(String vaName) {
        this.vaName = vaName;
    }

    public String getPlanDt() {
        return planDt;
    }

    public void setPlanDt(String planDt) {
        this.planDt = planDt;
    }

    public String getExecDt() {
        return execDt;
    }

    public void setExecDt(String execDt) {
        this.execDt = execDt;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public String getManufNo() {
        return manufNo;
    }

    public void setManufNo(String manufNo) {
        this.manufNo = manufNo;
    }

    public String getManufName() {
        return manufName;
    }

    public void setManufName(String manufName) {
        this.manufName = manufName;
    }

    public String getVaHosp() {
        return vaHosp;
    }

    public void setVaHosp(String vaHosp) {
        this.vaHosp = vaHosp;
    }

    public String getVaHospname() {
        return vaHospname;
    }

    public void setVaHospname(String vaHospname) {
        this.vaHospname = vaHospname;
    }

    public String getVaOper() {
        return vaOper;
    }

    public void setVaOper(String vaOper) {
        this.vaOper = vaOper;
    }

    public String getDrugBarcode() {
        return drugBarcode;
    }

    public void setDrugBarcode(String drugBarcode) {
        this.drugBarcode = drugBarcode;
    }

    public String getVaLeft() {
        return vaLeft;
    }

    public void setVaLeft(String vaLeft) {
        this.vaLeft = vaLeft;
    }

    public String getStatusFlag() {
        return statusFlag;
    }

    public void setStatusFlag(String statusFlag) {
        this.statusFlag = statusFlag;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    private String remarks;

    private String sysno;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_plan_det.line_no
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    private Integer lineNo;

    private static final long serialVersionUID = 1L;

    public String getSysnoVa() {
        return sysnoVa;
    }

    public void setSysnoVa(String sysnoVa) {
        this.sysnoVa = sysnoVa;
    }

    public String getBookDt() {
        return bookDt;
    }

    public void setBookDt(String bookDt) {
        this.bookDt = bookDt;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardInno() {
        return cardInno;
    }

    public void setCardInno(String cardInno) {
        this.cardInno = cardInno;
    }

    public String getBlhNo() {
        return blhNo;
    }

    public void setBlhNo(String blhNo) {
        this.blhNo = blhNo;
    }

    public String getPatName() {
        return patName;
    }

    public void setPatName(String patName) {
        this.patName = patName;
    }

    public String getPatSex() {
        return patSex;
    }

    public void setPatSex(String patSex) {
        this.patSex = patSex;
    }

    public String getPatAge() {
        return patAge;
    }

    public void setPatAge(String patAge) {
        this.patAge = patAge;
    }

    public String getPatOccu() {
        return patOccu;
    }

    public void setPatOccu(String patOccu) {
        this.patOccu = patOccu;
    }

    public String getPatAdd() {
        return patAdd;
    }

    public void setPatAdd(String patAdd) {
        this.patAdd = patAdd;
    }

    public String getPatTel() {
        return patTel;
    }

    public void setPatTel(String patTel) {
        this.patTel = patTel;
    }

    public String getVaCode() {
        return vaCode;
    }

    public void setVaCode(String vaCode) {
        this.vaCode = vaCode;
    }

    public String getVaDoc() {
        return vaDoc;
    }

    public void setVaDoc(String vaDoc) {
        this.vaDoc = vaDoc;
    }

    public String getHospNo() {
        return hospNo;
    }

    public void setHospNo(String hospNo) {
        this.hospNo = hospNo;
    }

    public String getPatWeight() {
        return patWeight;
    }

    public void setPatWeight(String patWeight) {
        this.patWeight = patWeight;
    }

    public String getVaProtein() {
        return vaProtein;
    }

    public void setVaProtein(String vaProtein) {
        this.vaProtein = vaProtein;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UnionVaVpHd)) return false;

        UnionVaVpHd that = (UnionVaVpHd) o;

        if (!getSysnoVa().equals(that.getSysnoVa())) return false;
        return getPlanDt().equals(that.getPlanDt());
    }

    @Override
    public int hashCode() {
        int result = getSysnoVa().hashCode();
        result = 31 * result + getPlanDt().hashCode();
        return result;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}
