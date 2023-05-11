package com.bidding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bidding.beans.Product;
import com.bidding.dao.ProductDAO;

@Controller
public class ProductController {
	@Autowired
	ProductDAO prodDao;
	@RequestMapping("/prodform")
	public String showform(Model m) {
		m.addAttribute("command", new Product());
		return "prodform";
	}

	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("p") Product p) {
		prodDao.save(p);
		return "redirect:/viewprod";
	}

	
	
	@RequestMapping("/viewprod")
	public String viewprod(Model m) {
		List<Product> list = prodDao.getProducts();
		m.addAttribute("list", list);
		return "viewprod";
	}

	
	@RequestMapping(value = "/editprod/{id}")
	public String edit(@PathVariable int id, Model m) {
		Product p = prodDao.getProductById(id);
		m.addAttribute("command", p);
		return "prodeditform";
	}
	
	

	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("p") Product p) {
		prodDao.update(p);
		return "redirect:/viewprod";
	}

	
	
	
	
	@RequestMapping(value = "/deleteprod/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		prodDao.delete(id);
		return "redirect:/viewprod";
	}
	
	@RequestMapping("/viewcustprod")
	public String viewcustprod(Model m) {
		List<Product> list = prodDao.getcustProducts();
		m.addAttribute("list", list);
		return "viewcustprod";
	}
}
