package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Device;

public interface PowerPlantDAO {

	public void saveOrUpdate(Device device);
    
    public void delete(int deviceId);
     
    public Device get(int deviceId);
     
    public List<Device> list();
    
}
