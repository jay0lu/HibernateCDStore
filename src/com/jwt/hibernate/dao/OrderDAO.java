package com.jwt.hibernate.dao;
 
import java.math.BigDecimal;
import java.sql.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import antlr.collections.List;

import com.jwt.hibernate.bean.Order;
 

public class OrderDAO {
	
	private Session hibernateConfig (){
        // 1. configuring hibernate
    	Configuration  configuration = new Configuration ().configure();
    	
        // 2. create sessionfactory
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());

        Session session = sessionFactory.openSession();
        return session;
	}
	
    public boolean addOrderDetails(String userName, String orderDetail, Date date, BigDecimal price) {
        try {
        	
        	Session session = hibernateConfig();
            Transaction transaction = session.beginTransaction();
            
            Order order = new Order();
            order.setUserName(userName);
            order.setOrderDetail(orderDetail);
            order.setDate(date);
            order.setPrice(price);
            
            session.save(order);
            transaction.commit();
            
            System.out.println("\n\n Order Added \n");
            
            return true;
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return false;
        }
 
    }
    
    public Order getOrderDetails(String id) {
        try { 
            // 3. Get Session object
        	Session session = hibernateConfig();
            // 4. Starting Transaction
            Transaction transaction = session.beginTransaction();
            
            Query query = session.createQuery("FROM Order where id='" + id + "'");
            
            java.util.List<Order> order = query.list();

            transaction.commit();
            
            return order.iterator().next();
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return null;
        }
 
    }
}