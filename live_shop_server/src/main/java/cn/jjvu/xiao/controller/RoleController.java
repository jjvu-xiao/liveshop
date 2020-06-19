package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.core.model.HttpResult;
import cn.jjvu.xiao.pojo.Menu;
import cn.jjvu.xiao.service.MenuService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashSet;

/**
 * 菜单控制器
 * @author xiaohongbing
 * @date 2020-06-19
 */
@RestController
@RequestMapping("role")
public class RoleController {
    @Resource
    private MenuService menuService;

    @PreAuthorize("hasAuthority('sys:role:add') AND hasAuthority('sys:role:edit')")
    @PostMapping(value="/save")
    public HttpResult save(@RequestBody Menu record) {
        return HttpResult.ok(menuService.save(record));
    }

    @PreAuthorize("hasAuthority('sys:role:delete')")
    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody HashSet<Number> records) {
        return HttpResult.ok(menuService.delete(records));
    }

    @PreAuthorize("hasAuthority('sys:role:view')")
    @GetMapping(value="/findNavTree")
    public HttpResult findNavTree(@RequestParam String userName) {
        return HttpResult.ok(menuService.findTree(userName, 1));
    }

    @PreAuthorize("hasAuthority('sys:role:view')")
    @GetMapping(value="/findMenuTree")
    public HttpResult findMenuTree() {
        return HttpResult.ok(menuService.findTree(null, 0));
    }
}
