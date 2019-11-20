package service.impl;


import dao.XmxqDao;
import entity.xmxq;
import org.springframework.stereotype.Service;
import service.XmxqService;

import javax.annotation.Resource;
import java.util.List;
@Service
public class XmxqServiceImpl implements XmxqService {
    @Resource
    private XmxqDao dao;
    public List<xmxq> findAll() {
        return dao.findAll();
    }
    @Override
    public List<xmxq> findByNameXmxq(String name) {
        return dao.findByNameXmxq(name);
    }
}
