package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.dao.UserMapper;
import cn.jjvu.xiao.pojo.User;
import cn.jjvu.xiao.service.UserService;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private Producer producer;

    @Resource
    private JavaMailSender mailService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @PostMapping("/login")
    public Object login(@RequestBody User user) {
        User res = userService.login(user.getName(), user.getPasswd());
        if (res == null)
            return "Sorry";
        else
            return res;
    }

    @GetMapping("captcha.jpg")
    public void captcha(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        // 生成文字验证码
        String text = producer.createText();
        // 生成图片验证码
        BufferedImage image = producer.createImage(text);
        // 保存到验证码到 session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, text);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        IOUtils.closeQuietly(out);
    }

    @GetMapping("validateEmail")
    public Object validateEmail(HttpServletRequest req) throws ServletException, IOException {
        String email = req.getParameter("email");
        String random = (int) ((Math.random() * 9 + 1) * 100000) + "";
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("m18779334084@163.com");
        message.setTo(email);
        message.setSubject("用户注册验证信息");
        message.setText("，欢迎注册我们的APP，您的验证码为" + "\t" + random);
        mailService.send(message);
        Map<String, Object> callback = new HashMap<String, Object>();
        callback.put("retCode", 0);
        callback.put("retMsg", "邮件已发出，请注意查收");
//        logger.debug("邮箱" + CHAR_SEPARATOR + email  + "验证码" + CHAR_SEPARATOR + random);
//        Jedis jedis = jedisPool.getResource();
//        jedis.setex(email, 30, random);
//        jedis.close();
        return callback;
    }

//    @PostMapping()
//    public Object registerUser(@RequestBody String email) {
//
//    }
}
