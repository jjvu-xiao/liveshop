package cn.jjvu.xiao.config;

import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * CORS 跨域配置
 */
public class CorsConfig implements WebMvcConfigurer {

    /**
     *  允许所有跨域访问的路径
     *  允许所有跨域访问的源
     *  允许 POST GET PUT DELETE OPTIONS 方法请求
     *  预检间隔时间为 168秒
     *  允许头部设置
     *  允许发送Cookie
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")
                .maxAge(168000)
                .allowedMethods("*")
                .allowCredentials(true);
    }
}
