package com.yan.vaccine.register.mapper;

import com.yan.vaccine.register.model.UnionVaVp;
import com.yan.vaccine.register.model.UnionVaVpHd;

import java.util.List;
import java.util.Map;

/**
 * 项目名称：yan-demo
 * 类名称：UnionMapper
 * 类描述：
 * 创建人：lxk
 * 创建时间：2018-10-12 16:55
 * 修改人：
 * 修改时间：
 * 修改备注：
 **/
public interface UnionMapper {
    //按登记时间排序
    List<UnionVaVp> searchUnionvavpOrderByBdt(Map<String, Object> condition);

    //按实际接种时间排序
    List<UnionVaVp> searchUnionvavpOrderByEdt(Map<String, Object> condition);

    //按编号查找狂犬患者关联数据(仅注射蛋白)
    List<UnionVaVpHd> searchUnionVaHdBySysno(Map<String, Object> condition);


    //按编号查找狂犬患者关联数据
    List<UnionVaVpHd> searchUnionVaVpHdBySysno(Map<String, Object> condition);
}
