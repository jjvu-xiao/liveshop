package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.CustomerMapper;
import cn.jjvu.xiao.dao.LogMapper;
import cn.jjvu.xiao.pojo.Customer;
import cn.jjvu.xiao.pojo.CustomerExample;
import cn.jjvu.xiao.pojo.Log;
import cn.jjvu.xiao.service.CustomerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.Date;
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
    
    @Resource
    private LogMapper logMapper;

    @Override
    public int save(Customer record) {
        return null == record.getId() ? customerMapper.insertSelective(record) : this.update(record);
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

	@Override
	public Customer login(String loginname, String passwd, Log loginLog) {
		CustomerExample example = new CustomerExample();
		CustomerExample.Criteria criteria = example.createCriteria();
		criteria.andLoginnameEqualTo(loginname);
		Customer customer = customerMapper.selectByExample(example).get(0);
		Date now = new Date();
        loginLog.setCreateTime(now);
        loginLog.setLastUpdateTime(now);
        loginLog.setMethod("login");   
        loginLog.setParams("登录账号：" + loginname + "密码：" + passwd);
        if (null != customer) {
        	loginLog.setOperation("登录成功");
        }
        else {
        	loginLog.setOperation("登录失败");
        }
        return customer;
	}

	@Override
	public Customer getInfo(String loginname) {
		CustomerExample example = new CustomerExample();
		CustomerExample.Criteria criteria = example.createCriteria();
		criteria.andLoginnameEqualTo(loginname);
		return customerMapper.selectByExample(example).get(0);
	}
}
