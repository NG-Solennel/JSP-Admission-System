package net.sol.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Teacher implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	private String code;
	private String names;
	private EQualification qualification;
	@ManyToMany(mappedBy="tutors")
	private List<Course> courses;
	
	public Teacher() {
		// TODO Auto-generated constructor stub
	}

	public Teacher(String code, String names, EQualification qualification) {
		this.code = code;
		this.names = names;
		this.qualification = qualification;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public EQualification getQualification() {
		return qualification;
	}

	public void setQualification(EQualification qualification) {
		this.qualification = qualification;
	}
	
}
