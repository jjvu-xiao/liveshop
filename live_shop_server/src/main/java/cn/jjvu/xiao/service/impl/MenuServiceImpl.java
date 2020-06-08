package cn.jjvu.xiao.service.impl;

import cn.jjvu.xiao.core.model.LiveShopConstants;
import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.core.model.PageResult;
import cn.jjvu.xiao.dao.MenuMapper;
import cn.jjvu.xiao.pojo.Menu;
import cn.jjvu.xiao.pojo.MenuExample;
import cn.jjvu.xiao.pojo.UserExample;
import cn.jjvu.xiao.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuMapper menuMapper;


    @Override
    public List<Menu> findTree(String userName, int menuType) {
        List<Menu> sysMenus = new ArrayList<>();
        return null;
    }

    @Override
    public List<Menu> findByUser(String userName) {
//        MenuExample example = new MenuExample();
//        if(userName == null || "".equals(userName) || LiveShopConstants.ADMIN.equalsIgnoreCase(userName)) {
//            return menuMapper.selectByExample(new MenuExample());
//        }
//        MenuExample.Criteria criteria = example.createCriteria();
//        criteria.and
//        return sysMenuMapper.findByUserName(userName);
        return null;
    }

    @Override
    public int save(Menu record) {
        return menuMapper.insert(record);
    }

    @Override
    public int delete(Number id) {
        return menuMapper.deleteByPrimaryKey((Integer) id);
    }

    @Override
    public int delete(Set<Number> ids) {
        for (Number id : ids) {
            menuMapper.deleteByPrimaryKey((Integer) id);
        }
        return 1;
    }

    @Override
    public int update(Menu record) {
        return menuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Menu findById(Number id) {
        return menuMapper.selectByPrimaryKey((Integer) id);
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        return null;
    }
}
