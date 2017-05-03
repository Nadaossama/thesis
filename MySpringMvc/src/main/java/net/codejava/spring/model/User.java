package net.codejava.spring.model;

import lombok.Data;

public @Data class User {
    private int ID;
    private String username;
    private String password;

    public User(){
    }
    public User(String username, String password)
    {
    	this.username = username;
    	this.password = password;
    }
}
