package contoller;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import entity.EchartData;
import entity.Series;
import entity.xmxq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.impl.XmxqServiceImpl;

import java.util.*;

@Controller
public class XmxqController {
    @Autowired
    private XmxqServiceImpl service;
    @RequestMapping(value = "/findxmxq.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> findXmxqController(int page, int limit) {
        //分页
        Page<Object> pageh = PageHelper.startPage(page, limit);

        //得到所有数据
        List<xmxq> list = service.findAll();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageh.getTotal());   //分页总条数
        map.put("data", list);   //得到所有数据
        return map;
    }
    @RequestMapping(value = "/findByXmxqName.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> findByNameXmxqController(String name, int page, int limit) {
        //分页
        Page<Object> page1 = PageHelper.startPage(page, limit);

        //得到模糊查询的数据
        List<xmxq> list = service.findByNameXmxq(name);
        //创建map集合，用来存储layui数据表格的数据
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", page1.getTotal());
        map.put("data", list);
        return map;
    }
    @RequestMapping("/showEchartLine")
    @ResponseBody
    public EchartData lineData() {
        System.out.println("折线图");
        List<String> category = new ArrayList<String>();
        List<Long> serisData=new ArrayList<Long>();
        List<xmxq> list = service.findAll();
        for (xmxq totalNum : list) {
            category.add(totalNum.getName());
            serisData.add((long)totalNum.getZjze());
        }
        List<String> legend = new ArrayList<String>(Arrays.asList(new String[] { "总数比较" }));// 数据分组
        List<Series> series = new ArrayList<Series>();// 纵坐标
        series.add(new Series("总数比较", "line", serisData));
        EchartData data = new EchartData(legend, category, series);
        return data;
    }
}
