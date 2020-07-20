package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.CustomerMapper;
import cn.jjvu.xiao.pojo.Customer;
import cn.jjvu.xiao.service.CustomerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Set;

/**
 * 手机用户的服务层
 * @author Xiaohongbing
 * @date 2020-07-17
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Resource
    private CustomerMapper customerMapper;

    @Override
    public int save(Customer record) {
        return null != record.getId() ? customerMapper.insertSelective(record) : this.update(record);
    }

    @Override
    public int delete(Number id) {
        Customer customer = customerMapper.selectByPrimaryKey((Long) id);
        customer.setStatus((byte) 1);
        customer.setDelFlag((byte) 1);
        return customerMapper.updateByPrimaryKeySelective(customer);
    }

    @Transactional
    @Override
    public int delete(Set<Number> ids) {
        int size = 0;
        for (Number id : ids) {
            this.delete(id);
            size ++;
        }
        return size;
    }

    @Override
    public int update(Customer record) {
        return customerMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Customer findById(Number id) {
        return customerMapper.selectByPrimaryKey((Long) id);
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        return null;
    }
}
