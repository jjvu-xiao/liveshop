package cn.jjvu.xiao;

import cn.jjvu.xiao.dao.UserMapper;
import cn.jjvu.xiao.pojo.User;
import cn.jjvu.xiao.pojo.UserExample;
import com.github.pagehelper.PageHelper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
public class DaoTest {

    @Resource
    private UserMapper userMapper;

    @Test
    public void testUserDao() {
        PageHelper.startPage(0, 10);
        List<User> userList = userMapper.selectByExample(new UserExample());

    }
}
