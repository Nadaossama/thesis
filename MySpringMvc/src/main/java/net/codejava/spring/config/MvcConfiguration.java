package net.codejava.spring.config;

import javax.sql.DataSource;

import net.codejava.spring.dao.DeviceDAO;
import net.codejava.spring.dao.DeviceDAOImpl;
import net.codejava.spring.dao.PowerPlantDAO;
import net.codejava.spring.dao.PowerPlantDAOImpl;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.AbstractHandlerMapping;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages="net.codejava.spring")
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter{

	@Bean
	public ViewResolver getViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
//		registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");
	}
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	    configurer.enable();
	}
	
//	@Override
//	@Bean
//	public HandlerMapping resourceHandlerMapping() {
//	    AbstractHandlerMapping handlerMapping = (AbstractHandlerMapping) super.resourceHandlerMapping();
//	    handlerMapping.setOrder(-1);
//	    return handlerMapping;
//	}

	 @Bean
	    public DataSource getDataSource() {
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
	        dataSource.setUrl("jdbc:mysql://localhost:3306/spring_database");
	        dataSource.setUsername("root");
	        dataSource.setPassword("amadeus");
	         
	        return dataSource;
	    }
	     
	    @Bean
	    public DeviceDAO getDeviceDAO() {
	        return new DeviceDAOImpl(getDataSource());
	    }
	    
	    @Bean
	    public PowerPlantDAO getPowerPlantDAO() {
	        return new PowerPlantDAOImpl(getDataSource());
	    }
}
