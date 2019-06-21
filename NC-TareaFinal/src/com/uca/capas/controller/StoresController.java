package com.uca.capas.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

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
	
	@RequestMapping("/addStore")
	public ModelAndView storeForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("store",  new Store());
		mav.addObject("action", "Agregar");
		mav.setViewName("storeForm");
		return mav;
	}
	
	@RequestMapping(path="/saveStore", method = RequestMethod.POST)
	public ModelAndView saveStore(@Valid @ModelAttribute("store") Store store, BindingResult result, RedirectAttributes ra,HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName("storeForm");
		} else {
			try {
				storeService.saveStore(store);
				RedirectView rv = new RedirectView(req.getContextPath()+"/stores");
				rv.setExposeModelAttributes(false);
				ra.addFlashAttribute("message", "Sucursal guardada con éxito");
				mav.setView(rv);
			}
			catch(Exception e) {
				mav.addObject("message", "No se ha podido guardar la sucursal");
				mav.setViewName("storeForm");
				e.printStackTrace();
			}
		}
		return mav;
	}
	
	@RequestMapping("/store/edit/{id}")
	public String editStore(@PathVariable("id") Integer code, Model m){
		try {
			Store store = storeService.findOne(code);
			m.addAttribute("action", "Editar");
			m.addAttribute("store", store);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "storeForm";
	}
	
	@GetMapping("/store/delete/{id}")
	public RedirectView deleteStore(@PathVariable("id") Integer code, HttpServletRequest req, RedirectAttributes ra) {
		RedirectView rv = new RedirectView(req.getContextPath()+"/stores");
		rv.setExposeModelAttributes(false);
		try {
			storeService.deleteStore(code);
			ra.addFlashAttribute("success", true);
			ra.addFlashAttribute("message", "La sucursal fue removida con éxito");			
		} catch (Exception e) {
			ra.addFlashAttribute("success", false);
			ra.addFlashAttribute("message", "No se pudo remover la sucursal");
			e.printStackTrace();
		}
		return rv;
	}
}
