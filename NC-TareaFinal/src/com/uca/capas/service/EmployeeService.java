package com.uca.capas.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Employee;

@Service
public interface EmployeeService {
	public List<Employee> findAll() throws DataAccessException;
	
	public Employee findOne(Integer id) throws DataAccessException;
	
	public Employee saveEmployee(Employee emp) throws DataAccessException;
}
