package net.codejava.springmvc;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.sql.ResultSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		//Initialize Database connection
		SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
		 
		// code to set driver class name, database URL, username and password
		 

		
		  try {
			dataSource.setDriver(new com.mysql.jdbc.Driver());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        dataSource.setUrl("jdbc:mysql://localhost/spring_database");
	        dataSource.setUsername("root");
	        dataSource.setPassword("amadeus");
	        
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			
			 String sqlSelect = "SELECT * FROM Device";
		        List<Device> listDevice = jdbcTemplate.query(sqlSelect, new RowMapper<Device>() {
		 
		            public Device mapRow(ResultSet result, int rowNum) throws SQLException {
		            	Device Device = new Device();
		                Device.setName(result.getString("Name"));
		                Device.setIPAddress(result.getString("IPAddress"));
		                 
		                return Device;
		            }
		             
		        });
		         
		        for (Device aDevice : listDevice) {
		            System.out.println(aDevice);
		        }
		         
		        
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
	    String greetings = "Greetings, Spring MVC!";
	    model.addAttribute("message", greetings);
	 
	    return "test";
	}
	
}
