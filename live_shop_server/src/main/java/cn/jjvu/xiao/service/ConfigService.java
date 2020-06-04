package cn.jjvu.xiao.service;

import cn.jjvu.xiao.pojo.Config;

import java.util.List;

public interface ConfigService  extends CrudService<Config> {

    /**
     * 根据名称查询
     * @param lable
     * @return
     */
    List<Config> findByLable(String lable);
}

