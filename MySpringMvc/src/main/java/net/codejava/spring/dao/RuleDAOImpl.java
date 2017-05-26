package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Rule;

public class RuleDAOImpl implements RuleDAO{

	
	private JdbcTemplate jdbcTemplate;
	 
    public RuleDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	@Override
	public void saveOrUpdate(Rule rule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int ruleID) {
		String sql = "DELETE FROM Rule WHERE ID=?";
        jdbcTemplate.update(sql, ruleID);
		
	}

	@Override
	public List<Rule> get(int powerPlantID) {
		String sql = "SELECT Name FROM Rule WHERE Sensor_PowerPlant_ID =" + powerPlantID ;
      List<Rule> listRules  = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Rule>(Rule.class));
        return listRules;
	}
	

}
