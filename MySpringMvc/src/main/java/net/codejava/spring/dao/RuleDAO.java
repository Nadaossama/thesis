package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Rule;

public interface RuleDAO {
	
public void saveOrUpdate(Rule rule);
    
    public void delete(int ruleID);
     
    public List<Rule> get(int powerPlantID);

}
