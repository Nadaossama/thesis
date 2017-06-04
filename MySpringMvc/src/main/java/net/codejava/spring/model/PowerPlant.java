package net.codejava.spring.model;

import lombok.Data;

public @Data class PowerPlant {
	
	private int ID;
    private String Name;
    private String Coordinates;
    private String Distance_predecessor;
    private String Distance_successor;
    private int Device_ID;
 
    public PowerPlant() {
    }
 
    public PowerPlant(String Name, String Coordinates, String Distance_predecessor, String Distance_successor, int Device_ID) {
        this.Name = Name;
        this.Coordinates = Coordinates;
        this.Distance_predecessor = Distance_predecessor;
        this.Distance_successor = Distance_successor;
        this.Device_ID = Device_ID;
    }

}
