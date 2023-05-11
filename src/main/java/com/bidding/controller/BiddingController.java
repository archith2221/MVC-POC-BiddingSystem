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
import com.bidding.beans.Product;
import com.bidding.dao.BiddingamtDAO;
import com.bidding.dao.ProductDAO;

@Controller
public class BiddingController {
	
	@Autowired
	BiddingamtDAO dao;
	
	@RequestMapping("/bidaccepted")
	public String viewacceptedbid(Model m) {
		List<Biddamount> list = dao.getbidaccepted();
		List<Biddamount> listno=dao.getbitnotaccepted();
		m.addAttribute("acclist", list);
		m.addAttribute("notacclist", listno);
		return "bidaccepted" ;
		
	}
	
	@RequestMapping(value = "/bid/{id}")
	public String bid(@PathVariable int id, Model m) {
	    Product p = dao.getProductById(id);
	    Biddamount biddamount = new Biddamount();
	    m.addAttribute("command", biddamount);
	    m.addAttribute("P", p);
	    return "biddamountform";
	}
	
	@RequestMapping(value = "/biddstore", method = RequestMethod.POST)
	public String biddstore(@ModelAttribute("b") Biddamount b) {
		dao.newbid(b);
		return "redirect:viewcustprod";
	}
	
	
	@RequestMapping(value = "/editbid/{bidid}")
	public String edit(@PathVariable(name = "bidid") int bidid, Model m) {
	    Biddamount b = dao.getBidProductBybidId(bidid);
	    m.addAttribute("command", b);
	    return "bideditform";
	}
	
	@RequestMapping("/viewbidprod")
	public String viewprod(Model m) {
		List<Biddamount> list = dao.getbidProducts();
		m.addAttribute("list", list);
		return "viewbidprod";
	}
	
	@RequestMapping(value = "/deletebidprod/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		dao.deletebid(id);
		return "redirect:/viewbidprod";
	}
	
	@RequestMapping(value = "/bideditsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("b") Biddamount b) {
//		 System.out.println("Done"); 
		dao.bidupdate(b);
//		System.out.println("Done1");
		return "redirect:/viewbidprod";
	}
	
	
	

}
