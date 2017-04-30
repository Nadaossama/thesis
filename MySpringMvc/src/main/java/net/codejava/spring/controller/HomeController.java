package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.DeviceDAO;
import net.codejava.spring.model.Device;

@Controller
@Configuration
@ComponentScan("net.codejava.spring") // No need to include component-scan in xml
public class HomeController {

	 @Autowired
	    private DeviceDAO deviceDAO;
	 
//	    public static final String home = "/";
//	    public static final String newDevice = "/newDevice";
//	    public static final String saveDevice = "/saveDevice";
//	    public static final String deleteDevice = "/deleteDevice";
//	    public static final String editDevice = "/editDevice";
	    
//	@RequestMapping(value="/")
//	public ModelAndView test(HttpServletResponse response) throws IOException{
//		return new ModelAndView("home");
//	}
	
	@RequestMapping(value="/")
	public ModelAndView listDevice(ModelAndView model) throws IOException{
	    List<Device> listDevice = deviceDAO.list();
//	    for (Device item : listDevice) {
//	        System.out.println(item.getName());
//	    }
	    model.addObject("listDevice", listDevice);
	    model.setViewName("home");
	 
	    return model;
	}
	
	@RequestMapping(value= "/newDevice", method = RequestMethod.GET)
	public ModelAndView newDevice(ModelAndView model) {
	    Device newDevice = new Device();
	    model.addObject("Device", newDevice);
	    model.setViewName("DeviceForm");
	    return model;
	}
	
	@RequestMapping(value = "/saveDevice", method = RequestMethod.POST)
	public ModelAndView saveDevice(@ModelAttribute Device device) {
		System.out.print("blabla");
	    deviceDAO.saveOrUpdate(device);
	    return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/deleteDevice", method = RequestMethod.GET)
	public ModelAndView deleteDevice(HttpServletRequest request) {
	    int deviceId = Integer.parseInt(request.getParameter("ID"));
	    deviceDAO.delete(deviceId);
	    return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/editDevice", method = RequestMethod.GET)
	public ModelAndView editDevice(HttpServletRequest request) {
		System.out.println("in edit Device" +request.getParameter("ID") );
	    int deviceId = Integer.parseInt(request.getParameter("ID"));
	    Device device = deviceDAO.get(deviceId);
	    ModelAndView model = new ModelAndView("DeviceForm");
	    model.addObject("device", device);
	 
	    return model;
	}
}
