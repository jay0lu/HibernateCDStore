package com.jwt.hibernate.bean;

import java.math.BigDecimal;

import javax.persistence.*;

 
@Entity
@Table(name="CD")
public class CD {

    private int cdid;
    
	private String cdName;
	private String singer;
    private String details;
    private String category;
    private BigDecimal price;
    private int stock;
    private String img;
    private int commonID;
    
	@Id @GeneratedValue
    @Column(name="cdid", nullable=false)
	public int getCdid() {
		return cdid;
	}
	public void setCdid(int cdid) {
		this.cdid = cdid;
	}
	
    @Column(name="cdName", nullable=false)
	public String getCdName() {
		return cdName;
	}
	public void setCdName(String cdName) {
		this.cdName = cdName;
	}
	
    @Column(name="singer", nullable=false)
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	
    @Column(name="details", nullable=false)
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
    @Column(name="category", nullable=false)
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
    @Column(name="price", nullable=false)
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
    @Column(name="stock", nullable=false)
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
    @Column(name="img", nullable=false)
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
//	@OneToOne
	@Column(name="commonID")
	public int getCommonID() {
		return commonID;
	}
	public void setCommonID(int commonId) {
		this.commonID = commonID;
	}
 
	
       
}