package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.pojo.Dict;
import cn.jjvu.xiao.service.DictService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/dict")
public class DictController {

    @Resource
    private DictService dictService;

    @PreAuthorize("hasAuthority('sys:dict:add')")
    @RequestMapping(value = "/save")
    public Object save(@RequestBody Dict record) {
        return dictService.save(record);
    }

}
