package com.jwt.hibernate.dao;
 
import java.math.BigDecimal;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.util.List;
//import antlr.collections.List;

import com.jwt.hibernate.bean.CD;
 
public class CDDAO {
 
    public boolean addCDDetails(String cdName, String details, BigDecimal price, int stock, String category, String singer, String img) {
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
            CD cd = new CD();
            cd.setCdName(cdName);
            cd.setSinger(singer);
            cd.setDetails(details);
            cd.setCategory(category);
            cd.setPrice(price);
            cd.setStock(stock);
            cd.setImg(img);
            
            session.save(cd);
            transaction.commit();
            System.out.println("\n\n Details Added \n");
            
            return true;
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return false;
        }
 
    }
   
    public CD getCDDetails(String cdName) {
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
            Query query = session.createQuery("FROM CD WHERE cdName ='" + cdName + "'");
            
            java.util.List<CD> cd = query.list();

            transaction.commit();
            
            
            return cd.iterator().next();  //select the first one
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return null;
        }
 
    }
    
    public CD getCDDetailsByID(int cdid) {
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
            Query query = session.createQuery("FROM CD WHERE cdid ='" + cdid + "'");
            
            java.util.List<CD> cd = query.list();

            transaction.commit();
            
            
            return cd.iterator().next();  //select the first one
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return null;
        }
 
    }
    
    public List<CD> getAllCD(String category) {
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
            
            java.util.List<CD> cdList ;
            
            if (category.equals("all")){
            	Query query = session.createQuery("FROM CD"); 
                cdList = query.list();
            }else{
	            Query query = session.createQuery("FROM CD WHERE category ='" + category + "'"); 
	            cdList = query.list();
            }
            transaction.commit();
            return cdList; 
            
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return null;
        }
 
    }
    
}