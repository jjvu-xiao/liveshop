package cn.jjvu.xiao.dao;

import cn.jjvu.xiao.pojo.RoleDept;
import cn.jjvu.xiao.pojo.RoleDeptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleDeptMapper {
    int countByExample(RoleDeptExample example);

    int deleteByExample(RoleDeptExample example);

    int deleteByPrimaryKey(Long id);

    int insert(RoleDept record);

    int insertSelective(RoleDept record);

    List<RoleDept> selectByExample(RoleDeptExample example);

    RoleDept selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") RoleDept record, @Param("example") RoleDeptExample example);

    int updateByExample(@Param("record") RoleDept record, @Param("example") RoleDeptExample example);

    int updateByPrimaryKeySelective(RoleDept record);

    int updateByPrimaryKey(RoleDept record);
}