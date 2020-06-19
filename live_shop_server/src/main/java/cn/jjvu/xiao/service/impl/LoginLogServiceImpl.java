package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.config.MybatisPageHelper;
import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.LoginLogMapper;
import cn.jjvu.xiao.pojo.LoginLog;
import cn.jjvu.xiao.service.LoginLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

@Service
public class LoginLogServiceImpl  implements LoginLogService {

	@Resource
	private LoginLogMapper loginLogMapper;

	@Override
	public int save(LoginLog record) {
		if(record.getId() == null || record.getId() == 0) {
			return loginLogMapper.insertSelective(record);
		}
		return loginLogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int delete(Number id) {
		return loginLogMapper.deleteByPrimaryKey((Integer) id);
	}

	@Override
	public int delete(Set<Number> records) {
		for (Number id : records) {
			loginLogMapper.deleteByPrimaryKey((Integer) id);
		}
		return 1;
	}

	@Override
	public int update(LoginLog record) {
		return loginLogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public LoginLog findById(Number id) {
		return loginLogMapper.selectByPrimaryKey((Integer) id);
	}

	@Override
	public PageResult findPage(PageRequest pageRequest) {
		Object userName = pageRequest.getParam("userName");
		if(userName != null) {
			return MybatisPageHelper.findPage(pageRequest, loginLogMapper, "findPageByUserName", userName);
		}
		Object status = pageRequest.getParam("status");
		if(status != null) {
			return MybatisPageHelper.findPage(pageRequest, loginLogMapper, "findPageByStatus", status);
		}
		return MybatisPageHelper.findPage(pageRequest, loginLogMapper);
	}
	
}
