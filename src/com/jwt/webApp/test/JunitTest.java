//package com.jwt.webApp.test;
//
//import static org.junit.Assert.*;
//import static org.hamcrest.CoreMatchers.*; 
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.junit.runners.JUnit4;
//
//
//import com.jwt.hibernate.dao.*;
//import com.jwt.hibernate.bean.*;
//
//import java.math.BigDecimal;
//
//import org.hibernate.HibernateException;
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
//import org.hibernate.cfg.Configuration;
//
//@RunWith(JUnit4.class)
//public class JunitTest {
//
//	
//	private Session hibernateConfig (){
//        // 1. configuring hibernate
//    	Configuration  configuration = new Configuration ().configure();
//    	
//        // 2. create sessionfactory
//        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
//        SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());
//
//        Session session = sessionFactory.openSession();
//        return session;
//	}
//	
//	@Before
//	public void setUp() throws Exception {
//		
//		
//	}
//
//	@After
//	public void tearDown() throws Exception {
//		
//		//sessionFactory.close();
//		
//	}
//	
//	
//
//	@Test
//	public void  testAddCDDetails() {
//		//fail("Not yet implemented");
//		CDDAO cdDao = new CDDAO();
//		String cdName = "DEFAULT_NO_CDNAME_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String details = "DEFAULT_NO_DETAIL_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		BigDecimal price = BigDecimal.valueOf(12345);
//		int pricereal = price.intValue();
//		int stock = 10;
//		String category = "DEFAULT_NO_CATEGORY_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String singer = "DEFAULT_NO_SINGER_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String img = "DEFAULT_NO_IMAGE_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		
//		boolean success = cdDao.addCDDetails(cdName, details, price, stock, category, singer, img);
//		
//		try{
//		
//		Session session = hibernateConfig();
//		
//		Transaction transaction = session.beginTransaction();
//		
//		Query query = session.createQuery("FROM CD where cdName='" + cdName + "'");
//        
//        java.util.List<CD> cd = query.list();
//
//        transaction.commit();
//        
//        CD cdTest = new CD();
//        cdTest = cd.iterator().next();
//        
//        String cdNameTest = cdTest.getCdName();
//        String detailsTest = cdTest.getDetails();
//        BigDecimal priceTest = cdTest.getPrice();
//        int pricerealTest = priceTest.intValue();
//        int stockTest = cdTest.getStock();
//        String categoryTest = cdTest.getCategory();
//        String singerTest = cdTest.getSinger();
//        String imgTest = cdTest.getImg();
//        
//        assertThat(success,equalTo(true));
//        assertThat(cdName,equalTo(cdNameTest));
//        assertThat(details,equalTo(detailsTest));
//        assertThat(pricereal,equalTo(pricerealTest));
//        assertThat(stock,equalTo(stockTest));
//        assertThat(category,equalTo(categoryTest));
//        assertThat(singer,equalTo(singerTest));
//        assertThat(img,equalTo(imgTest));
//        
//		}catch(Exception e){
//			e.getStackTrace();
//		}
//		
//	}
//	
//	@Test
//	public void  testGetCDDetails() {
//		//fail("Not yet implemented");
//		CDDAO cdDao = new CDDAO();
//		CD cd;
//		String cdName = "DEFAULT_NO_CDNAME_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String details = "DEFAULT_NO_DETAIL_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		BigDecimal price = BigDecimal.valueOf(12345);
//		int pricereal = price.intValue();
//		int stock = 10;
//		String category = "DEFAULT_NO_CATEGORY_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String singer = "DEFAULT_NO_SINGER_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String img = "DEFAULT_NO_IMAGE_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		
//		boolean test = cdDao.addCDDetails(cdName, details, price, stock, category, singer, img);
//		cd = cdDao.getCDDetails(cdName);
//		
//		try{
//        
//        String cdNameTest = cd.getCdName();
//        String detailsTest = cd.getDetails();
//        BigDecimal priceTest = cd.getPrice();
//        int pricerealTest = priceTest.intValue();
//        int stockTest = cd.getStock();
//        String categoryTest = cd.getCategory();
//        String singerTest = cd.getSinger();
//        String imgTest = cd.getImg();
//        
//        assertThat(cdName,equalTo(cdNameTest));
//        assertThat(details,equalTo(detailsTest));
//        assertThat(pricereal,equalTo(pricerealTest));
//        assertThat(stock,equalTo(stockTest));
//        assertThat(category,equalTo(categoryTest));
//        assertThat(singer,equalTo(singerTest));
//        assertThat(img,equalTo(imgTest));
//        
//		}catch(Exception e){
//			e.getStackTrace();
//		}
//		
//	}
//	
//	@Test
//	public void  testAddOrderDetails() {
//		//fail("Not yet implemented");
//		OrderDAO orderDao = new OrderDAO();
//		String userName = "DEFAULT_NO_USERNAME_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String orderdetail = "DEFAULT_NO_ORDERDETAIL_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String datetime = "DEFAULT_NO_datetime_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		BigDecimal price = BigDecimal.valueOf(12345);
//		int pricereal = price.intValue();
//		String phonenumber = "DEFAULT_NO_PHONENUMBER_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String address = "DEFAULT_NO_ADDRESS_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		
//		boolean success = orderDao.addOrderDetails(userName, orderdetail, datetime, price, phonenumber, address);
//		
//		try{
//		
//			
//			Session session = hibernateConfig();
//			
//			Transaction transaction = session.beginTransaction();
//			
//			Query query = session.createQuery("FROM ORDERDETAIL where USERNAME='" + userName + "'");
//	        
//	        java.util.List<OrderDetail> order = query.list();
//
//	        transaction.commit();
//	        
//	        OrderDetail orderTest = new OrderDetail();
//	        orderTest = order.iterator().next();
//        
//        String userNameTest = orderTest.getUserName();
//        String orderdetailTest = orderTest.getOrderDetail();
//        String datetimeTest = orderTest.getDate();
//        BigDecimal priceTest = orderTest.getPrice();
//        int pricerealTest = priceTest.intValue();
//        String phoneTest = orderTest.getPhoneNumber();
//        String addressTest = orderTest.getAddress();
//        
//        assertThat(success,equalTo(true));
//        assertThat(userName,equalTo(userNameTest));
//        assertThat(orderdetail,equalTo(orderdetailTest));
//        assertThat(datetime,equalTo(datetimeTest));
//        assertThat(pricereal,equalTo(pricerealTest));
//        assertThat(phonenumber,equalTo(phoneTest));
//        assertThat(address,equalTo(addressTest));
//        
//		}catch(Exception e){
//			e.getStackTrace();
//		}
//		
//	}
//	
//	@Test
//	public void  testGetOrderDetails() {
//		//fail("Not yet implemented");
//		OrderDAO orderDao = new OrderDAO();
//		OrderDetail order;
//		String userName = "DEFAULT_NO_USERNAME_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String orderdetail = "DEFAULT_NO_ORDERDETAIL_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String datetime = "DEFAULT_NO_datetime_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		BigDecimal price = BigDecimal.valueOf(12345);
//		int pricereal = price.intValue();
//		String phonenumber = "DEFAULT_NO_PHONENUMBER_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String address = "DEFAULT_NO_ADDRESS_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		
//		boolean test = orderDao.addOrderDetails(userName, orderdetail, datetime, price, phonenumber, address);
//		order = orderDao.getOrderDetails(phonenumber);
//		
//		try{
//		
//        
//        String userNameTest = order.getUserName();
//        String orderdetailTest = order.getOrderDetail();
//        String datetimeTest = order.getDate();
//        BigDecimal priceTest = order.getPrice();
//        int pricerealTest = price.intValue();
//        String phoneTest = order.getPhoneNumber();
//        String addressTest = order.getAddress();
//        
//        assertThat(userName,equalTo(userNameTest));
//        assertThat(orderdetail,equalTo(orderdetailTest));
//        assertThat(datetime,equalTo(datetimeTest));
//        assertThat(pricereal,equalTo(pricerealTest));
//        assertThat(phonenumber,equalTo(phoneTest));
//        assertThat(address,equalTo(addressTest));
//        
//		}catch(Exception e){
//			e.getStackTrace();
//		}
//		
//	}
//	
//	
//	@Test
//	public void  testAddUserDetails() {
//		//fail("Not yet implemented");
//		UserDAO userDao = new UserDAO();
//		String userName = "DEFAULT_NO_USERNAME_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String password = "DEFAULT_NO_PASSWORD_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String email = "DEFAULT_NO_EMAIL_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String phone = "DEFAULT_NO_PHONE_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String address = "DEFAULT_NO_ADDRESS_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		
//		boolean success = userDao.addUserDetails (firstName, lastName,  password,  email,
//	             phone,  address); 
//		
//		try{
//		
//			
//			Session session = hibernateConfig();
//			
//			Transaction transaction = session.beginTransaction();
//			
//			Query query = session.createQuery("FROM USER where email='" + email + "'");
//	        
//	        java.util.List<User> user = query.list();
//
//	        transaction.commit();
//	        
//	        User userTest = new User();
//	        userTest = user.iterator().next();
//        
//        String userNameTest = userTest.getUserName();
//        String emailTest = userTest.getEmail();
//        String passwordTest = userTest.getPassword();
//        String phoneTest = userTest.getPhone();
//        String addressTest = userTest.getAddress();
//        
//        assertThat(success,equalTo(true));
//        assertThat(userName,equalTo(userNameTest));
//        assertThat(email,equalTo(emailTest));
//        assertThat(password,equalTo(passwordTest));
//        assertThat(phone,equalTo(phoneTest));
//        assertThat(address,equalTo(addressTest));
//        
//		}catch(Exception e){
//			e.getStackTrace();
//		}
//		
//	}
//	
//	
//	@Test
//	public void  testgetUserDetails() {
//		//fail("Not yet implemented");
//		UserDAO userDao = new UserDAO();
//		User user;
//		String userName = "DEFAULT_NO_USERNAME_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String password = "DEFAULT_NO_PASSWORD_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String email = "DEFAULT_NO_EMAIL_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String phone = "DEFAULT_NO_PHONE_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		String address = "DEFAULT_NO_ADDRESS_STRING_THIS_SHOULD_NEVER_BE_SAME_WITH_ANYONE";
//		
//		boolean test = userDao.addUserDetails(userName, password, email, phone, address);
//		user = userDao.getUserDetails(email);
//		
//		try{
//        
//        String userNameTest = user.getUserName();
//        String emailTest = user.getEmail();
//        String passwordTest = user.getPassword();
//        String phoneTest = user.getPhone();
//        String addressTest = user.getAddress();
//        
//        assertThat(userName,equalTo(userNameTest));
//        assertThat(email,equalTo(emailTest));
//        assertThat(password,equalTo(passwordTest));
//        assertThat(phone,equalTo(phoneTest));
//        assertThat(address,equalTo(addressTest));
//        
//		}catch(Exception e){
//			e.getStackTrace();
//		}
//		
//	}
//	
//
//}
