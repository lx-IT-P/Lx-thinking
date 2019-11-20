package service;



import entity.xmxq;

import java.util.List;

public interface XmxqService {
    /**
     * 查询所有数据的方法
     * @return
     */
    public List<xmxq> findAll();
    public List<xmxq> findByNameXmxq(String name);
}
