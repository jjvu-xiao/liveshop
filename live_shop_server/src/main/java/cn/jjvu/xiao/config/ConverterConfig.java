package cn.jjvu.xiao.config;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import cn.jjvu.xiao.core.converter.DateConverter;

/**
 * 注册日期转化器
 * @author xiao
 * @Date 2020-07-30
 */
@Configuration
public class ConverterConfig {
	@Resource
    private RequestMappingHandlerAdapter handlerAdapter;

    @PostConstruct
    public void initEditableAvlidation() {
        ConfigurableWebBindingInitializer initializer = (ConfigurableWebBindingInitializer)handlerAdapter.getWebBindingInitializer();
        if(initializer.getConversionService()!=null) {
            GenericConversionService genericConversionService = (GenericConversionService)initializer.getConversionService();
            // 注册日期类型转换器
            genericConversionService.addConverter(new DateConverter());
        }
    }
}
