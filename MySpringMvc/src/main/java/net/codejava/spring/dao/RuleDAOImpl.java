package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Rule;

public class RuleDAOImpl implements RuleDAO {

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
		String sql = "SELECT Name FROM Rule WHERE Sensor_PowerPlant_ID =" + powerPlantID;
		List<Rule> listRules = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Rule>(Rule.class));
		return listRules;
	}

	@Override
	public String GetPredecessor(String PowerPlantID) {
		String sql = "SELECT Predeccessor_PP_ID FROM Successor_Predeccessor WHERE successor_PP_ID =?";
		try {
			String successor = (String) jdbcTemplate.queryForObject(sql, new Object[] { PowerPlantID }, String.class);
			// System.out.println(successor);
			return successor;

		} catch (EmptyResultDataAccessException e) {
			return PowerPlantID;
		}
	}

	@Override
	public String WaterLevel(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		// sensor_Type_ID = 8

		String sql = "SELECT avg(dt.loValue) FROM (SELECT loValue From Sensor_Values WHERE Sensor_PowerPlant_ID ="
				+ PowerPlantID + " AND Sensor_Type_ID= 5 GROUP BY CEIL(TO_SECONDS(loTs)/1800) ORDER by lots) dt";
		// List<String> Data = new ArrayList<String>();
		System.out.println(sql);
		String Data = jdbcTemplate.queryForObject(sql, new Object[] {}, String.class);
		System.out.println("Water Level " + Data);
		//System.out.println("Water Level" + Data);
		if (Data != null && Double.parseDouble(Data) >= Double.parseDouble(parameters)) {
			return "Water Level is High! Turn off Turbine and Activate Rack Cleaning.";
		} else {
			return "";
		}
		// return Data;
	}

	@Override
	public String Turbidity(String parameters, String PowerPlantID) {
		// sensor_Type_ID = 1
		// TODO Auto-generated method stub

		String sql = "SELECT avg(dt.loValue) FROM (SELECT loValue From Sensor_Values WHERE Sensor_PowerPlant_ID ="
				+ PowerPlantID + " AND Sensor_Type_ID= 2 GROUP BY CEIL(TO_SECONDS(loTs)/1800) ORDER by lots) dt";
		// List<String> Data = new ArrayList<String>();
		System.out.println(sql);
		String Data = jdbcTemplate.queryForObject(sql, new Object[] {}, String.class);
		System.out.println("Turbidity " + Data);
		if (Data != null) {
			if (Double.parseDouble(Data) >= Double.parseDouble(parameters)) {
				return "Turbidity of Water is High! Turn off Turbine and Activate Rack Cleaning.";
			} else {
				//System.out.println("in else");
				return "";
			}
		}
		return "";
	}

	@Override
	public String WaterTemperature(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		return "";
	}

	@Override
	public String RackCleaning(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		// sensor_Type_ID = 11	
		String sql = "SELECT avg(dt.loValue) FROM (SELECT loValue From Sensor_Values WHERE Sensor_PowerPlant_ID ="
				+ PowerPlantID + " AND Sensor_Type_ID= 11 GROUP BY CEIL(TO_SECONDS(loTs)/1800) ORDER by lots) dt";
		// System.out.println(sql);
		String Data = jdbcTemplate.queryForObject(sql, new Object[] {}, String.class);
		System.out.println("Rack Cleaning " + Data);
		if (Data != null) {
			if (Double.parseDouble(Data) < Double.parseDouble(parameters)) {
				return "There is an error at the Rack Cleaning.";
			} else {
				return "";
			}
		}
		return "";
	}

	@Override
	public String NoEnergyOutput(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		// sensor_Type_ID = 4

		String sql = "SELECT avg(dt.loValue) FROM (SELECT loValue From Sensor_Values WHERE Sensor_PowerPlant_ID ="
				+ PowerPlantID + " AND Sensor_Type_ID= 5 GROUP BY CEIL(TO_SECONDS(loTs)/1800) ORDER by lots) dt";
		String Data = jdbcTemplate.queryForObject(sql, new Object[] {}, String.class);

		if (Data != null && Double.parseDouble(Data) < Double.parseDouble(parameters)) {
			// Low water level
			String sql2 = "SELECT avg(dt.loValue) FROM (SELECT loValue From Sensor_Values WHERE Sensor_PowerPlant_ID ="
					+ PowerPlantID + " AND Sensor_Type_ID= 4 GROUP BY CEIL(TO_SECONDS(loTs)/1800) ORDER by lots) dt";
			String Data2 = jdbcTemplate.queryForObject(sql2, new Object[] {}, String.class);
			// No Energy Output
			if (Data2 != null && Double.parseDouble(Data2) <= 0) {
				return "Low water level and No energy output, Please Turn Off Turbine.";
			}
		}
		return "";
	}
}
