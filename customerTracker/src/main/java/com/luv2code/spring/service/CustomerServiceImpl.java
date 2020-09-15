package com.luv2code.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.spring.dao.CustomerDAO;
import com.luv2code.spring.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDAO customerDAO;

	@Transactional
	public void saveCustomer(Customer theCustomer) {
		customerDAO.saveCustomer(theCustomer);
	}

	@Transactional
	public List<Customer> getCustomers() {
		List<Customer> customerList=customerDAO.getCustomers();
		
		return customerList;
	}

	@Transactional
	public Customer getCustomerForUpdate(int theId) {
       
		return customerDAO.getCustomerForUpdate(theId);
	}

	@Transactional
	public void deleteCustomer(int theId) {
		customerDAO.deleteCustomer(theId);
	}

	
}
