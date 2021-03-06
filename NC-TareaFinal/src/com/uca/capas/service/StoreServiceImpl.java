package com.uca.capas.service;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.uca.capas.domain.Store;
import com.uca.capas.repositories.StoreRepository;

@Service
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
	@Transactional
	public Store saveStore(Store st) throws DataAccessException {
		return storeRepository.save(st);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteStore(int st) throws DataAccessException {
		Store store = findOne(st);
		storeRepository.delete(store);
	}

	@Override
	public Store fetchStoreWithEmployeesById(Integer id) throws DataAccessException {
		return storeRepository.fetchStoreWithEmployeesById(id);
	}

}
