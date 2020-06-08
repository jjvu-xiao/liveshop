package cn.jjvu.xiao.service.impl;

import java.util.List;
import java.util.Set;

import cn.jjvu.xiao.config.MybatisPageHelper;
import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.ConfigMapper;
import cn.jjvu.xiao.pojo.Config;
import cn.jjvu.xiao.pojo.ConfigExample;
import cn.jjvu.xiao.service.ConfigService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class ConfigServiceImpl  implements ConfigService {

	@Resource
	private ConfigMapper configMapper;

	@Override
	public int save(Config record) {
		if(record.getId() == null || record.getId() == 0) {
			return configMapper.insertSelective(record);
		}
		return update(record);
	}

	@Override
	public int delete(Number id) {
		return configMapper.deleteByPrimaryKey(id.intValue());
	}

	@Override
	public int delete(Set<Number> ids) {
		for (Number id: ids) {
			configMapper.deleteByPrimaryKey(id.intValue());
		}
		return ids.size();
	}

	@Override
	public int update(Config record) {
		return configMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public Config findById(Number T) {
		return configMapper.selectByPrimaryKey((Integer) T);
	}

	@Override
	public PageResult findPage(PageRequest pageRequest) {
		Object label = pageRequest.getParam("label");
		if(label != null) {
			return MybatisPageHelper.findPage(pageRequest, configMapper, "findPageByLabel", label);
		}
		return MybatisPageHelper.findPage(pageRequest, configMapper);
	}

	@Override
	public List<Config> findByLable(String lable) {
		ConfigExample example = new ConfigExample();
		ConfigExample.Criteria criteria = example.createCriteria();
		criteria.andLabelEqualTo(lable);
		return configMapper.selectByExample(example);
	}
}
