package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.PowerPlant;

public interface PowerPlantDAO {

	public void saveOrUpdate(PowerPlant powerPlant);
    
    public void delete(int powerPlantId);
     
    public PowerPlant get(int powerPlantId);
     
    public List<PowerPlant> listNames();
    
}
