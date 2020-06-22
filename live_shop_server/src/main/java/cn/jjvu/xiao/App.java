package cn.jjvu.xiao;

//import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Hello world!
 *
 */
@EnableTransactionManagement    // 开启事务
@MapperScan("cn.jjvu.xiao.dao") // 开启 MyBatis扫描
@SpringBootApplication
//@EnableAdminServer // 开启监控管理
public class App 
{
    public static void main( String[] args )
    {
        SpringApplication.run(App.class, args);
    }

    @Bean
    public Object testBean(PlatformTransactionManager platformTransactionManager){
        System.out.println(">>>>>>>>>>事务管理器：" + platformTransactionManager.getClass().getName());
        return new Object();
    }
}
