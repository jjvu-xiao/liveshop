package cn.jjvu.xiao.service;

import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;

import java.util.List;

/**
 * 通用CRUD接口
 * @author xiaohongbing
 * @date 2020-06-03
 */
public interface CrudService<T> {
    // 插入数据
    int save(T record);

    // 删除数据
    int delete(T record);

    // 批量删除数据
    int delete(List<T> records);

    // 单条修改数据
    int update(T record);

    // 单条数据查询
    T findById(Number T);

    // 分页查询
    PageResult findPage(PageRequest pageRequest);
}
