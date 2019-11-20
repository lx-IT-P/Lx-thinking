package service;


import entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    // 通过用户名及密码核查用户登录
    User login(String username, String password);
    //增加用户
    void register(User user);
    //根据用户名查询
    User findByUserName(String user);
}
