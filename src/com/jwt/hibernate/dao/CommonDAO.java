package com.jwt.hibernate.dao;

import org.apache.naming.java.javaURLContextFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import java.util.List;

import com.jwt.hibernate.bean.*;
import com.sun.org.apache.bcel.internal.generic.ReturnaddressType;

public class CommonDAO {

	public boolean addCommon(String common, String email, double score, int cdID, String dateTime){
		try {
			
//			Check if user have bought the cd. check order table.
			
//			OrderDAO orderDAO = new OrderDAO();
//            OrderDetail orderDetail = orderDAO.getOrder(email);
//			
//            
//        	CDDAO cdDao = new CDDAO();
//        	List<CD> cd = cdDao.getAllCD(category);
//
//        	int size = cd.size();
//            if (size != 0) {
//				for (int i = 0; i < size; i++) {
//					cdName = cd.get(i).getCdName();
			
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
            commons.setDate(dateTime);
            
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
	
	public List<Common> getCommon(int cdID) {
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
            
            java.util.List<Common>commonList;
            Query query = session.createQuery("FROM Common WHERE cdID ='" + cdID + "'");
            
            commonList = query.list();

            transaction.commit();
			
			return commonList;
					
		} catch (HibernateException e) {
			System.out.println(e.getMessage());
            System.out.println("error");
            return null;
		
		}
		
		
	}
	
	
}
