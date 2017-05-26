package net.codejava.spring.model;

import lombok.Data;

public @Data class Rule {
	private String ID;
    private String Description;
    private int Sensor_ID;
    private int Sensor_PowerPlant_ID;
    private int Sensor_PowerPlant_Device_ID;
 
    public Rule() {
    }
 
    public Rule(String ID, String Description, int Sensor_ID, int Sensor_PowerPlant_ID, int Sensor_PowerPlant_Device_ID) {
        this.ID = ID;
        this.Description = Description;
        this.Sensor_ID = Sensor_ID;
        this.Sensor_PowerPlant_ID = Sensor_PowerPlant_ID;
        this.Sensor_PowerPlant_Device_ID = Sensor_PowerPlant_Device_ID;
    }

}
