package net.codejava.springmvc;

public class Device {
	 private String name;
	    private String IPAddress;
	 
	    // getters and setters are removed for brevity.
	 
	    public String toString() {
	        return String.format("[%s - %s - %s - %s]", name, IPAddress);
	    }
	    public void setName(String name) {
	       this.name=name;;
	    }
	    public void setIPAddress(String IPAddress) {
		       this.IPAddress=IPAddress;;
		    }

}
