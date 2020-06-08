package cn.jjvu.xiao;

import cn.jjvu.xiao.dao.UserMapper;
import cn.jjvu.xiao.pojo.Dept;
import cn.jjvu.xiao.pojo.Dict;
import cn.jjvu.xiao.pojo.User;
import cn.jjvu.xiao.pojo.UserExample;
import cn.jjvu.xiao.service.DeptService;
import cn.jjvu.xiao.service.DictService;
import com.github.pagehelper.PageHelper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DaoTest {

    @Resource
    private UserMapper userMapper;

    @Resource
    private DeptService deptService;

    @Resource
    private DictService dictService;

    @Test
    public void testUserDao() {
        PageHelper.startPage(0, 10);
        List<User> userList = userMapper.selectByExample(new UserExample());

    }

    @Test
    public void testService() {
        Dept dept = deptService.findById(1);
        System.out.println(dept);
    }

    @Test
    public void testDictService() {
        Dict dict = dictService.findById(1);
        System.out.println(dict);
    }
}
