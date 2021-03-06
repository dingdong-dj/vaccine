package com.yan.vaccine.plan.mapper;

import com.yan.vaccine.plan.model.VaPlanDet;
import com.yan.vaccine.plan.model.VaPlanDetExample;
import com.yan.vaccine.plan.model.VaPlanDetKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VaPlanDetMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    long countByExample(VaPlanDetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int deleteByExample(VaPlanDetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int deleteByPrimaryKey(VaPlanDetKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int insert(VaPlanDet record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int insertSelective(VaPlanDet record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    List<VaPlanDet> selectByExample(VaPlanDetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    VaPlanDet selectByPrimaryKey(VaPlanDetKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int updateByExampleSelective(@Param("record") VaPlanDet record, @Param("example") VaPlanDetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int updateByExample(@Param("record") VaPlanDet record, @Param("example") VaPlanDetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int updateByPrimaryKeySelective(VaPlanDet record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table va_plan_det
     *
     * @mbg.generated Fri Aug 03 14:57:59 CST 2018
     */
    int updateByPrimaryKey(VaPlanDet record);
}