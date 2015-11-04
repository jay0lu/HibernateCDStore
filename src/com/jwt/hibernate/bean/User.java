package com.jwt.hibernate.bean;

import javax.persistence.*;

 
@Entity
@Table(name="User")
public class User {

	private int id;
    
	private String firstName;
	private String lastName;
    private String password;
    private String email;
    private String phone;
    private String address;
 
	@Id @GeneratedValue
	@Column(name="id", nullable=false)
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }

 
    @Column(name="firstName", nullable=false)
    public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name="lastName", nullable=false)
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name="password", nullable=false)
	public String getPassword() {
        return password;
    }
 
	
    public void setPassword(String password) {
        this.password = password;
    }
 
    @Column(name="email", nullable=false, unique=true)
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    @Column(name="phone", nullable=false)
    public String getPhone() {
        return phone;
    }
 
    public void setPhone(String phone) {
        this.phone = phone;
    }
 
    @Column(name="address", nullable=false)
    public String getAddress() {
        return address;
    }
 
    public void setAddress(String address) {
        this.address = address;
    }
    
    


 
}