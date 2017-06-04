package net.codejava.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import net.codejava.spring.dao.PowerPlantDAO;
import net.codejava.spring.dao.RuleDAO;
import net.codejava.spring.model.PowerPlant;
import net.codejava.spring.model.PowerPlantList;
import net.codejava.spring.model.Rule;

@Controller
@Configuration
@ComponentScan("net.codejava.spring") // No need to include component-scan in
										// xml
@RequestMapping("decisionSupport")
@RestController
public class DecisionSupport {

	@Autowired
	public PowerPlantDAO powerPlantDAO;

	@Autowired
	public RuleDAO ruleDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView ShowDecisionSupportForm(ModelAndView model) {
		// PowerPlantList pp = new PowerPlantList();
		List<PowerPlant> PowerPlantName = this.powerPlantDAO.listNames();
		// model.addObject("PowerPlant", new PowerPlant());
		// pp.setPowerPlants(PowerPlantName);
		model.addObject("PowerPlantList", PowerPlantName);
		// model.addObject("PowerPlant",new PowerPlant());
		model.setViewName("DecisionSupportForm");
		return model;
	}

	@RequestMapping(value = "/GetRules", method = RequestMethod.POST)
	@ResponseBody
	public String GetRules(@RequestParam(value = "selectedValue") String dropdownValue) {
		ModelAndView model = new ModelAndView();
		model.setViewName("DecisionSupportForm");
		String Predecessor = this.ruleDAO.Get2Predecessor(dropdownValue);
		if (Predecessor != null) {
			List<Rule> Rules = powerPlantDAO.GetRules(Predecessor);
			List<String> toDoList = new ArrayList<String>();
			for (Rule rule : Rules) {
				System.out.println(rule.getID());
				if (rule.getID().equals("Water Level")) {
					toDoList.add(ruleDAO.WaterLevel(rule.getParameters(), rule.getPowerPlantID()));
				} else if (rule.getID().equals("Turbidity")) {
					toDoList.add(ruleDAO.Turbidity(rule.getParameters(), rule.getPowerPlantID()));
				} else if (rule.getID().equals("Water Temperature")) {
					toDoList.add(ruleDAO.WaterTemperature(rule.getParameters(), rule.getPowerPlantID()));
				} else if (rule.getID().equals("Rack Cleaning")) {
					toDoList.add(ruleDAO.RackCleaning(rule.getParameters(), rule.getPowerPlantID()));
				} else if (rule.getID().equals("No Energy Output")) {
					toDoList.add(ruleDAO.NoEnergyOutput(rule.getParameters(), rule.getPowerPlantID()));
				}

			}

			// create a new Gson instance
			Gson gson = new Gson();
			// convert your list to json
			String jsonRules = gson.toJson(toDoList);
			return jsonRules;
		}
		return "";

	}
}
