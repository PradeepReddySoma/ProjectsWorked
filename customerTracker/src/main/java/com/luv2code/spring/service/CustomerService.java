package com.luv2code.spring.service;

import java.util.List;

import com.luv2code.spring.entity.Customer;

public interface CustomerService {

	void saveCustomer(Customer theCustomer);

	List<Customer> getCustomers();

	Customer getCustomerForUpdate(int theId);

	void deleteCustomer(int theId);



}
