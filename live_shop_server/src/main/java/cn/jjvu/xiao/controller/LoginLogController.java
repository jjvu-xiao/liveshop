package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.core.model.HttpResult;
import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.pojo.LoginLog;
import cn.jjvu.xiao.service.LoginLogService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashSet;

/**
 * 登录日志控制器
 * @author Xiaohongbing
 * @date 2020-06-19
 */
@RestController
@RequestMapping("loginlog")
public class LoginLogController {

    @Resource
    private LoginLogService loginLogService;

    @PreAuthorize("hasAuthority('sys:loginlog:view')")
    @PostMapping(value="/findPage")
    public HttpResult findPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(loginLogService.findPage(pageRequest));
    }

    @PreAuthorize("hasAuthority('sys:loginlog:delete')")
    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody HashSet<Number> records) {
        return HttpResult.ok(loginLogService.delete(records));
    }
}

