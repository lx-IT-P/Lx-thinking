package contoller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import entity.Country;
import entity.EchartData;
import entity.Series;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.impl.CountryServiceImpl;
import java.util.*;
@Controller
public class CountryController {
    @Autowired
    private CountryServiceImpl service;
    @RequestMapping("/showEchartBar")
    @ResponseBody
    public EchartData BarData() {
        System.out.println("柱状图");
        List<String> category = new ArrayList<String>();
        List<Long> serisData=new ArrayList<Long>();
        List<Country> list = service.findAll();
        for (Country totalNum : list) {
            category.add(totalNum.getCountryname());
            serisData.add((long) totalNum.getIncome());
        }
        List<String> legend = new ArrayList<String>(Arrays.asList(new String[] { "总数比较" }));// 数据分组
        List<Series> series = new ArrayList<Series>();// 纵坐标
        series.add(new Series("总数比较", "bar", serisData));
        EchartData data = new EchartData(legend, category, series);
        return data;
    }

}
