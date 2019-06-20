package com.uca.capas.service;


import org.springframework.dao.DataAccessException;

import com.uca.capas.domain.User;

public interface UserService {
	public User findByUserandPass(String user, String pass) throws DataAccessException;
}
