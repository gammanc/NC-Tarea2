package com.uca.capas.service;


import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.User;

@Service
public interface UserService {
	public User findByUserandPass(String user, String pass) throws DataAccessException;
}
