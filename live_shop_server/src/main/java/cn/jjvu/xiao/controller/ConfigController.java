package cn.jjvu.xiao.controller;

import java.util.HashSet;

import cn.jjvu.xiao.core.model.HttpResult;
import cn.jjvu.xiao.core.model.PageRequest;
import cn.jjvu.xiao.pojo.Config;
import cn.jjvu.xiao.service.ConfigService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 系统配置控制器
 * @author xiaohongbing
 * @date 2020-06-19
 */
@RestController
@RequestMapping("config")
public class ConfigController {

	@Resource
	private ConfigService configService;
	
	@PreAuthorize("hasAuthority('sys:config:add') AND hasAuthority('sys:config:edit')")
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody Config record) {
		return HttpResult.ok(configService.save(record));
	}

	@PreAuthorize("hasAuthority('sys:config:delete')")
	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody HashSet<Number> records) {
		return HttpResult.ok(configService.delete(records));
	}

	@PreAuthorize("hasAuthority('sys:config:view')")
	@PostMapping(value="/findPage")
	public HttpResult findPage(@RequestBody PageRequest pageRequest) {
		return HttpResult.ok(configService.findPage(pageRequest));
	}
	
	@PreAuthorize("hasAuthority('sys:config:view')")
	@GetMapping(value="/findByLable")
	public HttpResult findByLable(@RequestParam String lable) {
		return HttpResult.ok(configService.findByLable(lable));
	}
}
