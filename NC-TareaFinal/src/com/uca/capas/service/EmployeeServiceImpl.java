package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uca.capas.domain.Employee;
import com.uca.capas.repositories.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeRepository employeeRepository;

	@Override
	public List<Employee> findAll() throws DataAccessException {
		return employeeRepository.findAll();
	}

	@Override
	public Employee findOne(Integer id) throws DataAccessException {
		return employeeRepository.findById(id).get();
	}

	@Transactional
	public Employee saveEmployee(Employee emp) throws DataAccessException {
		return employeeRepository.save(emp);
	}
	
	
}
