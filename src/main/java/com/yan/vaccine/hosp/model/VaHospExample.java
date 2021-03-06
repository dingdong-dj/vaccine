package com.yan.vaccine.hosp.model;

import java.util.ArrayList;
import java.util.List;

public class VaHospExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public VaHospExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andHospNoIsNull() {
            addCriterion("hosp_no is null");
            return (Criteria) this;
        }

        public Criteria andHospNoIsNotNull() {
            addCriterion("hosp_no is not null");
            return (Criteria) this;
        }

        public Criteria andHospNoEqualTo(String value) {
            addCriterion("hosp_no =", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoNotEqualTo(String value) {
            addCriterion("hosp_no <>", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoGreaterThan(String value) {
            addCriterion("hosp_no >", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoGreaterThanOrEqualTo(String value) {
            addCriterion("hosp_no >=", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoLessThan(String value) {
            addCriterion("hosp_no <", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoLessThanOrEqualTo(String value) {
            addCriterion("hosp_no <=", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoLike(String value) {
            addCriterion("hosp_no like", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoNotLike(String value) {
            addCriterion("hosp_no not like", value, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoIn(List<String> values) {
            addCriterion("hosp_no in", values, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoNotIn(List<String> values) {
            addCriterion("hosp_no not in", values, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoBetween(String value1, String value2) {
            addCriterion("hosp_no between", value1, value2, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNoNotBetween(String value1, String value2) {
            addCriterion("hosp_no not between", value1, value2, "hospNo");
            return (Criteria) this;
        }

        public Criteria andHospNameIsNull() {
            addCriterion("hosp_name is null");
            return (Criteria) this;
        }

        public Criteria andHospNameIsNotNull() {
            addCriterion("hosp_name is not null");
            return (Criteria) this;
        }

        public Criteria andHospNameEqualTo(String value) {
            addCriterion("hosp_name =", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameNotEqualTo(String value) {
            addCriterion("hosp_name <>", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameGreaterThan(String value) {
            addCriterion("hosp_name >", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameGreaterThanOrEqualTo(String value) {
            addCriterion("hosp_name >=", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameLessThan(String value) {
            addCriterion("hosp_name <", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameLessThanOrEqualTo(String value) {
            addCriterion("hosp_name <=", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameLike(String value) {
            addCriterion("hosp_name like", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameNotLike(String value) {
            addCriterion("hosp_name not like", value, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameIn(List<String> values) {
            addCriterion("hosp_name in", values, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameNotIn(List<String> values) {
            addCriterion("hosp_name not in", values, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameBetween(String value1, String value2) {
            addCriterion("hosp_name between", value1, value2, "hospName");
            return (Criteria) this;
        }

        public Criteria andHospNameNotBetween(String value1, String value2) {
            addCriterion("hosp_name not between", value1, value2, "hospName");
            return (Criteria) this;
        }

        public Criteria andPreIpIsNull() {
            addCriterion("pre_ip is null");
            return (Criteria) this;
        }

        public Criteria andPreIpIsNotNull() {
            addCriterion("pre_ip is not null");
            return (Criteria) this;
        }

        public Criteria andPreIpEqualTo(String value) {
            addCriterion("pre_ip =", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpNotEqualTo(String value) {
            addCriterion("pre_ip <>", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpGreaterThan(String value) {
            addCriterion("pre_ip >", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpGreaterThanOrEqualTo(String value) {
            addCriterion("pre_ip >=", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpLessThan(String value) {
            addCriterion("pre_ip <", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpLessThanOrEqualTo(String value) {
            addCriterion("pre_ip <=", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpLike(String value) {
            addCriterion("pre_ip like", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpNotLike(String value) {
            addCriterion("pre_ip not like", value, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpIn(List<String> values) {
            addCriterion("pre_ip in", values, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpNotIn(List<String> values) {
            addCriterion("pre_ip not in", values, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpBetween(String value1, String value2) {
            addCriterion("pre_ip between", value1, value2, "preIp");
            return (Criteria) this;
        }

        public Criteria andPreIpNotBetween(String value1, String value2) {
            addCriterion("pre_ip not between", value1, value2, "preIp");
            return (Criteria) this;
        }

        public Criteria andStatusFlagIsNull() {
            addCriterion("status_flag is null");
            return (Criteria) this;
        }

        public Criteria andStatusFlagIsNotNull() {
            addCriterion("status_flag is not null");
            return (Criteria) this;
        }

        public Criteria andStatusFlagEqualTo(String value) {
            addCriterion("status_flag =", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagNotEqualTo(String value) {
            addCriterion("status_flag <>", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagGreaterThan(String value) {
            addCriterion("status_flag >", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagGreaterThanOrEqualTo(String value) {
            addCriterion("status_flag >=", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagLessThan(String value) {
            addCriterion("status_flag <", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagLessThanOrEqualTo(String value) {
            addCriterion("status_flag <=", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagLike(String value) {
            addCriterion("status_flag like", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagNotLike(String value) {
            addCriterion("status_flag not like", value, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagIn(List<String> values) {
            addCriterion("status_flag in", values, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagNotIn(List<String> values) {
            addCriterion("status_flag not in", values, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagBetween(String value1, String value2) {
            addCriterion("status_flag between", value1, value2, "statusFlag");
            return (Criteria) this;
        }

        public Criteria andStatusFlagNotBetween(String value1, String value2) {
            addCriterion("status_flag not between", value1, value2, "statusFlag");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table va_hosp
     *
     * @mbg.generated do_not_delete_during_merge Tue Aug 14 09:02:21 CST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table va_hosp
     *
     * @mbg.generated Tue Aug 14 09:02:21 CST 2018
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}