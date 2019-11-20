package contoller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import entity.EchartData;
import entity.PkhInformation;

import entity.Series;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import service.impl.PkuServiceDaoImpl;
import utils.ImportExcelUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;

@Controller
public class MyController {
	@Autowired
	private PkuServiceDaoImpl service;

	@RequestMapping(value = "/findpkh.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findMusicController(int page, int limit) {
		//分页
		Page<Object> pageh = PageHelper.startPage(page, limit);

		//得到所有数据
		List<PkhInformation> list = service.findAll();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageh.getTotal());   //分页总条数
		map.put("data", list);   //得到所有数据
		return map;
	}

	@RequestMapping(value = "/findByName.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findByNameMusicController(String musicName, int page, int limit) {
		//分页
		Page<Object> page1 = PageHelper.startPage(page, limit);

		//得到模糊查询的数据
		List<PkhInformation> list = service.findByNamePku(musicName);
		//创建map集合，用来存储layui数据表格的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", page1.getTotal());
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/findPkuByCity.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findByCityMusicController(String country, int page, int limit) {
		//分页
		Page<Object> page1 = PageHelper.startPage(page, limit);

		//得到模糊查询的数据
		List<PkhInformation> list = service.findPkuByCity(country);
		//创建map集合，用来存储layui数据表格的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", page1.getTotal());
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/findTuoPin.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findTuoPin(int page, int limit, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//分页
		Page<Object> page1 = PageHelper.startPage(page, limit);
		//得到模糊查询的数据
		List<PkhInformation> list = service.findTuoPin();
		System.out.print(list);
		//创建map集合，用来存储layui数据表格的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", page1.getTotal());
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/findFanPin.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findFanPin(int page, int limit, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//分页
		Page<Object> page1 = PageHelper.startPage(page, limit);
		//得到模糊查询的数据
		List<PkhInformation> list = service.findFanPin();
		System.out.print(list);
		//创建map集合，用来存储layui数据表格的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", page1.getTotal());
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/findFanPinByCity.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findFanPinByCity(String country, int page, int limit) {
		//分页
		Page<Object> page1 = PageHelper.startPage(page, limit);
		//得到模糊查询的数据
		List<PkhInformation> list = service.findFanPinByCity(country);
		//创建map集合，用来存储layui数据表格的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", page1.getTotal());
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/selectCity.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Set selectCity(ModelMap map) {
		Set<PkhInformation> list = service.selectCity();
		map.addAttribute("list", list);
		return list;
	}

	@RequestMapping(value = "delPku.action", produces = "application/json;charset=utf-8")
	@ResponseBody    //返回json或字符串，阻止页面转发或重定向
	public String delMusicController(int id) {
		//得到删除的数据
		service.delPku(id);
		return "删除成功";
	}

	@RequestMapping(value = "/addPku.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addMusicController(PkhInformation mu) throws Exception {
		//得到添加的数据
		service.addPku(mu);
		return "修改成功";
	}

	@RequestMapping("/findPkuById.action")
	public String findMusicByIdController(int id, ModelMap map) {
		//得到单个数据
		PkhInformation mu = service.findPkuById(id);
		map.addAttribute("mu", mu);
		return "updatePku";
	}

	@RequestMapping(value = "/updatePku.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateMusicController(PkhInformation mu) {
		//得到修改的数据
		service.updatePku(mu);
		return "修改成功";
	}

	@RequestMapping("/showEchartPie")
	@ResponseBody
	public EchartData PieData() {
		List<String> category = new ArrayList<String>();
		List<String> legend = new ArrayList<String>();
		List<Map> serisData = new ArrayList<Map>();
		List<PkhInformation> list = service.findFanPinTj();
		System.out.print(list);
		for (PkhInformation visit : list) {
			Map map = new HashMap();
			legend.add(visit.getCountry());
			map.put("value", visit.getCountc());
			map.put("name", visit.getCountry());
			serisData.add(map);
		}
		List<Series> series = new ArrayList<Series>();// 纵坐标
		series.add(new Series("总数比较", "pie", serisData));
		EchartData data = new EchartData(legend, category, series);
		return data;
	}

	@RequestMapping(value = "/jsp/form", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String form(HttpServletRequest request,PkhInformation mu) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		InputStream in = null;
		String msg = null;
		MultipartFile file = multipartRequest.getFile("upfile");

		if (file.isEmpty()) {
			throw new Exception("文件不存在！");
		}
		in = file.getInputStream();
		mu = new ImportExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
		in.close();
		service.addPku(mu);

		//该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
		//service.addPku(mu);
		return "导入成功";
	}
}
