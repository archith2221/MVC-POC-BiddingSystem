package com.bidding.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
    JavaMailSender mailSender;
	
	@RequestMapping("/bidaccepted")
	public String viewacceptedbid(Model m,HttpSession session) {
		 int uid = (int) session.getAttribute("uid");
		List<Biddamount> list = dao.getbidaccepted(uid);
		List<Biddamount> listno=dao.getbitnotaccepted(uid);
		m.addAttribute("acclist", list);
		m.addAttribute("notacclist", listno);
		return "bidaccepted" ;
		
	}

	
	  @RequestMapping(value = "/bid/{id}")
	  public String bid(@PathVariable int id,Model m) {
		
		  Product p = dao.getProductById(id); 
		  Biddamount biddamount = new Biddamount();
		  m.addAttribute("command", biddamount); 
		  m.addAttribute("P", p);
	  return "biddamountform"; }
	  

	  
	  
	  @RequestMapping(value = "/biddstore", method = RequestMethod.POST)
	  public String placeBid(@ModelAttribute("b") Biddamount b, HttpSession session) {
	      int uid = (int) session.getAttribute("uid");
	      System.out.println("uid in session: " + session.getAttribute("uid"));
	      b.setUid(uid);
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
	
	/*
	 * @RequestMapping(value = "/bideditsave", method = RequestMethod.POST) public
	 * String editsave(@ModelAttribute("b") Biddamount b) { //
	 * System.out.println("Done"); dao.bidupdate(b); // System.out.println("Done1");
	 * return "redirect:/viewbidprod"; }
	 */

	 @RequestMapping(value = "/bideditsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("b") Biddamount b) {
		 System.out.println(b.getUid());
		 dao.bidupdate(b);

	        String email = dao.getEmailByUid(b.getUid());
                 System.out.println(email);
	        
	        if (b.isBidAccepted()) {
	            String subject = "Your bid has been accepted!";
	            String body = "Congratulations! Your bid has been accepted.";
	            sendEmail(email, subject, body);
	        } else {
	            String subject = "Bid update";
	            String body = "Your bid status has been updated.";
	            sendEmail(email, subject, body);
	        }

	        return "redirect:/viewbidprod"; 
	    }

	    private void sendEmail(String to, String subject, String body) {
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true);
	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(body);

	            mailSender.send(message);
	        } catch (MessagingException e) {
	           
	            e.printStackTrace();
	        }
	    }
	

}
