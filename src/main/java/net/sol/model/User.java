package net.sol.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;	

    private String names;
    
    private String email;

    private String password;

    public User() {
    };
    
    public User(String names, String email,String password) {
    	this.names = names;
    	this.email = email;
    	this.password = password;
    }
  
	
    public String getNames() {
        return names;
    }
    public void setNames(String names) {
        this.names = names;
    }
    public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	} 
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}