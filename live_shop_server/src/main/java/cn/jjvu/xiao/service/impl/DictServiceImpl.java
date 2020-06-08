package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.DictMapper;
import cn.jjvu.xiao.pojo.Dict;
import cn.jjvu.xiao.service.DictService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

@Service
public class DictServiceImpl implements DictService {

    @Resource
    private DictMapper dictMapper;

    @Override
    public List<Dict> findByLable(String lable) {
        return null;
    }

    @Override
    public int save(Dict record) {
        if (record.getId() == null || record.getId() == 0) {
            return dictMapper.insertSelective(record);
        }
        return update(record);
    }

    @Override
    public int delete(Number id) {
        return dictMapper.deleteByPrimaryKey((Integer) id);
    }

    @Override
    public int delete(Set<Number> ids) {
        for (Number id : ids) {
            dictMapper.deleteByPrimaryKey((Integer) id);
        }
        return ids.size();
    }

    @Override
    public int update(Dict record) {
        return dictMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Dict findById(Number T) {
        return dictMapper.selectByPrimaryKey(T.intValue());
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        return null;
    }
}
