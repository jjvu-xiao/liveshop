package cn.jjvu.xiao.service;

import cn.jjvu.xiao.pojo.User;

public interface UserService extends CrudService<User> {

    User login(String loginname, String passwd);
}
