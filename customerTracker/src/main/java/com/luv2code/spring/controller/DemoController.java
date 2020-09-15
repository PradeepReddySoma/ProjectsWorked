package com.luv2code.spring.controller;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.query.QueryParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.spring.entity.Customer;
import com.luv2code.spring.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class DemoController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/house")
	public String homeMethod() {
		return "home";
	}
	
	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		 
		List<Customer> customerList=customerService.getCustomers();
		theModel.addAttribute("customers", customerList);
		return "list-customers";
	}
	
	@GetMapping("/addCustomer")
	public String addCustomer(Model theModel) {
		
		Customer customer=new Customer();
		theModel.addAttribute("customer", customer);
		return "customer-form";
		
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer")Customer theCustomer) {
		
		customerService.saveCustomer(theCustomer);
		return "redirect:/customer/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId,Model model) {
		
		Customer theCustomer=customerService.getCustomerForUpdate(theId);
		model.addAttribute("customer", theCustomer);
		return "customer-form";
		
	}
	
	@GetMapping("/showFormForDelete")
	public String deleteCustomer(@RequestParam("customerId")int theId) {
		
		customerService.deleteCustomer(theId);
		return "redirect:/customer/list";
	}

}
