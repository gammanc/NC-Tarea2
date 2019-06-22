package com.uca.capas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.User;
import com.uca.capas.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	UserService userService;

	@RequestMapping("/")
	public ModelAndView loginScreen() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value = "username") String username, @RequestParam(value = "password") String password) {
		ModelAndView mav = new ModelAndView();
		try {
			User user  = userService.findByUserandPass(username, password);
			if (user != null) {
				return new ModelAndView("redirect:/stores","user",user);
			} else {
				mav.setViewName("login");
				mav.addObject("error", "Credenciales incorrectas");
			}
		}
		catch(Exception e) {
			mav.addObject("error","Algo salió mal - No se pudo conectar");
			e.printStackTrace();
		}
		return mav;
	}
	
}
