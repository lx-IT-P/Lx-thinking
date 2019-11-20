package service;

import java.util.List;
import java.util.Set;

import entity.PkhInformation;

/**
 * service层接口
 * @author Administrator
 * @date 2018年12月10日
 */
public interface PkhServiceDao {
	/**
	 * 查询所有数据的方法
	 * @return
	 */
	public List<PkhInformation> findAll();

	public List<PkhInformation> findByNamePku(String musicName);
	/**
	 * 根据id删除数据的方法
	 * @param id
	 */
	public void delPku(int id);
	/**
	 * 添加数据的方法
	 * @param mu
	 */
	public void addPku(PkhInformation mu);
	/**
	 * 根据id得到数据
	 * @param id
	 * @return
	 */
	public PkhInformation findPkuById(int id);
	/**
	 * 修改数据的方法
	 * @param mu
	 */
	public void updatePku(PkhInformation mu);
	public Set<PkhInformation> selectCity();
	public List<PkhInformation> findPkuByCity(String country);
	public List<PkhInformation> findFanPinByCity(String country);
	public List<PkhInformation> findTuoPin();
	public List<PkhInformation> findFanPin();
	public List<PkhInformation> findFanPinTj();
}
