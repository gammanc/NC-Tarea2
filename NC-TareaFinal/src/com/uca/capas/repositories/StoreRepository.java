package com.uca.capas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.uca.capas.domain.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, Integer> {
	
	@Transactional(readOnly = true)
	@Query(value = "SELECT s FROM Store s JOIN FETCH s.employees WHERE s.code = ?1")
	Store fetchStoreWithEmployeesById(Integer id);
}
