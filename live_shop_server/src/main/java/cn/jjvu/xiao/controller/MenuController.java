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
@RequestMapping("menu")
public class MenuController {

	@Resource
	private MenuService sysMenuService;
	
	@PreAuthorize("hasAuthority('sys:menu:add') AND hasAuthority('sys:menu:edit')")
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody Menu record) {
		return HttpResult.ok(sysMenuService.save(record));
	}

	@PreAuthorize("hasAuthority('sys:menu:delete')")
	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody HashSet<Number> records) {
		return HttpResult.ok(sysMenuService.delete(records));
	}

	@PreAuthorize("hasAuthority('sys:menu:view')")
	@GetMapping(value="/findNavTree")
	public HttpResult findNavTree(@RequestParam String userName) {
		return HttpResult.ok(sysMenuService.findTree(userName, 1));
	}
	
	@PreAuthorize("hasAuthority('sys:menu:view')")
	@GetMapping(value="/findMenuTree")
	public HttpResult findMenuTree() {
		return HttpResult.ok(sysMenuService.findTree(null, 0));
	}
}
