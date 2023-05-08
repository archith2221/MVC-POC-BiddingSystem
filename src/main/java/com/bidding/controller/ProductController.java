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
	ProductDAO prodDao;// will inject dao from xml file

	/*
	 * It displays a form to input data, here "command" is a reserved request
	 * attribute which is used to display object data into form
	 */
	@RequestMapping("/prodform")
	public String showform(Model m) {
		m.addAttribute("command", new Product());
		return "prodform";
	}

	/*
	 * It saves object into database. The @ModelAttribute puts request data into
	 * model object. You need to mention RequestMethod.POST method because default
	 * request is GET
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("p") Product p) {
		prodDao.save(p);
		return "redirect:/viewprod";// will redirect to viewemp request mapping
	}

	/* It provides list of employees in model object */
	@RequestMapping("/viewprod")
	public String viewprod(Model m) {
		List<Product> list = prodDao.getProducts();
		m.addAttribute("list", list);
		return "viewprod";
	}

	/*
	 * It displays object data into form for the given id. The @PathVariable puts
	 * URL data into variable.
	 */
	@RequestMapping(value = "/editprod/{id}")
	public String edit(@PathVariable int id, Model m) {
		Product p = prodDao.getProductById(id);
		m.addAttribute("command", p);
		return "prodeditform";
	}

	/* It updates model object. */
	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("p") Product p) {
		prodDao.update(p);
		return "redirect:/viewprod";
	}

	/* It deletes record for the given id in URL and redirects to /viewemp */
	@RequestMapping(value = "/deleteprod/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		prodDao.delete(id);
		return "redirect:/viewprod";
	}
}
