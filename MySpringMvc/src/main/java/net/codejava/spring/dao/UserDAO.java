package net.codejava.spring.dao;

import net.codejava.spring.model.User;

public interface UserDAO {
	    User findByUsername(String username);
	}
