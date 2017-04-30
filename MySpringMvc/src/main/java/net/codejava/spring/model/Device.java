package net.codejava.spring.model;

import lombok.Data;

public @Data class Device {

	private int ID;
    private String Name;
    private String IPaddress;
 
    public Device() {
    }
 
    public Device(String Name, String IPaddress) {
        this.Name = Name;
        this.IPaddress = IPaddress;
    }
 
    // getters and setters
    
}
