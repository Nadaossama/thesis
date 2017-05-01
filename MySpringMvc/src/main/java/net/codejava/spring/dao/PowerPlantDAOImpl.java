package net.codejava.spring.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import net.codejava.spring.model.Device;

public class PowerPlantDAOImpl implements PowerPlantDAO{

	private JdbcTemplate jdbcTemplate;
	 
    public PowerPlantDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	@Override
	public void saveOrUpdate(Device device) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int powerplantId) {
		  // implementation details goes here...
    	String sql = "DELETE FROM PowerPlant WHERE ID=?";
        jdbcTemplate.update(sql, powerplantId);
		
	}

	@Override
	public Device get(int deviceId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Device> list() {
		// TODO Auto-generated method stub
		return null;
	}

}
