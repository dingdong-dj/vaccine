package com.yan.vaccine.common.model;

import java.io.Serializable;

public class SysEnumKey implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_enum.etype
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    private String etype;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_enum.ecode
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    private String ecode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table sys_enum
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_enum.etype
     *
     * @return the value of sys_enum.etype
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    public String getEtype() {
        return etype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_enum.etype
     *
     * @param etype the value for sys_enum.etype
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    public void setEtype(String etype) {
        this.etype = etype == null ? null : etype.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_enum.ecode
     *
     * @return the value of sys_enum.ecode
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    public String getEcode() {
        return ecode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_enum.ecode
     *
     * @param ecode the value for sys_enum.ecode
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    public void setEcode(String ecode) {
        this.ecode = ecode == null ? null : ecode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_enum
     *
     * @mbg.generated Mon Aug 06 11:04:27 CST 2018
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", etype=").append(etype);
        sb.append(", ecode=").append(ecode);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}