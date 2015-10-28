package com.jwt.hibernate.dao;
 
import java.math.BigDecimal;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;


import antlr.collections.List;

import com.jwt.hibernate.bean.CD;
 
public class CDDAO {
 
    public boolean addCDDetails(String cdName, String details, BigDecimal price, int stock, String category) {
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
            cd.setCDName(cdName);
            cd.setDetails(details);
            cd.setCategory(category);
            cd.setPrice(price);
            cd.setStock(stock);
            
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
            Query query = session.createQuery("FROM CD");
            
            java.util.List<CD> cd = query.list();

            transaction.commit();
            
            
            return cd.iterator().next();
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
            return null;
        }
 
    }
 
}