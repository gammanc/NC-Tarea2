package com.uca.capas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Store;
import com.uca.capas.service.StoreService;

@Controller
public class StoresController {
	
	@Autowired
	StoreService storeService;
	
	@RequestMapping("/stores")
	public ModelAndView storeList() {
		ModelAndView mav = new ModelAndView();
		List<Store> stores = null;
		try {
			stores = storeService.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(stores != null)
			mav.addObject("stores", stores);
		else
			mav.addObject("noList", "No se encontraron sucursales");
		mav.setViewName("stores");
		return mav;
	}
}
