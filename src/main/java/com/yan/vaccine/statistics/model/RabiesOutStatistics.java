package com.yan.vaccine.statistics.model;

import java.io.Serializable;

/**
 * 项目名称：yan-demo
 * 类名称：RabiesOutStatistics
 * 类描述：
 * 创建人：lxk
 * 创建时间：2018-10-12 16:56
 * 修改人：
 * 修改时间：
 * 修改备注：
 **/
public class RabiesOutStatistics implements Serializable {

    private String sysno;

    private String patName;

    private String bookDt;

    private String batchNo;

    private Integer vaNumber;

    private static final long serialVersionUID = 1L;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getSysno() {
        return sysno;
    }

    public void setSysno(String sysno) {
        this.sysno = sysno;
    }

    public String getPatName() {
        return patName;
    }

    public void setPatName(String patName) {
        this.patName = patName;
    }

    public String getBookDt() {
        return bookDt;
    }

    public void setBookDt(String bookDt) {
        this.bookDt = bookDt;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public Integer getVaNumber() {
        return vaNumber;
    }

    public void setVaNumber(Integer vaNumber) {
        this.vaNumber = vaNumber;
    }
}
