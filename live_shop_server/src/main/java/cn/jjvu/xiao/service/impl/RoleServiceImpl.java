package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.RoleMapper;
import cn.jjvu.xiao.pojo.Role;
import cn.jjvu.xiao.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAll() {
        return null;
    }

    @Override
    public List<Role> findRoleMenus(Long roleId) {
        return null;
    }

    @Override
    public int saveRoleMenus(List<Role> records) {
        return 0;
    }

    @Override
    public List<Role> findByName(String name) {
        return null;
    }

    @Override
    public int save(Role record) {
        return 0;
    }

    @Override
    public int delete(Number id) {
        return 0;
    }

    @Override
    public int delete(Set<Number> ids) {
        return 0;
    }

    @Override
    public int update(Role record) {
        return 0;
    }

    @Override
    public Role findById(Number id) {
        return null;
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        return null;
    }
}
