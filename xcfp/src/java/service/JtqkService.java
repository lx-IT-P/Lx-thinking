package service;

import entity.Country;
import entity.Jtqk;

import java.util.List;

public interface JtqkService {
    public List<Jtqk> findAll();
    public Jtqk findJtqkById(int id);
    public List<Jtqk> findByNameJtqk(String musicName);
}
