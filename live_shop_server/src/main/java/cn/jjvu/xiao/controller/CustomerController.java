package cn.jjvu.xiao.controller;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import cn.jjvu.xiao.config.FastDFSClient;
import cn.jjvu.xiao.core.model.HttpResult;
import cn.jjvu.xiao.pojo.Customer;
import cn.jjvu.xiao.pojo.Log;
import cn.jjvu.xiao.service.CustomerService;
import cn.jjvu.xiao.service.LogService;
import cn.jjvu.xiao.utils.SecurityUtils;

@RestController
@RequestMapping(value="/customer")
public class CustomerController {
	
	@Autowired
    private StringRedisTemplate stringRedisTemplate;
	
	@Resource
	private CustomerService customerService;
	
	@Autowired
	private FastDFSClient fdfsClient;
	    
    @Value("${upload.url}")
    private String FILE_UPLOAD_URL;
    
    @Resource
    private LogService logService;
    
    private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	 /**
     * 修改移动端客户信息
     * @param customer 客户信息
     * @return 提示信息
     */
    @PostMapping(value = "/profile")
    public Object profile(HttpServletRequest req, Customer customer, @RequestParam("avator")MultipartFile avator) {
    	String ip = SecurityUtils.getIRealIPAddr(req);
    	Date now = new Date();
    	boolean isSuccess = false;
    	Log log = new Log();
    	String msg;  	
    	String loginname = customer.getLoginname();
    	log.setCreateBy(loginname);
		log.setCreateTime(now);
		log.setIp(ip);
		log.setLastUpdateBy(loginname);
		log.setLastUpdateTime(now);
		log.setUserName(loginname);
		log.setParams(customer.toString());
		log.setMethod("profile");
    	try {
    		String originalName = avator.getOriginalFilename();
            logger.debug("编辑个人信息", "头像上传文件原名称：" + originalName);
            String extName = originalName.substring(originalName.lastIndexOf(".") + 1);
            byte[] bytes = avator.getBytes();
            String token = fdfsClient.uploadFile(bytes, extName);
            String path = token.replaceAll("group1/M00/", "data/");
			String url = FILE_UPLOAD_URL + "/" + path;
			customer.setAvatar(url);
		} catch (IOException e) {
			e.printStackTrace();
			log.setOperation(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			log.setOperation(e.getMessage());
		}
    	customer.setCreateTime(now);
    	customer.setLastUpdateTime(now);
    	int count = customerService.save(customer);    	
    	if (count > 0) {
    		msg = "修改成功";
    		isSuccess = true;
    	}
    	else {
    		msg = "修改失败";
    	}
    	if (avator.isEmpty()) {
    		msg = "上传头像失败";
    	} 	
    	log.setOperation(msg);
    	log.setTime(System.currentTimeMillis() - now.getTime());
    	logService.save(log);
    	return isSuccess ? HttpResult.ok(customer, "保存成功") : HttpResult.error("保存失败");
    }
    
    /**
     * 根据编号获取用户信息
     * @param id 用户编号
     * @return 返回用户的所有信息
     */
    @GetMapping("/getInfo")
    public Object getInfo(@RequestParam(name = "login") String login, HttpServletRequest req) {
    	String ip = SecurityUtils.getIRealIPAddr(req);
    	Date now = new Date();
    	boolean isSuccess = false;
    	Log log = new Log();
    	String msg;
    	String loginname = null; 
    	Customer customer = null;
    	if (null != login) {
    		customer = customerService.getInfo(login);
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
		log.setParams(login);
		log.setMethod("getInfo");
		log.setOperation(msg);
    	log.setTime(System.currentTimeMillis() - now.getTime());
    	logService.save(log);
    	return isSuccess ? HttpResult.ok(customer, msg) : HttpResult.error(msg);
    } 
}
