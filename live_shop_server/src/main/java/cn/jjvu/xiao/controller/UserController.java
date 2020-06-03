package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.dao.UserMapper;
import cn.jjvu.xiao.pojo.User;
import cn.jjvu.xiao.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RestController
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping("/login")
    public Object login(@RequestBody User user) {
        User res = userService.login(user.getName(), user.getPasswd());
        if (res == null)
            return "Sorry";
        else
            return res;
    }
}
