package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.User;

public class UserDAOImpl implements UserDAO{
		private JdbcTemplate jdbcTemplate;
		 
	    public UserDAOImpl(DataSource dataSource) {
	        jdbcTemplate = new JdbcTemplate(dataSource);
	    }
	    
	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM User WHERE Username=" + username ;
        jdbcTemplate.query(sql,new RowMapper<User>() {
     
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            	User aUser = new User();
     
            	aUser.setID(rs.getInt("ID"));
            	aUser.setUsername(rs.getString("Username"));
            	aUser.setPassword(rs.getString("Password"));
     
//                System.out.println(aDevice.getName());
                return aUser;
            }
     
        });
		return null;
	}
	

}
