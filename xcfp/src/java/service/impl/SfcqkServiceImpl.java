package service.impl;


import dao.SfcqkDao;
import dao.XmxqDao;
import entity.Sfcqk;
import entity.xmxq;
import org.springframework.stereotype.Service;
import service.SfcqkService;
import service.XmxqService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SfcqkServiceImpl implements SfcqkService {
    @Resource
    private SfcqkDao dao;
    public List<Sfcqk> findAll() {
        return dao.findAll();
    }

}
