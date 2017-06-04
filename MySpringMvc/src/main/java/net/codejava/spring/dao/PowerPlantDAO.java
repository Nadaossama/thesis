package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.PowerPlant;
import net.codejava.spring.model.Rule;

public interface PowerPlantDAO {

	public void saveOrUpdate(PowerPlant powerPlant);
    
    public void delete(int powerPlantId);
     
    public String getDeviceID(String powerPlantId);
     
    public List<PowerPlant> listNames();
    
    public List<Rule> GetRules(String powerPlantId);
    
    public List<String> getWaterLevelValues(int powerPlantId, String From, String To, String DeviceID);
    
    public List<String> getWaterLevelValues(int powerPlantId, String DeviceID);
    
    public List<String> getEnergyOutputValues(int powerPlantId, String From, String To, String DeviceID);
    
    public List<String> getEnergyOutputValues(int powerPlantId, String DeviceID);
    
}
