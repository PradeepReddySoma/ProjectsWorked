package com.luv2code.spring.dao;

import java.util.List;

import com.luv2code.spring.entity.Customer;

public interface CustomerDAO {

	void saveCustomer(Customer theCustomer);

	List<Customer> getCustomers();

	Customer getCustomerForUpdate(int theId);

	void deleteCustomer(int theId);

	

}
