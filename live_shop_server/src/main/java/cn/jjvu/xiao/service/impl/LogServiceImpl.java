package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.LogMapper;
import cn.jjvu.xiao.pojo.Log;
import cn.jjvu.xiao.service.LogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

@Service
public class LogServiceImpl implements LogService {

    @Resource
    private LogMapper logMapper;

    @Override
    public int save(Log record) {
        return logMapper.insert(record);
    }

    @Override
    public int delete(Number id) {
        return logMapper.deleteByPrimaryKey((Integer) id);
    }

    @Override
    public int delete(Set<Number> ids) {
        for (Number id : ids) {
            logMapper.deleteByPrimaryKey((Integer) id);
        }
        return 1;
    }

    @Override
    public int update(Log record) {
        return logMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Log findById(Number id) {
        return logMapper.selectByPrimaryKey((Integer) id);
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        return null;
    }
}
