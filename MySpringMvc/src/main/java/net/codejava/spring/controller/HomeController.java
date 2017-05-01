package net.codejava.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.codejava.spring.dao.DeviceDAO;
import net.codejava.spring.model.Device;

@Controller
@Configuration
@ComponentScan("net.codejava.spring") // No need to include component-scan in xml
public class HomeController {

	 @Autowired
	    private DeviceDAO deviceDAO;
	
	@RequestMapping(value="/")
	public ModelAndView listDevice(ModelAndView model) throws IOException{
	    List<Device> listDevice = deviceDAO.list();
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
	    int deviceId = Integer.parseInt(request.getParameter("ID"));
	    Device device = deviceDAO.get(deviceId);
	    
	    ModelAndView model = new ModelAndView("DeviceForm");
	    model.addObject("Device", device);
	    return model;
	}
	
	@RequestMapping(value= "/dataVisualization", method = RequestMethod.GET)
	public ModelAndView ShowDataVisualizatioForm(ModelAndView model) {
		    model.setViewName("DataVisualizationForm");
		    
		    return model;
	}
	
	@RequestMapping(value= "/decisionSupport", method = RequestMethod.GET)
	public ModelAndView ShowDecisionSupportForm(ModelAndView model) {
		    model.setViewName("DecisionSupportForm");
		    return model;
	}
}
