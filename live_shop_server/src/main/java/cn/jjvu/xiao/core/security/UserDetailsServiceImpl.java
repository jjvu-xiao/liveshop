package cn.jjvu.xiao.core.security;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import cn.jjvu.xiao.pojo.Customer;
import cn.jjvu.xiao.pojo.User;
import cn.jjvu.xiao.service.CustomerService;
import cn.jjvu.xiao.service.UserService;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 用户登录认证信息查询
 * @author XiaoHongBing
 * @date 2020-06-09
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Resource
    private UserService userService;
    
    @Resource
    private CustomerService customerService;

    /**
     * 判断登录用户是管理员还是普通用户，普通用户则不查询所属权限
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.findByName(username);
        Set<String> permissions = new HashSet<String>();
        List<GrantedAuthority> grantedAuthorities = null;
        if (user != null) {
        	permissions = userService.findPermissions(user.getName());
        	grantedAuthorities = permissions.stream().map(GrantedAuthorityImpl::new).collect(Collectors.toList());
        	 // 用户权限列表，根据用户拥有的权限标识与如 @PreAuthorize("hasAuthority('sys:menu:view')") 标注的接口对比，决定是否可以调用接口
            return new JwtUserDetails(user.getName(), user.getPasswd(), user.getSalt(), grantedAuthorities);
        }
        else {
            Customer customer = customerService.getInfo(username);
            grantedAuthorities = permissions.stream().map(GrantedAuthorityImpl::new).collect(Collectors.toList());
            return new JwtUserDetails(customer.getLoginname(), customer.getPasswd(), customer.getSalt(), grantedAuthorities);
        }
    }
}