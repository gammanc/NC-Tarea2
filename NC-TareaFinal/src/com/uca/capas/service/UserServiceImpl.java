package com.uca.capas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.uca.capas.domain.User;
import com.uca.capas.repositories.UserRepository;

public class UserServiceImpl implements UserService{

	@Autowired
	UserRepository userRepository;
	
	@Override
	public User findByUserandPass(String user, String pass) throws DataAccessException {
		return userRepository.findFirstByUsuarioAndClave(user, pass);
	}
	
}
