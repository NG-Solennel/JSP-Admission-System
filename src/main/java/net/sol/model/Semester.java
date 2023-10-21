package net.sol.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Semester {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
	private String name;
	private LocalDate startDate;
	private LocalDate endDate;
	private String academicYear;
	
	@OneToMany(mappedBy="semester")
	private List<Course> courses;

//	@OneToMany(mappedBy="semester")
//	private List<StudentRegistration> registrations;
//	
	public Semester() {
		// TODO Auto-generated constructor stub
	}
	public Semester(String name, LocalDate startDate, LocalDate endDate) {
		super();
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		int month = this.startDate.getMonthValue();
		Integer year = this.startDate.getYear();
		Integer previousYear = year -1;
		Integer nextYear = year + 1;
		if(month > 8) {
			this.academicYear = year.toString() + "-" + nextYear.toString();
		}
		this.academicYear =previousYear.toString() + "-" + year.toString();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear() {
		int month = this.startDate.getMonthValue();
		Integer year = this.startDate.getYear();
		Integer previousYear = year -1;
		Integer nextYear = year + 1;
		if(month > 8) {
			this.academicYear = year.toString() + "-" + nextYear.toString();
		}
		this.academicYear =previousYear.toString() + "-" + year.toString();
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	
	
}
