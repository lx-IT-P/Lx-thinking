package service.impl;


import dao.CountryDao;
import dao.SfcqkDao;
import entity.Country;
import entity.Sfcqk;
import org.springframework.stereotype.Service;
import service.CountryService;
import service.SfcqkService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {
    @Resource
    private CountryDao dao;
    public List<Country> findAll() {
        return dao.findAll();
    }

}
