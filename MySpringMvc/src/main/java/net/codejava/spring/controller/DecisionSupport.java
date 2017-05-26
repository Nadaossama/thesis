package net.codejava.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
			 List<String> PowerPlantName = this.powerPlantDAO.listNames();
			    model.addObject("nameOfList", PowerPlantName);
			    model.setViewName("DecisionSupportForm");
			    return model;
		}
	 
	 @RequestMapping(value= "/GetRules", method = RequestMethod.POST)
	 public @ResponseBody ModelAndView GetRules(ModelAndView model,@ModelAttribute("PowerPlant") PowerPlant pp){
		 System.out.println(powerPlantDAO.get(pp.getName().charAt(0)));
		return model;
		 
		 
	 }
}
