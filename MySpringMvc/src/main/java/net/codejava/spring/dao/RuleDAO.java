package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Rule;

public interface RuleDAO {
	
public void saveOrUpdate(Rule rule);
    
    public void delete(int ruleID);
     
    public List<Rule> get(int powerPlantID);
    
    public String WaterLevel(String parameters , String PowerPlantID);
    
    public String Turbidity(String parameters , String PowerPlantID);

    public String WaterTemperature(String parameters , String PowerPlantID);
    
    public String RackCleaning(String parameters , String PowerPlantID);
    
    public String NoEnergyOutput(String parameters , String PowerPlantID);
    
    public String Get2Predecessor( String PowerPlantID);
    
}
