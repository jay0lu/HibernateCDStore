package com.jwt.hibernate.bean;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
 
@Entity
public class CD {
	@Id @GeneratedValue
    private int cdid;
    
	private String cdName;
    private String details;
    private String category;
    private BigDecimal price;
    private int stock;
 
    public int getCDId() {
        return cdid;
    }
 
    public void setcd(int cdid) {
        this.cdid = cdid;
    }
 
    public String getCDName() {
        return cdName;
    }
 
    public void setCDName(String cdName) {
        this.cdName = cdName;
    }
 
    public String getDetails() {
        return details;
    }
 
    public void setDetails(String details) {
        this.details = details;
    }
 
    public String getCategory(){
    	return category;
    }
    
    public void setCategory(String category){
    	this.category = category;
    }
    
    public BigDecimal getPrice() {
        return price;
    }
 
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
 
    public int getStock() {
        return stock;
    }
 
    public void setStock(int stock) {
        this.stock = stock;
    }
 
}