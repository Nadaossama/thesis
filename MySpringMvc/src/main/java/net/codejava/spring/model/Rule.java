package net.codejava.spring.model;

import lombok.Data;

public @Data class Rule {
	
	String ID;
	String parameters;
	String PowerPlantID;

	public Rule(String ID, String parameters , String PowerPlantID ){
		this.ID = ID;
		this.parameters = parameters;
		this.PowerPlantID = PowerPlantID;
	}
	
	public Rule(){
	}
	
	
}
