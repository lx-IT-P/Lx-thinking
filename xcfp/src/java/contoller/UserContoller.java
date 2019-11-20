package contoller;


import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;
import service.impl.UserServiceImpl;
import sun.security.provider.MD5;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
public class UserContoller {
    @Autowired
    private UserServiceImpl userService;
    @RequestMapping(value = "/userlogin.action", method = RequestMethod.POST)
    public String login(HttpSession session, String username, String password, Model mv) {
        User user = userService.login(username, password);
        //if (user != null) {
            //登录成功，将user对象设置到HttpSession作用范围域中
            session.setAttribute("user", user);
            if (user.getRole().equals("扶贫办")) {
                return "redirect:index.jsp";
            } else if (user.getRole().equals("帮扶单位")) {
                return "redirect:index1.jsp";
            } else if (user.getRole().equals("帮扶联系人")) {
                return "redirect:index2.jsp";
            }
        else{
                //登录失败，设置失败信息，并调转到登录页面
                mv.addAttribute("message", "登录名和密码错误，请重新输入");
                return "redirect:login.jsp";
            }
        }
    /**
     * 跳转到用户注册页面
     */
    @RequestMapping(value = "/registerpage.do")
    public String registerpage() {

        return "register";
    }
    /**
     * 用户注册
     */
    @RequestMapping(value="/userregister.action",method=RequestMethod.POST)
    @ResponseBody
    public String register(User user) {
        String username=user.getUsername();
        // 如果数据库中没有该用户，可以注册，否则跳转页面
        if (userService.findByUserName(username) == null) {
            // 添加用户
            userService.register(user);
            return null;
        }else {
            // 注册失败跳转到错误页面
            return "error";
        }
    }
    /**
     * 加密解密算法 执行一次加密，两次解密
     */
    public static String convertMD5(String inStr){

        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++){
            a[i] = (char) (a[i] ^ 't');
        }
        String s = new String(a);
        return s;
    }

}