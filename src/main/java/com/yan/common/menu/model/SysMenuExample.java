package com.yan.common.menu.model;

import java.util.ArrayList;
import java.util.List;

public class SysMenuExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public SysMenuExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
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
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
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

        public Criteria andMenuIdIsNull() {
            addCriterion("MENU_ID is null");
            return (Criteria) this;
        }

        public Criteria andMenuIdIsNotNull() {
            addCriterion("MENU_ID is not null");
            return (Criteria) this;
        }

        public Criteria andMenuIdEqualTo(String value) {
            addCriterion("MENU_ID =", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotEqualTo(String value) {
            addCriterion("MENU_ID <>", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdGreaterThan(String value) {
            addCriterion("MENU_ID >", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_ID >=", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdLessThan(String value) {
            addCriterion("MENU_ID <", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdLessThanOrEqualTo(String value) {
            addCriterion("MENU_ID <=", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdLike(String value) {
            addCriterion("MENU_ID like", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotLike(String value) {
            addCriterion("MENU_ID not like", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdIn(List<String> values) {
            addCriterion("MENU_ID in", values, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotIn(List<String> values) {
            addCriterion("MENU_ID not in", values, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdBetween(String value1, String value2) {
            addCriterion("MENU_ID between", value1, value2, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotBetween(String value1, String value2) {
            addCriterion("MENU_ID not between", value1, value2, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuPidIsNull() {
            addCriterion("MENU_PID is null");
            return (Criteria) this;
        }

        public Criteria andMenuPidIsNotNull() {
            addCriterion("MENU_PID is not null");
            return (Criteria) this;
        }

        public Criteria andMenuPidEqualTo(String value) {
            addCriterion("MENU_PID =", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidNotEqualTo(String value) {
            addCriterion("MENU_PID <>", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidGreaterThan(String value) {
            addCriterion("MENU_PID >", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_PID >=", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidLessThan(String value) {
            addCriterion("MENU_PID <", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidLessThanOrEqualTo(String value) {
            addCriterion("MENU_PID <=", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidLike(String value) {
            addCriterion("MENU_PID like", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidNotLike(String value) {
            addCriterion("MENU_PID not like", value, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidIn(List<String> values) {
            addCriterion("MENU_PID in", values, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidNotIn(List<String> values) {
            addCriterion("MENU_PID not in", values, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidBetween(String value1, String value2) {
            addCriterion("MENU_PID between", value1, value2, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuPidNotBetween(String value1, String value2) {
            addCriterion("MENU_PID not between", value1, value2, "menuPid");
            return (Criteria) this;
        }

        public Criteria andMenuNameIsNull() {
            addCriterion("MENU_NAME is null");
            return (Criteria) this;
        }

        public Criteria andMenuNameIsNotNull() {
            addCriterion("MENU_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andMenuNameEqualTo(String value) {
            addCriterion("MENU_NAME =", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotEqualTo(String value) {
            addCriterion("MENU_NAME <>", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameGreaterThan(String value) {
            addCriterion("MENU_NAME >", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_NAME >=", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameLessThan(String value) {
            addCriterion("MENU_NAME <", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameLessThanOrEqualTo(String value) {
            addCriterion("MENU_NAME <=", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameLike(String value) {
            addCriterion("MENU_NAME like", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotLike(String value) {
            addCriterion("MENU_NAME not like", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameIn(List<String> values) {
            addCriterion("MENU_NAME in", values, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotIn(List<String> values) {
            addCriterion("MENU_NAME not in", values, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameBetween(String value1, String value2) {
            addCriterion("MENU_NAME between", value1, value2, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotBetween(String value1, String value2) {
            addCriterion("MENU_NAME not between", value1, value2, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeIsNull() {
            addCriterion("MENU_DESCRIBE is null");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeIsNotNull() {
            addCriterion("MENU_DESCRIBE is not null");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeEqualTo(String value) {
            addCriterion("MENU_DESCRIBE =", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeNotEqualTo(String value) {
            addCriterion("MENU_DESCRIBE <>", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeGreaterThan(String value) {
            addCriterion("MENU_DESCRIBE >", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_DESCRIBE >=", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeLessThan(String value) {
            addCriterion("MENU_DESCRIBE <", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeLessThanOrEqualTo(String value) {
            addCriterion("MENU_DESCRIBE <=", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeLike(String value) {
            addCriterion("MENU_DESCRIBE like", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeNotLike(String value) {
            addCriterion("MENU_DESCRIBE not like", value, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeIn(List<String> values) {
            addCriterion("MENU_DESCRIBE in", values, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeNotIn(List<String> values) {
            addCriterion("MENU_DESCRIBE not in", values, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeBetween(String value1, String value2) {
            addCriterion("MENU_DESCRIBE between", value1, value2, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuDescribeNotBetween(String value1, String value2) {
            addCriterion("MENU_DESCRIBE not between", value1, value2, "menuDescribe");
            return (Criteria) this;
        }

        public Criteria andMenuUrlIsNull() {
            addCriterion("MENU_URL is null");
            return (Criteria) this;
        }

        public Criteria andMenuUrlIsNotNull() {
            addCriterion("MENU_URL is not null");
            return (Criteria) this;
        }

        public Criteria andMenuUrlEqualTo(String value) {
            addCriterion("MENU_URL =", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlNotEqualTo(String value) {
            addCriterion("MENU_URL <>", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlGreaterThan(String value) {
            addCriterion("MENU_URL >", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_URL >=", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlLessThan(String value) {
            addCriterion("MENU_URL <", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlLessThanOrEqualTo(String value) {
            addCriterion("MENU_URL <=", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlLike(String value) {
            addCriterion("MENU_URL like", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlNotLike(String value) {
            addCriterion("MENU_URL not like", value, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlIn(List<String> values) {
            addCriterion("MENU_URL in", values, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlNotIn(List<String> values) {
            addCriterion("MENU_URL not in", values, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlBetween(String value1, String value2) {
            addCriterion("MENU_URL between", value1, value2, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuUrlNotBetween(String value1, String value2) {
            addCriterion("MENU_URL not between", value1, value2, "menuUrl");
            return (Criteria) this;
        }

        public Criteria andMenuIconIsNull() {
            addCriterion("MENU_ICON is null");
            return (Criteria) this;
        }

        public Criteria andMenuIconIsNotNull() {
            addCriterion("MENU_ICON is not null");
            return (Criteria) this;
        }

        public Criteria andMenuIconEqualTo(String value) {
            addCriterion("MENU_ICON =", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconNotEqualTo(String value) {
            addCriterion("MENU_ICON <>", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconGreaterThan(String value) {
            addCriterion("MENU_ICON >", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_ICON >=", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconLessThan(String value) {
            addCriterion("MENU_ICON <", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconLessThanOrEqualTo(String value) {
            addCriterion("MENU_ICON <=", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconLike(String value) {
            addCriterion("MENU_ICON like", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconNotLike(String value) {
            addCriterion("MENU_ICON not like", value, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconIn(List<String> values) {
            addCriterion("MENU_ICON in", values, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconNotIn(List<String> values) {
            addCriterion("MENU_ICON not in", values, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconBetween(String value1, String value2) {
            addCriterion("MENU_ICON between", value1, value2, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIconNotBetween(String value1, String value2) {
            addCriterion("MENU_ICON not between", value1, value2, "menuIcon");
            return (Criteria) this;
        }

        public Criteria andMenuIndexIsNull() {
            addCriterion("MENU_INDEX is null");
            return (Criteria) this;
        }

        public Criteria andMenuIndexIsNotNull() {
            addCriterion("MENU_INDEX is not null");
            return (Criteria) this;
        }

        public Criteria andMenuIndexEqualTo(Integer value) {
            addCriterion("MENU_INDEX =", value, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexNotEqualTo(Integer value) {
            addCriterion("MENU_INDEX <>", value, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexGreaterThan(Integer value) {
            addCriterion("MENU_INDEX >", value, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexGreaterThanOrEqualTo(Integer value) {
            addCriterion("MENU_INDEX >=", value, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexLessThan(Integer value) {
            addCriterion("MENU_INDEX <", value, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexLessThanOrEqualTo(Integer value) {
            addCriterion("MENU_INDEX <=", value, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexIn(List<Integer> values) {
            addCriterion("MENU_INDEX in", values, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexNotIn(List<Integer> values) {
            addCriterion("MENU_INDEX not in", values, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexBetween(Integer value1, Integer value2) {
            addCriterion("MENU_INDEX between", value1, value2, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuIndexNotBetween(Integer value1, Integer value2) {
            addCriterion("MENU_INDEX not between", value1, value2, "menuIndex");
            return (Criteria) this;
        }

        public Criteria andMenuTypeIsNull() {
            addCriterion("MENU_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andMenuTypeIsNotNull() {
            addCriterion("MENU_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andMenuTypeEqualTo(String value) {
            addCriterion("MENU_TYPE =", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeNotEqualTo(String value) {
            addCriterion("MENU_TYPE <>", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeGreaterThan(String value) {
            addCriterion("MENU_TYPE >", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_TYPE >=", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeLessThan(String value) {
            addCriterion("MENU_TYPE <", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeLessThanOrEqualTo(String value) {
            addCriterion("MENU_TYPE <=", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeLike(String value) {
            addCriterion("MENU_TYPE like", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeNotLike(String value) {
            addCriterion("MENU_TYPE not like", value, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeIn(List<String> values) {
            addCriterion("MENU_TYPE in", values, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeNotIn(List<String> values) {
            addCriterion("MENU_TYPE not in", values, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeBetween(String value1, String value2) {
            addCriterion("MENU_TYPE between", value1, value2, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuTypeNotBetween(String value1, String value2) {
            addCriterion("MENU_TYPE not between", value1, value2, "menuType");
            return (Criteria) this;
        }

        public Criteria andMenuLevelIsNull() {
            addCriterion("MENU_LEVEL is null");
            return (Criteria) this;
        }

        public Criteria andMenuLevelIsNotNull() {
            addCriterion("MENU_LEVEL is not null");
            return (Criteria) this;
        }

        public Criteria andMenuLevelEqualTo(Integer value) {
            addCriterion("MENU_LEVEL =", value, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelNotEqualTo(Integer value) {
            addCriterion("MENU_LEVEL <>", value, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelGreaterThan(Integer value) {
            addCriterion("MENU_LEVEL >", value, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelGreaterThanOrEqualTo(Integer value) {
            addCriterion("MENU_LEVEL >=", value, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelLessThan(Integer value) {
            addCriterion("MENU_LEVEL <", value, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelLessThanOrEqualTo(Integer value) {
            addCriterion("MENU_LEVEL <=", value, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelIn(List<Integer> values) {
            addCriterion("MENU_LEVEL in", values, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelNotIn(List<Integer> values) {
            addCriterion("MENU_LEVEL not in", values, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelBetween(Integer value1, Integer value2) {
            addCriterion("MENU_LEVEL between", value1, value2, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuLevelNotBetween(Integer value1, Integer value2) {
            addCriterion("MENU_LEVEL not between", value1, value2, "menuLevel");
            return (Criteria) this;
        }

        public Criteria andMenuValidIsNull() {
            addCriterion("MENU_VALID is null");
            return (Criteria) this;
        }

        public Criteria andMenuValidIsNotNull() {
            addCriterion("MENU_VALID is not null");
            return (Criteria) this;
        }

        public Criteria andMenuValidEqualTo(Boolean value) {
            addCriterion("MENU_VALID =", value, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidNotEqualTo(Boolean value) {
            addCriterion("MENU_VALID <>", value, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidGreaterThan(Boolean value) {
            addCriterion("MENU_VALID >", value, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidGreaterThanOrEqualTo(Boolean value) {
            addCriterion("MENU_VALID >=", value, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidLessThan(Boolean value) {
            addCriterion("MENU_VALID <", value, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidLessThanOrEqualTo(Boolean value) {
            addCriterion("MENU_VALID <=", value, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidIn(List<Boolean> values) {
            addCriterion("MENU_VALID in", values, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidNotIn(List<Boolean> values) {
            addCriterion("MENU_VALID not in", values, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidBetween(Boolean value1, Boolean value2) {
            addCriterion("MENU_VALID between", value1, value2, "menuValid");
            return (Criteria) this;
        }

        public Criteria andMenuValidNotBetween(Boolean value1, Boolean value2) {
            addCriterion("MENU_VALID not between", value1, value2, "menuValid");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table SYS_MENU
     *
     * @mbg.generated do_not_delete_during_merge Thu Sep 14 18:07:38 CST 2017
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table SYS_MENU
     *
     * @mbg.generated Thu Sep 14 18:07:38 CST 2017
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