package service.impl;


import dao.CountryDao;
import dao.JtqkDao;
import entity.Country;
import entity.Jtqk;
import org.springframework.stereotype.Service;
import service.CountryService;
import service.JtqkService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class JtqkServiceImpl implements JtqkService {
    @Resource
    private JtqkDao dao;
    public List<Jtqk> findAll() {
        return dao.findAll();
    }

    @Override
    public Jtqk findJtqkById(int id) {
        return dao.findJtqkById(id);
    }

    @Override
    public List<Jtqk> findByNameJtqk(String musicName) {
        return dao.findByNameJtqk(musicName);
    }

}
