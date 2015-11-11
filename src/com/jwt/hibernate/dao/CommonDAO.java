package com.jwt.hibernate.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import java.util.List;

import com.jwt.hibernate.bean.CD;
import com.jwt.hibernate.bean.Common;
import com.sun.org.apache.bcel.internal.generic.ReturnaddressType;

public class CommonDAO {

	public boolean addCommon(String common, String email, int score, int cdID){
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
            
            Common commons = new Common();
            commons.setCommon(common);
            commons.setEmail(email);
            commons.setScore(score);
            commons.setCdID(cdID);
            
            session.save(commons);
            transaction.commit();
            System.out.println("Common Added");
			
			return true;

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
            System.out.println("error");
            return false;
		}
	
	}
	
	public Common getCommon(int cdID) {
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
            Query query = session.createQuery("FROM Common WHERE cdID ='" + cdID + "'");
            
            java.util.List<Common> common = query.list();

            transaction.commit();
			
			return common.iterator().next();
					
		} catch (HibernateException e) {
			System.out.println(e.getMessage());
            System.out.println("error");
            return null;
		
		}
		
		
	}
	
	
}
