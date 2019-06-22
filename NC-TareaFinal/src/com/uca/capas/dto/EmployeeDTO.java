package com.uca.capas.dto;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class EmployeeDTO {

	private Integer code;
	
	@NotBlank(message = "El nombre es requerido")
	@Size(min = 2, max = 200, message = "Debe ser de entre 2 y 200 caracteres")
	private String name;
	
	@NotNull(message = "La edad es requerida")
	@Min(value = 18, message = "La edad mínima es de 18 años")
    @Max(value = 99, message = "La edad máxima es de 99 años")
	private Integer age;
	
	@NotBlank(message = "Campo requerido")
	@Pattern(regexp = "^[M|F]{1}$", message = "Debe ser M o F")
	private String gender;
	
	@NotNull
	private boolean status;
	
	@NotNull
	private int storeid;

	public EmployeeDTO() {};
	
	public EmployeeDTO(Integer code, String name, Integer age, String gender, boolean status, Integer storeid) {
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
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
