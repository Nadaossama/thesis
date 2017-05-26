package net.codejava.spring.dao;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.codejava.spring.model.PowerPlant;

public class PowerPlantDAOImpl implements PowerPlantDAO{
	private JdbcTemplate jdbcTemplate;
	 
    public PowerPlantDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	@Override
	public void delete(int powerplantId) {
		  // implementation details goes here...
    	String sql = "DELETE FROM PowerPlant WHERE ID=?";
        jdbcTemplate.update(sql, powerplantId);
		
	}
	@Override
	public List<String> listNames() {
		// TODO Auto-generated method stub
		String sql = "SELECT ID,Name FROM PowerPlant";
        List<String> listPowerPlantNames = jdbcTemplate.query(sql, new RowMapper<String>() {
     
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString("ID") + rs.getString("Name");
            }
     
        });
     
        return listPowerPlantNames;
	}
	@Override
	public void saveOrUpdate(PowerPlant powerPlant) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public PowerPlant get(int powerPlantId) {
		// TODO Auto-generated method stub
		return null;
	}

}
