package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.core.constant.LiveShopContants;
import cn.jjvu.xiao.core.model.HttpResult;
import cn.jjvu.xiao.core.model.LoginBean;
import cn.jjvu.xiao.core.security.JwtAuthenticatioToken;
import cn.jjvu.xiao.pojo.Customer;
import cn.jjvu.xiao.pojo.Log;
import cn.jjvu.xiao.pojo.LoginLog;
import cn.jjvu.xiao.pojo.User;
import cn.jjvu.xiao.service.CustomerService;
import cn.jjvu.xiao.service.LogService;
import cn.jjvu.xiao.service.UserService;
import cn.jjvu.xiao.utils.ILiveShopStringUtils;
import cn.jjvu.xiao.utils.PasswordUtils;
import cn.jjvu.xiao.utils.SecurityUtils;
import com.google.code.kaptcha.Producer;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 用户的注册，登录Web服务接口
 * @author Xiaohongbing
 * @date 2020-07-15
 */
@RestController
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private Producer producer;

    @Resource
    private JavaMailSender mailService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private AuthenticationManager authenticationManager;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private LogService logService;

    @Resource
    private CustomerService customerService;

    /**
     * 获取用户登录IP，在从Redis数据库中取出相对应的图片验证码，比较用户是否为机器人
     */
    @PostMapping("/login")
    public Object login(HttpServletRequest req, @RequestBody LoginBean loginBean) {
        String username = loginBean.getAccount();
        String passwd = loginBean.getPassword();
        String captcha = loginBean.getCaptcha();
        String ip = SecurityUtils.getIRealIPAddr(req);
        Object kaptcha = stringRedisTemplate.opsForValue().get(LiveShopContants.CAPTCHA_CODE + ip);
        if (null == kaptcha) {
            return HttpResult.error("验证码已经失效");
        }
        if (!captcha.equals(kaptcha)) {
            return HttpResult.error("验证码不正确");
        }
        User res = userService.findByName(username);
        if (null == res)
            return HttpResult.error("账号不存在");
        else if (!PasswordUtils.matches(res.getSalt(), passwd, res.getPasswd()))
            return HttpResult.error("密码不正确");
        LoginLog loginLog = new LoginLog();
        loginLog.setIp(SecurityUtils.getIRealIPAddr(req));
        res = userService.login(username, passwd, loginLog);
        JwtAuthenticatioToken token = SecurityUtils.login(req, username, passwd, authenticationManager);
        Map<String, Object> callback = new HashMap<>();
        callback.put("token", token);
        callback.put("user", res);
        logger.debug("用户\t" + res.getName() + "登录成功");
        return HttpResult.ok(callback, "登录成功");
    }

    /**
     * 获取图片验证码，图片验证码为4位数字，有效时间位2分钟
     * 先获取请求的IP地址，将IP地址跟图片验证码数据缓存到Redis数据库中
     */
    @GetMapping("captcha.jpg")
    public void captcha(HttpServletRequest req, HttpServletResponse response) throws IOException {
        long startTime = System.currentTimeMillis();
        String ip = SecurityUtils.getIRealIPAddr(req);
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        String text = producer.createText();
        BufferedImage image = producer.createImage(text);
        stringRedisTemplate.opsForValue().set(LiveShopContants.CAPTCHA_CODE + ip, text, 60 * 10, TimeUnit.SECONDS);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        logger.debug("IP地址 " + ip + " 图片验证码生成成功:\t" + text);
        Log log = new Log();
        Date now = new Date();
        log.setCreateTime(now);
        log.setIp(ip);
        log.setLastUpdateTime(now);
        log.setMethod("captcha");
        log.setOperation("获取验证码");
        log.setParams(req.getParameterMap().toString());
        log.setTime(System.currentTimeMillis() - startTime);
        logService.save(log);
        IOUtils.closeQuietly(out);
    }

    /**
     * 邮箱验证功能，发送验证邮件到用户邮箱
     * 验证码为6个随机数字，过期时间默认为2分钟，用户的邮箱跟验证码会缓存到Redis
     * @param email 用户邮箱地址
     */
    @PostMapping("validateEmail")
    public Object validateEmail(@RequestBody String email, HttpServletRequest req) {
        long startTime = System.currentTimeMillis();
        String msg = null;
        boolean isSucess = false;
        if (!ILiveShopStringUtils.isValidEmail(email)) {
            msg = "请输入正确的邮箱";
            return HttpResult.error(msg);
        }
        String ip = SecurityUtils.getIRealIPAddr(req);
        String random = (int) ((Math.random() * 9 + 1) * 100000) + "";
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("m18779334084@163.com");
        message.setTo(email);
        message.setSubject("用户注册验证信息");
        message.setText("欢迎注册我们的APP，您的验证码为" + "\t" + random);
        mailService.send(message);
        msg = "邮件已发出，请注意查收";
        logger.debug("ip", "发送邮件成功，验证码\t" + random);
        stringRedisTemplate.opsForValue().set(LiveShopContants.EMAIL_CODE + ip, random);
        stringRedisTemplate.opsForValue().set(LiveShopContants.EMAIL_SAVE + ip, email);
        Log log = new Log();
        Date now = new Date();
        log.setCreateTime(now);
        log.setIp(ip);
        log.setLastUpdateTime(now);
        log.setMethod("validateEmail");
        log.setOperation(msg);
        log.setParams(req.getParameterMap().toString());
        log.setTime(System.currentTimeMillis() - startTime);
        logService.save(log);
        return HttpResult.ok(msg);
    }

    /**
     * 通过邮箱验证码注册用户
     * @param data  用户的邮箱与验证码
     */
    @PostMapping(value = "registerByEmail")
    public Object registerByEmail(@RequestBody HashMap<String, String> data, HttpServletRequest req) {
        long startTime = System.currentTimeMillis();
        Log log = new Log();
        Date now = new Date();
        String ip = SecurityUtils.getIRealIPAddr(req);
        String correctCode = stringRedisTemplate.opsForValue().get(LiveShopContants.EMAIL_CODE + ip);
        String msg = null;
        String code = data.get("code");
        String email = data.get("email");
        boolean isSucess = false;
        if (! ILiveShopStringUtils.isValidEmail(email)) {
            msg = "请输入正确的邮箱";
            log.setOperation(msg);
        }
        else if (null == correctCode) {
            msg = "未发送邮件或者邮件已经过期";
            log.setOperation(msg);
        }
        else if (null == code) {
            msg = "输入验证码不能为空";
            log.setOperation(msg);
        }
        else if (!code.equals(correctCode)) {
            msg = "验证码不正确，请核实邮件后重新输入";
            log.setOperation(msg);
        }
        else {
            isSucess = true;
            Customer customer = new Customer();
            customer.setLoginname(email);
            customer.setEmail(email);
            customer.setCreateTime(now);
            customer.setLastUpdateTime(now);
            customerService.save(customer);
            msg = "注册成功";
            log.setOperation(msg);
        }
        log.setIp(ip);
        log.setLastUpdateTime(now);
        log.setCreateTime(now);
        log.setMethod("registerByEmail");
        log.setParams(req.getParameterMap().toString());
        log.setTime(System.currentTimeMillis() - startTime);
        logService.save(log);
        return isSucess ? HttpResult.ok(msg) : HttpResult.error(msg);
    }
    
    
    /**
     * 修改移动端客户信息
     * @param customer 客户信息
     * @return 提示信息
     */
    @PostMapping(value = "/profile")
    public Object profile(@RequestBody Customer customer, HttpServletRequest req) {
    	String ip = SecurityUtils.getIRealIPAddr(req);
    	Date now = new Date();
    	boolean isSuccess = false;
    	Log log = new Log();
    	String msg;
    	int count = customerService.save(customer);
    	String loginname = customer.getLoginname();
    	log.setCreateBy(loginname);
		log.setCreateTime(now);
		log.setIp(ip);
		log.setLastUpdateBy(loginname);
		log.setLastUpdateTime(now);
		log.setUserName(loginname);
		log.setParams(customer.toString());
		log.setMethod("profile");
    	if (count > 0) {
    		msg = "修改成功";
    		isSuccess = true;
    	}
    	else {
    		msg = "修改失败";
    	}
    	log.setOperation(msg);
    	log.setTime(System.currentTimeMillis() - now.getTime());
    	logService.save(log);
    	return isSuccess ? HttpResult.ok(customer, "修改成功") : HttpResult.error("修改失败");
    }
    
    /**
     * 根据编号获取用户信息
     * @param id 用户编号
     * @return 返回用户的所有信息
     */
    @PostMapping("/getInfo")
    public Object getInfo(@RequestBody Long id, HttpServletRequest req) {
    	String ip = SecurityUtils.getIRealIPAddr(req);
    	Date now = new Date();
    	boolean isSuccess = false;
    	Log log = new Log();
    	String msg;
    	String loginname = null; 
    	Customer customer = null;
    	if (null != id) {
    		customer = customerService.findById(id);
        	loginname = customer.getLoginname();
        	msg = "获得用户信息成功";
			isSuccess = true;
    	}
    	else {
    		msg = "用户不能为空";
    	}
    	log.setCreateBy(loginname);
		log.setCreateTime(now);
		log.setIp(ip);
		log.setLastUpdateBy(loginname);
		log.setLastUpdateTime(now);
		log.setUserName(loginname);
		log.setParams(id.toString());
		log.setMethod("getInfo");
		log.setOperation(msg);
    	log.setTime(System.currentTimeMillis() - now.getTime());
    	logService.save(log);
    	return isSuccess ? HttpResult.ok(customer, msg) : HttpResult.error(msg);
    }
}
