package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.core.model.HttpResult;
import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.service.LogService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashSet;

@RequestMapping("/log")
@RestController
public class LogController {

    @Resource
    private LogService logService;

    @PreAuthorize("hasAuthority('sys:log:view')")
    @PostMapping(value="/findPage")
    public HttpResult findPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(logService.findPage(pageRequest));
    }

    @PreAuthorize("hasAuthority('sys:log:delete')")
    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody HashSet<Number> records) {
        return HttpResult.ok(logService.delete(records));
    }

}
