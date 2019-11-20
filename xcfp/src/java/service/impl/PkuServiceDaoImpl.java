package service.impl;

import java.util.List;
import java.util.Set;

import dao.PkhDao;
import entity.PkhInformation;

import org.springframework.stereotype.Service;
import service.PkhServiceDao;

import javax.annotation.Resource;


/**
 * service层实现类
 * @author Administrator
 * @date 2018年12月10日
 */
@Service
public class PkuServiceDaoImpl implements PkhServiceDao {
	@Resource
	private PkhDao dao ;

	public List<PkhInformation> findAll() {
		return dao.findAll();
	}

	public List<PkhInformation> findTuoPin() {
		return dao.findTuoPin();
	}

	@Override
	public List<PkhInformation> findFanPin() {
		return dao.findFanPin();	}

	@Override
	public List<PkhInformation> findFanPinTj() {
		return dao.findFanPinTj();
	}

	@Override
	public void delPku(int id) {
		dao.delPku(id);
	}

	@Override
	public void addPku(PkhInformation mu) {
		dao.addPku(mu);
	}

	@Override
	public PkhInformation findPkuById(int id) {
		return dao.findPkuById(id);
	}

	@Override
	public void updatePku(PkhInformation mu) {
		dao.updatePku(mu);
	}

	@Override
	public List<PkhInformation> findByNamePku(String musicName) {
		return dao.findByNamePku(musicName);
	}

    public Set<PkhInformation> selectCity() {
		return dao.selectCity();
    }
	@Override
	public List<PkhInformation> findPkuByCity(String country) {
		return dao.findPkuByCity(country);
	}
	@Override
	public List<PkhInformation> findFanPinByCity(String country) {
		return dao.findFanPinByCity(country);
	}
}
