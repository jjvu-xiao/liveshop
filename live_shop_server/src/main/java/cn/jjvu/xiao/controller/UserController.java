package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.config.FastDFSClient;
import cn.jjvu.xiao.service.CustomerService;
import cn.jjvu.xiao.service.LogService;
import cn.jjvu.xiao.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;

/**
 * 用户的注册，登录Web服务接口
 * @author Xiaohongbing
 * @date 2020-07-15
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

   

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private AuthenticationManager authenticationManager;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private LogService logService;

    @Resource
    private CustomerService customerService;
    
    @Autowired
	private FastDFSClient fdfsClient;
    
    @Value("${upload.url}")
    private String FILE_UPLOAD_URL;
   
}
