package cn.jjvu.xiao.service;

import cn.jjvu.xiao.pojo.Customer;
import cn.jjvu.xiao.pojo.Log;

public interface CustomerService extends CrudService<Customer> {
	Customer login(String loginname, String passwd, Log loginLog);
	Customer getInfo(String loginname);
}
