package com.uca.capas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.uca.capas.domain.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, Integer> {
	
	
}
