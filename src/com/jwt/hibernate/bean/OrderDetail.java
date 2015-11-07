package com.jwt.hibernate.bean;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.*;

 
@Entity
@Table(name="OrderDetail")
public class OrderDetail {
	
	private int id;
    
	private String email;
//    private String orderDetail;  //cd name and amount
    private String date;
    private BigDecimal price;
    private String phoneNumber;
    private String address;
    
    @Id @GeneratedValue
    @Column(name="id", nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
    @Column(name="email", nullable=false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
//    @Column(name="orderDetail")
//	public String getOrderDetail() {
//		return orderDetail;
//	}
//	public void setOrderDetail(String orderDetail) {
//		this.orderDetail = orderDetail;
//	}
	
    @Column(name="date")
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
    @Column(name="price", nullable=false)
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
    @Column(name="phoneNumber", nullable=false)
	public String getPhoneNumber()
	{
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber=phoneNumber;
	}
	
    @Column(name="address", nullable=false)
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address=address;
	}
 


 
}