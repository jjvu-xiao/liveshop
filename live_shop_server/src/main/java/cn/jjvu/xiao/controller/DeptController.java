package cn.jjvu.xiao.controller;

import cn.jjvu.xiao.core.model.HttpResult;
import cn.jjvu.xiao.pojo.Dept;
import cn.jjvu.xiao.service.DeptService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashSet;

/**
 * 部门管理
 * @author xiaohongbing
 * @date 2020-06-19
 */
@RestController
@RequestMapping("dept")
public class DeptController {

	@Resource
	private DeptService deptService;
	
	@PreAuthorize("hasAuthority('sys:dept:add') AND hasAuthority('sys:dept:edit')")
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody Dept record) {
		return HttpResult.ok(deptService.save(record));
	}

	@PreAuthorize("hasAuthority('sys:dept:delete')")
	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody HashSet<Number> records) {
		return HttpResult.ok(deptService.delete(records));
	}

	@PreAuthorize("hasAuthority('sys:dept:view')")
	@GetMapping(value="/findTree")
	public HttpResult findTree() {
		return HttpResult.ok(deptService.findTree());
	}

}
