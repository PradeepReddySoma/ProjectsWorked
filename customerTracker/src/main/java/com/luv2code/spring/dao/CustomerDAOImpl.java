package com.luv2code.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.spring.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void saveCustomer(Customer theCustomer) {

		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(theCustomer);
	}

	public List<Customer> getCustomers() {

		Session session=sessionFactory.getCurrentSession();
		Query<Customer> customerQuery=session.createQuery("from Customer order by lastName",Customer.class);
		List<Customer> customerList=customerQuery.getResultList();
		
		return customerList;
	}

	public Customer getCustomerForUpdate(int theId) {
        Session session=sessionFactory.getCurrentSession();
        Customer customer=session.get(Customer.class, theId);
		return customer;
	}

	public void deleteCustomer(int theId) {

		Session session=sessionFactory.getCurrentSession();
		Query theQuery=session.createQuery("delete from Customer where id=:customerId");
		theQuery.setParameter("customerId", theId);
		theQuery.executeUpdate();
	}

}
