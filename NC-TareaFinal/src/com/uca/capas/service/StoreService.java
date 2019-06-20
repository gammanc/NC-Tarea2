package com.uca.capas.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.uca.capas.domain.Store;

public interface StoreService {
	public List<Store> findAll() throws DataAccessException;
	
	public Store findOne(Integer id) throws DataAccessException;
	
	public Store saveStore(Store st) throws DataAccessException;
}
