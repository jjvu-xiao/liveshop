package cn.jjvu.xiao.service;

import cn.jjvu.xiao.pojo.Dict;

import java.util.List;

public interface DictService extends CrudService<Dict> {

    /**
     * 根据名称查询
     * @param lable
     * @return
     */
    List<Dict> findByLable(String lable);
}
