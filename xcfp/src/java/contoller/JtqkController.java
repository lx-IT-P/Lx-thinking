package contoller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.impl.CountryServiceImpl;
import service.impl.JtqkServiceImpl;

import java.util.*;

@Controller
public class JtqkController {
    @Autowired
    private JtqkServiceImpl service;
    @RequestMapping(value = "/findjtqk.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> findJtqkController(int page, int limit) {
        //分页
        Page<Object> pageh = PageHelper.startPage(page, limit);

        //得到所有数据
        List<Jtqk> list = service.findAll();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageh.getTotal());   //分页总条数
        map.put("data", list);   //得到所有数据
        return map;
    }

    @RequestMapping(value = "/findByJtqkName.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> findByNameJtqkController(String musicName, int page, int limit) {
        //分页
        Page<Object> page1 = PageHelper.startPage(page, limit);

        //得到模糊查询的数据
        List<Jtqk> list = service.findByNameJtqk(musicName);
        //创建map集合，用来存储layui数据表格的数据
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", page1.getTotal());
        map.put("data", list);
        return map;
    }
    @RequestMapping("/findJtqkById.action")
    public String findJtqkByIdController(int id, ModelMap map) {
        //得到单个数据
        Jtqk mu = service.findJtqkById(id);
        map.addAttribute("mu", mu);
        return "updatePku";
    }
}
