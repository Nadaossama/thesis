package net.codejava.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.PowerPlantDAO;
import net.codejava.spring.model.PowerPlant;

@Controller
@Configuration
@ComponentScan("net.codejava.spring") // No need to include component-scan in xml
@RequestMapping("decisionSupport")
public class DecisionSupport {
	
	 @Autowired
	    public PowerPlantDAO powerPlantDAO;
	

	 @RequestMapping(value= "/", method = RequestMethod.GET)
		public ModelAndView ShowDecisionSupportForm(ModelAndView model) {
			 List<PowerPlant> PowerPlantName = this.powerPlantDAO.listNames();
			 //model.addObject("PowerPlant", new PowerPlant());
			    model.addObject("PowerPlantList", PowerPlantName);
			    model.setViewName("DecisionSupportForm");
			    return model;
		}
	 
	 @RequestMapping(value= "/GetRules", method = RequestMethod.POST)
	 public ModelAndView GetRules(ModelAndView model){
		 
		 System.out.println("Nada");
		return model;
		 
		 
	 }
}
