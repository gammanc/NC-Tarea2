package com.uca.capas.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Employee;
import com.uca.capas.dto.EmployeeDTO;

@Service
public interface EmployeeService {
	public List<Employee> findAll() throws DataAccessException;
	
	public EmployeeDTO findOne(Integer id) throws DataAccessException;
	
	public Employee saveEmployee(EmployeeDTO emp) throws DataAccessException;
	
	public void deleteEmployee(int st) throws DataAccessException;
}
