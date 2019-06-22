package com.uca.capas.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.uca.capas.dto.EmployeeDTO;
import com.uca.capas.service.EmployeeService;
import com.uca.capas.service.StoreService;

public class EmployeesController {

	@Autowired
	StoreService storeService;
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/addEmployee/{id_store}")
	public ModelAndView employeeForm(@PathVariable("id_store") Integer id_store, HttpServletRequest req, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("stores",storeService.findAll());
			mav.addObject("storeid", id_store);
			mav.addObject("action", "Agregar");
			mav.addObject("employeeDTO", new EmployeeDTO());
			mav.setViewName("employeeForm");
		}
		catch(Exception e) {
			e.printStackTrace();
			RedirectView rv = new RedirectView(req.getContextPath()+"/store/"+id_store);
			rv.setExposeModelAttributes(false);
			ra.addFlashAttribute("error", "Algo salio mal, intentelo mas tarde.");
			mav.setView(rv);
		}
		return mav;
	}
	
}
