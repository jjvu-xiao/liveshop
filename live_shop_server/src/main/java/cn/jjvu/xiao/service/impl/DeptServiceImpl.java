package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.DeptMapper;
import cn.jjvu.xiao.pojo.Dept;
import cn.jjvu.xiao.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class DeptServiceImpl implements DeptService {

    @Resource
    private DeptMapper deptMapper;

    @Override
    public List<Dept> findTree() {
        List<Dept> depts = new ArrayList<>();
        List<Dept> sysDepts = new ArrayList<>();
        for (Dept dept : depts) {
            if (dept.getParentId() == null || dept.getParentId() == 0) {
//                dept.set
            }
        }
        return null;
    }

    @Override
    public int save(Dept record) {
        return deptMapper.insertSelective(record);
    }

    @Override
    public int delete(Number id) {
        return deptMapper.deleteByPrimaryKey(id.longValue());
    }

    @Override
    public int delete(Set<Number> id) {
//        for (:
//             ) {
//
//        }
        return 1;
    }

    @Override
    public int update(Dept record) {
        return deptMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Dept findById(Number T) {
        return deptMapper.selectByPrimaryKey(T.longValue());
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        return null;
    }
}
