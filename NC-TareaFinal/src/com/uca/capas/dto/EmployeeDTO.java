package com.uca.capas.dto;

public class EmployeeDTO {

	private Integer code;
	
	private String name;
	
	private Integer age;
	
	private char gender;
	
	private boolean status;
	
	private int storeid;

	public EmployeeDTO() {};
	
	public EmployeeDTO(Integer code, String name, Integer age, char gender, boolean status, Integer storeid) {
		super();
		this.code = code;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.status = status;
		this.storeid = storeid;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Integer getStoreid() {
		return storeid;
	}

	public void setStoreid(Integer store) {
		this.storeid = store;
	}
	
	public String getStatusDelegate() {
		return status? "Activo" : "Inactivo";
	}
}
