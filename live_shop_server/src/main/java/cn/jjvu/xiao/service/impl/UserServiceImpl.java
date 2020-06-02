package cn.jjvu.xiao.service;

import cn.jjvu.xiao.dao.UserDao;
import cn.jjvu.xiao.pojo.User;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
}
