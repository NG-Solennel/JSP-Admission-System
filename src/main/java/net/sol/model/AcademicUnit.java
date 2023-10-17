package net.sol.model;

import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AcademicUnit {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private Integer parentId;
	private String name;

	@Enumerated(EnumType.STRING)
	@Column(name="unit")
	private EAcademicUnit unit;
	
	@ManyToMany(mappedBy="departments")
	private List<Course> courses;

	public AcademicUnit(Integer id,Integer parent_id, String name, EAcademicUnit unit) {
		this.id = id;
		this.parentId = parent_id;
		this.name = name;
		this.unit = unit;
	}

	public AcademicUnit() {

	}
	@JsonProperty("unit_id")
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	@JsonProperty("name")
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
	
	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	
	
	
}
