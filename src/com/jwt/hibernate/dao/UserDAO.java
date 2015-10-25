package com.jwt.hibernate.dao;
 
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;


import antlr.collections.List;

import com.jwt.hibernate.bean.User;
 
public class UserDAO {
	
	private Session hibernateConfig (){
        // 1. configuring hibernate
    	Configuration  configuration = new Configuration ().configure();
    	
        // 2. create sessionfactory
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());

        Session session = sessionFactory.openSession();
        return session;
	}
	
    public boolean addUserDetails(String userName, String password, String email,
            String phone, String city) {
        try {
        	
        	Session session = hibernateConfig();
            Transaction transaction = session.beginTransaction();
            
            User user = new User();
            user.setUserName(userName);
            user.setPassword1(password);
            user.setEmail(email);
            user.setCity(city);
            user.setPhone(phone);
            
            session.save(user);
            transaction.commit();
            
            System.out.println("\n\n Details Added \n");
            
            return true;
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return false;
        }
 
    }
    
    public User getUserDetails(String userName) {
        try {
            // 1. configuring hibernate
        	Configuration  configuration = new Configuration ().configure();
        	
            // 2. create sessionfactory
            StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
            SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());
 
            // 3. Get Session object
            Session session = sessionFactory.openSession();
 
            // 4. Starting Transaction
            Transaction transaction = session.beginTransaction();
            Query query = session.createQuery("FROM User where userName='" + userName + "'");
            
            java.util.List<User> users = query.list();

            transaction.commit();
            

            return users.iterator().next();
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return null;
        }
 
    }
    
    public boolean changeUserDetails(String userName, String password, String email, String phone, String city) {
    	try {
        	Session session = hibernateConfig();
            Transaction transaction = session.beginTransaction();
            
            
    	} catch (Exception e) {
    		
    	}
    	return true;
    }
}