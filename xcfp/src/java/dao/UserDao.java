package dao;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDao {
    //根据用户名和密码查找。mybatis中有多个参数时，需要使用@Param注解
    User findByUserNameAndPassword(@Param("username")String username, @Param("password")String password);
    //增加用户
    void addUser(User user);
    //根据用户名查询
    User findByUserName(String username);

}
