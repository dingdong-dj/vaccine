package com.yan.vaccine.register.model;

import java.io.Serializable;

public class VaType implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_type.va_code
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    private String vaCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_type.va_name
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    private String vaName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_type.va_table
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    private String vaTable;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column va_type.notice
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    private String notice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table va_type
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column va_type.va_code
     *
     * @return the value of va_type.va_code
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public String getVaCode() {
        return vaCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column va_type.va_code
     *
     * @param vaCode the value for va_type.va_code
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public void setVaCode(String vaCode) {
        this.vaCode = vaCode == null ? null : vaCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column va_type.va_name
     *
     * @return the value of va_type.va_name
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public String getVaName() {
        return vaName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column va_type.va_name
     *
     * @param vaName the value for va_type.va_name
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public void setVaName(String vaName) {
        this.vaName = vaName == null ? null : vaName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column va_type.va_table
     *
     * @return the value of va_type.va_table
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public String getVaTable() {
        return vaTable;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column va_type.va_table
     *
     * @param vaTable the value for va_type.va_table
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public void setVaTable(String vaTable) {
        this.vaTable = vaTable == null ? null : vaTable.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column va_type.notice
     *
     * @return the value of va_type.notice
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public String getNotice() {
        return notice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column va_type.notice
     *
     * @param notice the value for va_type.notice
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    public void setNotice(String notice) {
        this.notice = notice == null ? null : notice.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_type
     *
     * @mbg.generated Mon Aug 06 08:49:52 CST 2018
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", vaCode=").append(vaCode);
        sb.append(", vaName=").append(vaName);
        sb.append(", vaTable=").append(vaTable);
        sb.append(", notice=").append(notice);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}