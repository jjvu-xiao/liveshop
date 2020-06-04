package cn.jjvu.xiao.service;

import cn.jjvu.xiao.pojo.Role;

import java.util.List;

/**
 * 角色管理
 */
public interface RoleService extends CrudService<Role> {

	/**
	 * 查询全部
	 * @return
	 */
	List<Role> findAll();

	/**
	 * 查询角色菜单集合
	 * @return
	 */
	List<Role> findRoleMenus(Long roleId);

	/**
	 * 保存角色菜单
	 * @param records
	 * @return
	 */
	int saveRoleMenus(List<Role> records);

	/**
	 * 根据名称查询
	 * @param name
	 * @return
	 */
	List<Role> findByName(String name);

}
