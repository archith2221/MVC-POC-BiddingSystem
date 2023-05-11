package com.bidding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bidding.beans.Biddamount;
import com.bidding.beans.Order;
import com.bidding.beans.Product;
import com.bidding.dao.OrderDAO;

@Controller
public class OrderController {
	@Autowired
	OrderDAO ordao;
	
	@RequestMapping(value = "/topay/{bidid}")
	public String edit(@PathVariable int bidid, Model m) {
     Biddamount bi=ordao.getOrderbybidid(bidid);
        Order order= new Order();
		m.addAttribute("command", order);
		m.addAttribute("B",bi);
		return "payment";
	}
	

	@RequestMapping(value = "/paid", method = RequestMethod.POST)
	public String biddstore(@ModelAttribute("b") Biddamount b) {
		ordao.neword(b);
		return "redirect:viewcustprod";
	}
	
	@RequestMapping("/Purchased")
	public String viewprod(Model m) {
		List<Order> list = ordao.getOrders();
		m.addAttribute("list", list);
		return "Purchased";
	}
	
	
	
}
