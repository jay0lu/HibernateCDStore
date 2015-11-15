package com.jwt.hibernate.bean;

import javax.persistence.*;

@Entity
@Table(name="Common")
public class Common {

	private int id;
	private String common;
	private String email;
	private int score;
	private int cdID;
	private String date;
	
	@Id @GeneratedValue
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="common", nullable=false)
	public String getCommon() {
		return common;
	}
	public void setCommon(String common) {
		this.common = common;
	}
	
	@Column(name="email", nullable=false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="score", nullable=false)
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
//	@OneToOne(mappedBy="commonID")
	@Column(name="cdID", nullable=false)
	public int getCdID() {
		return cdID;
	}
	public void setCdID(int cdID) {
		this.cdID = cdID;
	}
	
	@Column(name="date", nullable=false)
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	

	
	
	
}
