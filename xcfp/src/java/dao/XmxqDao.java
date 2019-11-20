package dao;
import entity.xmxq;
import java.util.List;

public interface XmxqDao {
    public List<xmxq> findAll();
    public List<xmxq> findByNameXmxq(String name);
}
