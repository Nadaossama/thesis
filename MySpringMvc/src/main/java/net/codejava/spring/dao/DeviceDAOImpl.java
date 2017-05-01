package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
 
import javax.sql.DataSource;
 
import net.codejava.spring.model.Device;
 
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

public class DeviceDAOImpl implements DeviceDAO {
	private JdbcTemplate jdbcTemplate;
	 
    public DeviceDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
 
    @Override
    public void saveOrUpdate(Device device) {
        // implementation details goes here...
    	System.out.println(device.getName());
    	System.out.println(device.getIPaddress());
    	System.out.println(device.getID());
    	 if (device.getID() > 0) {
    	        // update
    	        String sql = "UPDATE Device SET Name=?, IPaddress=? WHERE ID=?";
    	        int status = jdbcTemplate.update(sql, device.getName() ,device.getIPaddress(), device.getID());
    	    } else {
    	        // insert
    	        String sql = "INSERT INTO Device (Name, IPaddress)"
    	                    + " VALUES (?, ?)";
    	        jdbcTemplate.update(sql, device.getName(),
    	                device.getIPaddress());
    	    }
    }
 
    @Override
    public void delete(int deviceId) {
        // implementation details goes here...
    	String sql = "DELETE FROM Device WHERE ID=?";
        jdbcTemplate.update(sql, deviceId);
    }
 
    @Override
    public List<Device> list() {
        // implementation details goes here...
    	String sql = "SELECT * FROM Device";
        List<Device> listDevice = jdbcTemplate.query(sql, new RowMapper<Device>() {
     
            @Override
            public Device mapRow(ResultSet rs, int rowNum) throws SQLException {
            	Device aDevice = new Device();
     
            	aDevice.setID(rs.getInt("ID"));
                aDevice.setName(rs.getString("Name"));
                aDevice.setIPaddress(rs.getString("IPaddress"));
     
//                System.out.println(aDevice.getName());
                return aDevice;
            }
     
        });
     
        return listDevice;
    }
 
    @Override
    public Device get(int deviceId) {
        // implementation details goes here...
    	String sql = "SELECT * FROM Device WHERE ID=" + deviceId;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Device>() {
        	
        	
            @Override
            public Device extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Device device = new Device();
                	device.setID(rs.getInt("ID"));
                	device.setName(rs.getString("Name"));
                	device.setIPaddress(rs.getString("IPaddress"));
                    return device;
                }
     
                return null;
            }
     
        });
    }

}
