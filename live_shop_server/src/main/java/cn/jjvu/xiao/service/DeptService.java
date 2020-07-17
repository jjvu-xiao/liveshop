package cn.jjvu.xiao.service;

import cn.jjvu.xiao.pojo.Dept;

import java.util.List;

public interface DeptService extends CrudService<Dept> {

    /**
     * 查询机构树
     * @param userId
     * @return
     */
    List<Dept> findTree();
}
