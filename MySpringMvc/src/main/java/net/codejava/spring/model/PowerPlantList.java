package net.codejava.spring.model;
import java.util.List;

import lombok.Data;

public @Data class PowerPlantList {

    private List<PowerPlant> PowerPlants;
    private int SelectedPPID;
    
    public PowerPlantList() {
    }
 
    public PowerPlantList(List<PowerPlant> PowerPlants) {
      this.PowerPlants = PowerPlants;
    }
}
