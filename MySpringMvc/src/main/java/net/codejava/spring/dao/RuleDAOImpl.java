package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
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
	public String Get2Predecessor(String PowerPlantID) {
		String sql = "SELECT Predeccessor_PP_ID FROM Successor_Predeccessor WHERE successor_PP_ID =?";
		try {
			String successor = (String) jdbcTemplate.queryForObject(sql, new Object[] { PowerPlantID }, String.class);
			//System.out.println(successor);
			return successor;

		} catch (EmptyResultDataAccessException e) {
			return PowerPlantID;
		}
	}

	@Override
	public String WaterLevel(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		// sensor_Type_ID = 8
		return "water level";
	}

	@Override
	public String Turbidity(String parameters, String PowerPlantID) {
		// sensor_Type_ID = 1
		// TODO Auto-generated method stub
		return "Turbidity";
	}

	@Override
	public String WaterTemperature(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		return "Water temperature";
	}

	@Override
	public String RackCleaning(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		// sensor_Type_ID = 11
		return "Rack Cleaning";
	}

	@Override
	public String NoEnergyOutput(String parameters, String PowerPlantID) {
		// TODO Auto-generated method stub
		// sensor_Type_ID = 4
		return "No Energy output";
	}

}
