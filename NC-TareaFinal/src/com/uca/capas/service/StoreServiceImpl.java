package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.uca.capas.domain.Store;
import com.uca.capas.repositories.StoreRepository;

public class StoreServiceImpl implements StoreService {
	
	@Autowired
	StoreRepository storeRepository;
	
	@Override
	public List<Store> findAll() throws DataAccessException {
		return storeRepository.findAll();
	}

	@Override
	public Store findOne(Integer id) throws DataAccessException {
		return storeRepository.findById(id).get();
	}

	@Override
	public Store saveStore(Store st) throws DataAccessException {
		return storeRepository.save(st);
	}

}
