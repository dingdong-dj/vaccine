package com.yan.vaccine.plan.model;

import java.io.Serializable;

public class VaPlanDetKey implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_plan_det.sysno
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    private String sysno;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_plan_det.line_no
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    private Integer lineNo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column va_plan_det.sysno
     *
     * @return the value of va_plan_det.sysno
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    public String getSysno() {
        return sysno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column va_plan_det.sysno
     *
     * @param sysno the value for va_plan_det.sysno
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    public void setSysno(String sysno) {
        this.sysno = sysno == null ? null : sysno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column va_plan_det.line_no
     *
     * @return the value of va_plan_det.line_no
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    public Integer getLineNo() {
        return lineNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column va_plan_det.line_no
     *
     * @param lineNo the value for va_plan_det.line_no
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", sysno=").append(sysno);
        sb.append(", lineNo=").append(lineNo);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}