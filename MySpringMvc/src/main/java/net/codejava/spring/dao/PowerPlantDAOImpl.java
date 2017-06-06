package net.codejava.spring.dao;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.codejava.spring.model.Device;
import net.codejava.spring.model.PowerPlant;
import net.codejava.spring.model.Rule;

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
	public List<PowerPlant> listNames() {
		// TODO Auto-generated method stub
		String sql = "SELECT ID,Name FROM PowerPlant";
        List<PowerPlant> listPowerPlantNames = jdbcTemplate.query(sql, new RowMapper<PowerPlant>() {
     
            @Override
            public PowerPlant mapRow(ResultSet rs, int rowNum) throws SQLException {
                PowerPlant aPowerPlant = new PowerPlant();
                aPowerPlant.setID(rs.getInt("ID"));
                aPowerPlant.setName(rs.getString("Name"));
                return aPowerPlant;
            }
     
        });
     
        return listPowerPlantNames;
	}
	@Override
	public void saveOrUpdate(PowerPlant powerPlant) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String getDeviceID(String powerPlantId) {
		String sql = "SELECT Device_ID FROM PowerPlant WHERE ID=?";
//		int device_ID = jdbcTemplate.query(sql, powerPlantId);

		String device_ID = (String)jdbcTemplate.queryForObject(
				sql, new Object[] { powerPlantId }, String.class);
		return device_ID;
	}
	
	public List<String> getWaterLevelValues(int powerPlantId, String DeviceID)
	{
		
		String sql = "SELECT loValue FROM Sensor_Values WHERE Sensor_PowerPlant_ID =" + powerPlantId +" AND Sensor_PowerPlant_Device_ID =" + DeviceID +" AND Sensor_Type_ID= 8 ";
		List<String> Data = new ArrayList<String>();
		Data = jdbcTemplate.queryForList(sql,String.class);
		
		return Data;

	}
	
	public List<String> getWaterLevelValues(int powerPlantId, String From, String To, String DeviceID)
	{
		
		String sql = "SELECT loValue FROM Sensor_Values WHERE Sensor_PowerPlant_ID =" + powerPlantId +" AND Sensor_PowerPlant_Device_ID =" + DeviceID +" AND Sensor_Type_ID= 8 AND loTs BETWEEN " + From + " AND " + To + " GROUP BY FLOOR(TO_SECONDS(loTs)/86400)";
		//System.out.println(sql);
		List<String> Data = new ArrayList<String>();
		Data = jdbcTemplate.queryForList(sql,String.class);
		
		return Data;

	}
	
	public List<String> getEnergyOutputValues(int powerPlantId, String DeviceID)
	{
		
		String sql = "SELECT loValue FROM Sensor_Values WHERE Sensor_PowerPlant_ID =" + powerPlantId +" AND Sensor_PowerPlant_Device_ID =" + DeviceID +" AND Sensor_Type_ID= 4";
		List<String> Data = new ArrayList<String>();
		Data = jdbcTemplate.queryForList(sql,String.class);
		
		return Data;

	}
	
	public List<String> getEnergyOutputValues(int powerPlantId, String From, String To, String DeviceID)
	{
		
		String PowerOutput = "SELECT avg(loValue) From Sensor_Values WHERE Sensor_PowerPlant_ID ="
				+ powerPlantId + " AND Sensor_PowerPlant_Device_ID="  + DeviceID +" AND Sensor_Type_ID= 4 AND loTs BETWEEN " + From + " AND " + To + " GROUP BY FLOOR(TO_SECONDS(loTs)/86400)";
		
		//System.out.println(PowerOutput);
		List<String> Data = jdbcTemplate.queryForList(PowerOutput, String.class);
		
		//List<String> Result = jdbcTemplate.queryForList(Data,String.class);
		
		return Data;

	}
	
	public List<String> getTimestampValues(int powerPlantId, String From, String To, String DeviceID)
	{
		
		String PowerOutput = "SELECT CAST(AVG(loTs) AS DATETIME) time From Sensor_Values WHERE Sensor_PowerPlant_ID ="
				+ powerPlantId + " AND Sensor_PowerPlant_Device_ID="  + DeviceID +" AND Sensor_Type_ID= 4 AND loTs BETWEEN " + From + " AND " + To + " GROUP BY FLOOR(TO_SECONDS(loTs)/86400)";
		//System.out.println(PowerOutput);
		List<String> Data = jdbcTemplate.queryForList(PowerOutput, String.class);
		//List<String> Result = jdbcTemplate.queryForList(Data,String.class);
		
		return Data;

	}
	@Override
	public List<Rule> GetRules(String powerPlantId) {
		
		String sql = "SELECT * FROM Rule WHERE Sensor_PowerPlant_ID=" + powerPlantId;
        List<Rule> listRules = jdbcTemplate.query(sql, new RowMapper<Rule>() {
     
            @Override
            public Rule mapRow(ResultSet rs, int rowNum) throws SQLException {
                Rule aRule = new Rule();
                aRule.setID(rs.getString("ID"));
                aRule.setParameters(rs.getString("Parameters"));
                return aRule;
            }
     
        });
     
        return listRules;
		// TODO Auto-generated method stub
	}

}
