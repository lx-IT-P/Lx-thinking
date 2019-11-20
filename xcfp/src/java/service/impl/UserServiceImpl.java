package service.impl;

import dao.UserDao;


import entity.User;
import org.springframework.stereotype.Service;
import service.UserService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public  class UserServiceImpl implements UserService {
    @Resource
    private UserDao dao;
    //注入UserMapper接口
    /**
     * 登录
     * 根据用户名和密码进行查询
     */
    @Override
    public User login(String username, String password) {
        return dao.findByUserNameAndPassword(username, password);
    }
    /**
     * 注册
     * 增加用户
     */
    @Override
    public void register(User user) {
        dao.addUser(user);
    }
    /**
     * 根据用户名查询
     */
    @Override
    public User findByUserName(String username) {

        return dao.findByUserName(username);
    }

}
