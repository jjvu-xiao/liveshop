package cn.jjvu.xiao.core.security;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 安全用户模型
 */
public class JwtUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
	
	private String name;
    private String passwd;
    private String salt;
    private Collection<? extends GrantedAuthority> authorities;

    JwtUserDetails(String name, String passwd, String salt, Collection<? extends GrantedAuthority> authorities) {
        this.name = name;
        this.passwd = passwd;
        this.salt = salt;
        this.authorities = authorities;
    }

    @Override
    public String getUsername() {
        return name;
    }

    @JsonIgnore
    @Override
    public String getPassword() {
        return passwd;
    }

    public String getSalt() {
		return salt;
	}
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isEnabled() {
        return true;
    }
}