package com.bidding.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bidding.beans.User;
import com.bidding.dao.Userdao;


@Controller
public class Usercontroller {


	
	@Autowired
	Userdao userdao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
   public String home() {
      return "index";
}

	@RequestMapping(value = "/home1")
	   public String home1() {
	      return "home1";
	}

	
	
	
	 @RequestMapping("/register") 
	public String registeruser(Model m) {
		m.addAttribute("command",new User());
		return"register";	
		
		
	}
	 
	 @RequestMapping(value="/registeradd", method = RequestMethod.POST)
	 public String registernewuser(@ModelAttribute("u") User u ) {
		 userdao.adduser(u);
		 return "redirect:/";
	 
	 }
	 
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	 public String login(@ModelAttribute("user") User user, Model model,HttpSession session) {
	     try {
	         User fetchedUser = userdao.getUserByEmailAndPassword(user);
	         if(fetchedUser == null) {
	             model.addAttribute("error", "Invalid email/password");
	             return "index";
	         } else {
	             if(fetchedUser.getRole().equals("admin")) {
	                 return "redirect:/home1";
	             } else if(fetchedUser.getRole().equals("customer")) {
	            	 session.setAttribute("uid", fetchedUser.getUid());
	            	 System.out.println("uid in session: " + session.getAttribute("uid"));
	            	    
	                 return "redirect:/viewcustprod";
	             }
	         }
	     } catch (Exception e) {
	         model.addAttribute("error", "Requires valid Username and password.");
	         return "index";
	     }
	     return null;
	 }

 
}

