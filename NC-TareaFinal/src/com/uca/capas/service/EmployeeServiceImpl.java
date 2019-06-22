package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.uca.capas.domain.Employee;
import com.uca.capas.domain.Store;
import com.uca.capas.dto.EmployeeDTO;
import com.uca.capas.repositories.EmployeeRepository;
import com.uca.capas.repositories.StoreRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeRepository employeeRepository;
	
	@Autowired
	StoreRepository storeRepository;

	@Override
	public List<Employee> findAll() throws DataAccessException {
		return employeeRepository.findAll();
	}

	@Override
	public EmployeeDTO findOne(Integer id) throws DataAccessException {
		 Employee e = employeeRepository.findById(id).get();
		 EmployeeDTO employeeDTO = new EmployeeDTO(e.getCode(), e.getName(), e.getAge(), e.getGender(), e.isStatus(),e.getStoreId().getCode());
		 return employeeDTO;
	}

	@Override
	@Transactional
	public Employee saveEmployee(EmployeeDTO emp) throws DataAccessException {
		Store store = storeRepository.findById(emp.getStoreid()).get();
		
		Employee employee = new Employee();
		employee.setCode(emp.getCode() != null ? emp.getCode() : null);
		employee.setName(emp.getName());
		employee.setAge(emp.getAge());
		employee.setGender(emp.getGender());
		employee.setStatus(emp.isStatus());
		employee.setStore(store);
		return employeeRepository.save(employee);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteEmployee(int emp) throws DataAccessException {
		Employee employee = employeeRepository.findById(emp).get();
		employeeRepository.delete(employee);
	}
	
	
}
