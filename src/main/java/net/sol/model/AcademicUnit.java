package net.sol.model;

import javax.persistence.Id;
import javax.persistence.OneToMany;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class AcademicUnit {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private Integer parent_id;
	private String name;

	@Enumerated(EnumType.STRING)
	@Column(name="unit")
	private EAcademicUnit unit;
	
	@OneToMany(mappedBy="departments")
	private List<Course> courses;

	public AcademicUnit(Integer id,Integer parent_id, String name, EAcademicUnit unit) {
		this.id = id;
		this.parent_id = parent_id;
		this.name = name;
		this.unit = unit;
	}

	public AcademicUnit() {

	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public Integer getCode() {
		return parent_id;
	}

	public void setCode(Integer code) {
		this.parent_id = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public EAcademicUnit getUnit() {
		return unit;
	}

	public void setUnit(EAcademicUnit unit) {
		this.unit = unit;
	}
	
	
	
}
