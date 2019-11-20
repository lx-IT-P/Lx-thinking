package contoller;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import entity.Sfcqk;
import entity.xmxq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.impl.SfcqkServiceImpl;
import service.impl.XmxqServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SfcqkController {
    @Autowired
    private SfcqkServiceImpl service;
    @RequestMapping(value = "/findsfcqk.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> findSfcqkController(int page, int limit) {
        //分页
        Page<Object> pageh = PageHelper.startPage(page, limit);

        //得到所有数据
        List<Sfcqk> list = service.findAll();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageh.getTotal());   //分页总条数
        map.put("data", list);   //得到所有数据
        return map;
    }

}
