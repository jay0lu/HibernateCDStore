package com.jwt.hibernate.dao;
 
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import antlr.collections.List;

import com.jwt.hibernate.bean.CD;
import com.jwt.hibernate.bean.OrderDetail;
 

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
	
	public boolean addOrderDetails(String email,  String datetime, BigDecimal price, String phoneNumber, String address) {
        try {
        	
        	Session session = hibernateConfig();
            Transaction transaction = session.beginTransaction();
            
            OrderDetail order = new OrderDetail();
            order.setEmail(email);
//            order.setOrderDetail(orderDetail);
            order.setDate(datetime);
            order.setPrice(price);
            order.setAddress(address);
            order.setPhoneNumber(phoneNumber);
            
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
    
	//for comfirmorder
    public OrderDetail getOrderDetails(String phoneNumber) {
        try { 
            // 3. Get Session object
        	Session session = hibernateConfig();
            // 4. Starting Transaction
            Transaction transaction = session.beginTransaction();
            
            Query query = session.createQuery("FROM Order where phonenumber='" + phoneNumber + "'");
            
            java.util.List<OrderDetail> order = query.list();

            transaction.commit();
            
            return order.iterator().next();
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return null;
        }
 
    }
    
    //for check user order history
//    public List<UserOrder> getUserOrder(String email) {
//        try { 
//            // 3. Get Session object
//        	Session session = hibernateConfig();
//            // 4. Starting Transaction
//            Transaction transaction = session.beginTransaction();
//            
//            Query query = session.createQuery("FROM Order where email ='" + email + "'");
//            
//            java.util.List<UserOrder> orderList = query.list();
//
//            transaction.commit();
//            
//            return orderList;
// 
//        } catch (HibernateException e) {
//            System.out.println(e.getMessage());
//            System.out.println("error");
//            return null;
//        }
// 
//    }
}