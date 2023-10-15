package net.sol.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CourseDefinition implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String code;
	private String name;
	private String description;
	
	
	
	public CourseDefinition() {
		// TODO Auto-generated constructor stub
	}



	public CourseDefinition(String code, String name, String description) {
		this.code = code;
		this.name = name;
		this.description = description;
	}
	
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
