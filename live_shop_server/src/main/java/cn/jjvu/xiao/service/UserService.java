package cn.jjvu.xiao.service;

import cn.jjvu.xiao.pojo.User;

import java.io.File;
import java.util.List;
import java.util.Set;

public interface UserService extends CrudService<User> {

    User login(String loginname, String passwd);

    User findByName(String username);

    /**
     * 查找用户的菜单权限标识集合
     * @param userName
     * @return
     */
    Set<String> findPermissions(String userName);

    /**
     * 查找用户的角色集合
     * @param userName
     * @return
     */
    List<User> findUserRoles(Long userId);

    /**
     * 生成用户信息Excel文件
     * @param pageRequest 要导出的分页查询参数
     * @return
     */
    File createUserExcelFile(int page, int size);
}
