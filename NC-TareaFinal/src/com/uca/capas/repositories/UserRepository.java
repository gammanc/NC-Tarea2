package com.uca.capas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.uca.capas.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	public User findFirstByUsernameAndPassword(String username, String clave);
}
