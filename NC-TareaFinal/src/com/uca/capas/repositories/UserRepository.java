package com.uca.capas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	public User findFirstByUsuarioAndClave(String username, String clave);
}
