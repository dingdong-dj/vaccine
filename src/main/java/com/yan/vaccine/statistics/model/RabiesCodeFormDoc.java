package com.yan.vaccine.statistics.model;

import java.io.Serializable;

/**
 * 项目名称：yan-demo
 * 类名称：RabiesCodeFormDoc
 * 类描述：
 * 创建人：lxk
 * 创建时间：2018-10-29 16:23
 * 修改人：
 * 修改时间：
 * 修改备注：
 **/
public class RabiesCodeFormDoc implements Serializable {
    private static final long serialVersionUID = 1L;
    private String sysno;
    private String bookDt;
    private String cardNo;
    private String cardInno;
    private String blhNo;
    private String patName;
    private String patSex;
    private String patAge;
    private String patOccu;
    private String patAdd;
    private String patTel;
    private String vaCode;
    private String vaDoc;
    private String hospNo;
    private String hdcvDt;
    private String hdcvAdd;
    private String dogType;
    private String expose;
    private String cutPart;
    private String cutNo;
    private String cutDeal;
    private String remarks;
    private String patWeight;
    private String vaProtein;
    private String vaTimes;
    private String vaHistory;
    private String vaOffsite;
    private String vaSysno;
    private String vaProteinNo;
    private String vaProteinPart;
    private String vaProteinFac;//新增蛋白厂商
    private String vaName;
    private String manufNo;
    private String manufName;
    private Integer snumber;
    private String batchNo;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getSysno() {
        return sysno;
    }

    public void setSysno(String sysno) {
        this.sysno = sysno;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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

    public String getVaTimes() {
        return vaTimes;
    }

    public void setVaTimes(String vaTimes) {
        this.vaTimes = vaTimes;
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

    public String getVaName() {
        return vaName;
    }

    public void setVaName(String vaName) {
        this.vaName = vaName;
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

    public Integer getSnumber() {
        return snumber;
    }

    public void setSnumber(Integer snumber) {
        this.snumber = snumber;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public String getVaProteinFac() {
        return vaProteinFac;
    }

    public void setVaProteinFac(String vaProteinFac) {
        this.vaProteinFac = vaProteinFac;
    }
}
