package com.uca.capas.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.uca.capas.domain.Employee;
import com.uca.capas.domain.Store;
import com.uca.capas.dto.EmployeeDTO;
import com.uca.capas.service.EmployeeService;
import com.uca.capas.service.StoreService;

@Controller
public class EmployeesController {

	@Autowired
	StoreService storeService;
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping(path = "/addEmployee", method = RequestMethod.POST)
	public ModelAndView employeeForm(@RequestParam("storecode") Integer id_store, HttpServletRequest req, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("stores",storeService.findAll());
			mav.addObject("storeid", id_store);
			mav.addObject("action", "Agregar");
			EmployeeDTO e = new EmployeeDTO();
			e.setStoreid(id_store);
			e.setGender("M");
			e.setStatus(true);
			mav.addObject("employeeDTO", e);
			mav.setViewName("employeeForm");
		}
		catch(Exception e) {
			e.printStackTrace();
			RedirectView rv = new RedirectView(req.getContextPath()+"/store/"+id_store);
			rv.setExposeModelAttributes(false);
			ra.addFlashAttribute("error", "Algo salió mal, intentelo mas tarde.");
			mav.setView(rv);
		}
		return mav;
	}
	
	@RequestMapping(path="/saveEmployee", method = RequestMethod.POST)
	public ModelAndView saveStore(@Valid @ModelAttribute("employeeDTO") EmployeeDTO employeeDTO, BindingResult result, RedirectAttributes ra,HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.addObject("stores",storeService.findAll());
			mav.addObject("action", "Agregar");
			mav.addObject("employeeDTO", employeeDTO);
			mav.setViewName("employeeForm");
		} else {
			try {
				employeeService.saveEmployee(employeeDTO);
				RedirectView rv = new RedirectView(req.getContextPath()+"/store/"+employeeDTO.getStoreid());
				rv.setExposeModelAttributes(false);
				ra.addFlashAttribute("message", "Empleado guardado con éxito");
				mav.setView(rv);
			}
			catch(Exception e) {
				mav.addObject("message", "No se ha podido guardar el empleado");
				mav.setViewName("employeeForm");
				e.printStackTrace();
			}
		}
		return mav;
	}
	
	@RequestMapping("/employee/edit/{id}")
	public String editStore(@PathVariable("id") Integer code, Model m){
		try {
			EmployeeDTO e = employeeService.findOne(code);
			m.addAttribute("stores",storeService.findAll());
			m.addAttribute("action", "Editar");
			m.addAttribute("employeeDTO", e);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "employeeForm";
	}
	
	@GetMapping("/employee/delete/{id}")
	public RedirectView deleteStore(@PathVariable("id") Integer code, HttpServletRequest req, RedirectAttributes ra) {
		int storeid = employeeService.findOne(code).getStoreid();
		RedirectView rv = new RedirectView(req.getContextPath()+"/store/"+storeid);
		rv.setExposeModelAttributes(false);
		try {
			employeeService.deleteEmployee(code);
			ra.addFlashAttribute("success", true);
			ra.addFlashAttribute("message", "El empleado fue removido con éxito");			
		} catch (Exception e) {
			ra.addFlashAttribute("success", false);
			ra.addFlashAttribute("message", "No se pudo remover al empleado");
			e.printStackTrace();
		}
		return rv;
	}
}
