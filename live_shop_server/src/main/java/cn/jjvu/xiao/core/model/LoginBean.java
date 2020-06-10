package cn.jjvu.xiao.core.model;

/**
 * 登录接口封装对象
 * @author XiaoHongBing
 * @date 2020-06-10
 */
public class LoginBean {

	private String account;
	private String password;
	private String captcha;
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCaptcha() {
		return captcha;
	}
	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}
	
}
