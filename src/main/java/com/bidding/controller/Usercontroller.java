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
	@RequestMapping(value = "index", method = RequestMethod.GET)
	   public String index() {
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
	 

	 
	 @RequestMapping(value="/registeradd", method=RequestMethod.POST)
	 public String registernewuser(@ModelAttribute("command") User user, Model model) {
	     try {
	    	           
	         User fetchedUser = userdao.getUserByEmailforReg(user);
	                  
	         if (fetchedUser == null) {
	             userdao.adduser(user);
	                    System.out.println("HII");
	             return "redirect:/";
	         } else {
	             model.addAttribute("error", "Email already exists");
	                     System.out.println("HII33");
	             return "register";
	           
	         }
	     } catch (Exception e) {
	    	 e.printStackTrace();
	         model.addAttribute("error", "An error occurred while processing your request.");
	         System.out.println("HII66");
	         return "register";
	     }
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
	            	 session.setAttribute("name", fetchedUser.getName());
	            	 System.out.println("uid in session: " + session.getAttribute("uid"));
	            	 System.out.println("uid in session: " + session.getAttribute("name"));  
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

